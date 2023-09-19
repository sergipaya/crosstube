package es.g01.crosstube.model.dao.impl;

import es.g01.crosstube.model.dao.IVotesDAO;
import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.User;
import es.g01.crosstube.model.dto.Vote;
import es.g01.crosstube.model.dto.types.ExerciseMuscle;
import es.g01.crosstube.utils.database.MySQLConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

@Service
public class SQLVotesDAO  implements IVotesDAO {

    private final MySQLConnection mySQLConnection;

    /**
     * Autoinyecta un constructor de mySQLConnection
     * @param mySQLConnection conexión
     */
    public SQLVotesDAO(@Autowired MySQLConnection mySQLConnection) {
        this.mySQLConnection = mySQLConnection;
    }

    @Override
    public Set<Vote> findByExercise(int exerciseId) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "SELECT * from votes where exercise_id = ?";
        HashSet<Vote> votes = new HashSet<>();
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, exerciseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Vote vote = mapSentenceToObject(rs);
                votes.add(vote);
            }
            return votes;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private Vote mapSentenceToObject(ResultSet rs) throws SQLException {
        int userId = rs.getInt("exercise_id");
        int rating = rs.getInt("rating");
        return new Vote(rating, new User(userId));
    }

    @Override
    public Vote findVote(Exercise exercise, User user) {
        String sql = "SELECT * FROM votes WHERE exercise_id = ? AND user_id = ?";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, exercise.getId());
            preparedStatement.setInt(2, user.getId());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Vote vote = new Vote(rs.getInt("rating"), user, exercise);
                return vote;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public boolean saveVote(Vote vote) {
        if (findVote(vote.getExercise(), vote.getUser()) == null) {
            return insert(vote);
        } else {
            return update(vote);
        }
    }

    private boolean insert(Vote vote) {
        String sql = "INSERT INTO votes VALUES (?,?,?)";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql))
        {
            preparedStatement.setInt(1, vote.getExercise().getId());
            preparedStatement.setInt(2, vote.getUser().getId());
            preparedStatement.setInt(3, vote.getRating());
            preparedStatement.executeUpdate();

            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private boolean update(Vote vote) {
        String sql = "UPDATE votes SET rating = ? WHERE exercise_id = ? AND user_id = ?";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql))
        {
            preparedStatement.setInt(1, vote.getRating());
            preparedStatement.setInt(2, vote.getExercise().getId());
            preparedStatement.setInt(3, vote.getUser().getId());
            preparedStatement.executeUpdate();

            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
}
