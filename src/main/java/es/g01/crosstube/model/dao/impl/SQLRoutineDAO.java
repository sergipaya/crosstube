package es.g01.crosstube.model.dao.impl;

import es.g01.crosstube.exceptions.RoutineNotExistException;
import es.g01.crosstube.model.dao.IRoutineDAO;
import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Routine;
import es.g01.crosstube.model.dto.User;
import es.g01.crosstube.utils.database.MySQLConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;

@Service
public class SQLRoutineDAO implements IRoutineDAO {

    private final MySQLConnection mySQLConnection;

    /**
     * Autoinyecta un constructor de mySQLConnection
     * @param mySQLConnection conexión
     */
    public SQLRoutineDAO(@Autowired MySQLConnection mySQLConnection) {
        this.mySQLConnection = mySQLConnection;
    }

    @Override
    public Routine getById(int routineId) throws RoutineNotExistException {
        Routine routine = findById(routineId);
        if (routine == null) {
            throw new RoutineNotExistException("Id de rutina inexistente");
        }
        return routine;
    }

    @Override
    public Routine findById(int routineId) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "SELECT * from routines where routine_id = ?";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routineId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapSentenceToObject(rs);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private Routine mapSentenceToObject(ResultSet rs) throws SQLException {
        int routineId = rs.getInt("routine_id");
        int difficulty = rs.getInt("difficulty");
        LocalDateTime date = rs.getTimestamp("date").toLocalDateTime();
        return new Routine(routineId,difficulty,date);
    }

    @Override
    public int getLastRoutineId() {
        String sql = "SELECT MAX(routine_id) AS lastRoutineId FROM routines";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("lastRoutineId");
            }
            return 0;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }


    @Override
    public boolean save(Routine routine) {
        if(findById(routine.getId()) == null) {
            if(insert(routine)) {
                return insertExercises(routine);
            }
        } else {
            return update(routine);
        }
        return false;
    }

    private boolean insertExercises(Routine routine) {
        ArrayList<Exercise> exercises = routine.getExercises();
        for(Exercise exercise: exercises) {
            String sql = "insert into routine_exercises values(?,?)";
            Connection connection = mySQLConnection.getConnection();
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1,exercise.getId());
                ps.setInt(2,routine.getId());
                ps.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return true;
    }

    private boolean insert(Routine routine) {
        String sql = "insert into routines values (?,?,?,?)";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1,routine.getId());
            ps.setInt(2, routine.getUser().getId());
            ps.setInt(3, routine.getDifficulty());
            ps.setTimestamp(4, Timestamp.valueOf(routine.getDate()));
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private boolean update(Routine routine) {
        String sql = "UPDATE routines SET user_id = ?, difficulty = ?, date = ? WHERE routine_id = ?";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routine.getUser().getId());
            ps.setInt(2, routine.getDifficulty());
            ps.setTimestamp(3, Timestamp.valueOf(routine.getDate()));
            ps.setInt(4, routine.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public ArrayList<Routine> findByUser(User user) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "SELECT * from routines where user_id = ?";
        ArrayList<Routine> routines = new ArrayList<>();
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, user.getId());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Routine routine = mapSentenceToObject(rs);
                routines.add(routine);
            }
            return routines;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public boolean deleteRoutine(Routine routine) {
        try {
            return delete(routine);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private boolean delete(Routine routine) throws SQLException {
        Connection connection = mySQLConnection.getConnection();
        connection.setAutoCommit(false);
        deleteExercises(routine, connection);
        String sql = "DELETE FROM routines WHERE routine_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routine.getId());
            int affectedRows = ps.executeUpdate();
            connection.commit();
            return affectedRows > 0;
        } catch (SQLException sqlException) {
            connection.rollback();
            throw sqlException;
        }
    }

    private boolean deleteExercises(Routine routine, Connection connection) throws SQLException {
        String sql = "DELETE FROM routine_exercises WHERE routine_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routine.getId());
            ps.executeUpdate();
            return true;
        }
    }

}
