package es.g01.crosstube.model.dao.impl;

import es.g01.crosstube.exceptions.MuscleGroupNotExistException;
import es.g01.crosstube.model.dao.IMuscleDAO;
import es.g01.crosstube.model.dto.MuscleGroup;
import es.g01.crosstube.utils.database.MySQLConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@Service
public class SQLMuscleDAO implements IMuscleDAO {

    private final MySQLConnection mySQLConnection;

    /**
     * Autoinyecta un constructor de mySQLConnection
     * @param mySQLConnection conexión
     */
    public SQLMuscleDAO(@Autowired MySQLConnection mySQLConnection) {
        this.mySQLConnection = mySQLConnection;
    }

    @Override
    public MuscleGroup findByName(String searchedName) {
        String sql = "SELECT * FROM muscle_group WHERE name LIKE ?";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, searchedName);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                MuscleGroup muscleGroup = mapToEntity(rs);
                return muscleGroup;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public ArrayList<MuscleGroup> findAll() {
        String sql = "SELECT * FROM muscle_group";
        Connection connection = mySQLConnection.getConnection();
        ArrayList<MuscleGroup> muscleGroups = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                MuscleGroup muscleGroup = mapToEntity(rs);
                muscleGroups.add(muscleGroup);
            }
            return muscleGroups;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public MuscleGroup findById(int id) {
        String sql = "SELECT * FROM muscle_group WHERE muscle_group_id = ?";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                MuscleGroup muscleGroup = mapToEntity(rs);
                return muscleGroup;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public MuscleGroup getById(int id) throws MuscleGroupNotExistException {
        MuscleGroup muscleGroup = findById(id);
        if (muscleGroup == null) {
            throw new MuscleGroupNotExistException("Id de músculo no encontrada");
        }
        return muscleGroup;
    }

    private MuscleGroup mapToEntity(ResultSet rs) throws SQLException {
        int muscleId = rs.getInt("muscle_group_id");
        String muscleName = rs.getString("name");

        MuscleGroup muscleGroup = new MuscleGroup(muscleId,muscleName);
        return muscleGroup;
    }

    @Override
    public boolean save(MuscleGroup muscleGroup) {
        if (findById(muscleGroup.getId()) == null) {
            return insert(muscleGroup);
        } else {
            return update(muscleGroup);
        }
    }

    private boolean insert(MuscleGroup muscleGroup) {
        String sql = "INSERT INTO muscle_group VALUES (?,?)";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql))
        {
            preparedStatement.setInt(1, muscleGroup.getId());
            preparedStatement.setString(2, muscleGroup.getName());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private boolean update(MuscleGroup muscleGroup) {
        return false;
    }

}