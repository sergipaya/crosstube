package es.g01.crosstube.model.dao.impl;

import es.g01.crosstube.exceptions.UserNotExistException;
import es.g01.crosstube.model.dao.IUserDAO;
import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Routine;
import es.g01.crosstube.model.dto.User;
import es.g01.crosstube.utils.database.MySQLConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Service
public class SQLUserDAO implements IUserDAO {

    private final MySQLConnection mySQLConnection;

    /**
     * Autoinyecta un constructor de mySQLConnection
     * @param mySQLConnection conexión
     */
    public SQLUserDAO(@Autowired MySQLConnection mySQLConnection) {
        this.mySQLConnection = mySQLConnection;
    }

    @Override
    public User findById(int id) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "SELECT * from users where user_id = ?";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapSentenceToObject(rs);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public User getById(int id) throws UserNotExistException {
        User user = findById(id);
        if(user == null) {
            throw new UserNotExistException("El usuario no existe");
        }
        return user;
    }

    @Override
    public User findByName(String name) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "SELECT * from users where name = ?";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapSentenceToObject(rs);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }


    private User mapSentenceToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("user_id");
        String name = rs.getString("name");
        String password = rs.getString("password");
        String email = rs.getString("email");
        return new User(id, name, password, email);
    }

    @Override
    public boolean setFavorite(User user, Exercise exercise) {
        if (isFavorite(user.getId(), exercise.getId())) {
            return deleteFavorite(user.getId(), exercise.getId());
        } else {
            return insertFavorite(user.getId(), exercise.getId());
        }
    }

    @Override
    public boolean isFavorite(int userId, int exerciseId) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "SELECT * FROM favourites WHERE user_id = ? AND exercise_id = ?";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, exerciseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private boolean insertFavorite(int userId, int exerciseId) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "INSERT INTO favourites VALUES (?,?)";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, exerciseId);
            ps.setInt(2, userId);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private boolean deleteFavorite(int userId, int exerciseId) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "DELETE FROM favourites WHERE user_id = ? AND exercise_id = ?";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, exerciseId);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public boolean existUser(User user) {
        return findByName(user.getName()) != null;
    }

    @Override
    public boolean isLogedUser(User user) {
        User dataBaseUser = findByName(user.getName());
        return dataBaseUser.getPassword().equals(user.getPassword());
    }

    @Override
    public boolean save(User user) {
        if(findById(user.getId()) == null) {
            return insert(user);
        } else {
            return update(user);
        }
    }

    private boolean insert(User user) {
        String sql = "INSERT INTO users (user_id,name,password,email) VALUES (?,?,?,?)";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1,user.getId());
            ps.setString(2, user.getName());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private boolean update(User user) {
        String sql = "UPDATE users SET name = ?,password = ?,email = ? WHERE user_id = ?";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setInt(4, user.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public int getLastUserId() {
        String sql = "SELECT MAX(user_id) AS lastUserId FROM users";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getInt("lastUserId");
            }
            return 0;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }

    }

    @Override
    public User findByRoutine(Routine routine) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "SELECT * FROM users WHERE user_id = (SELECT user_id FROM routines WHERE routine_id = ?)";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routine.getId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapSentenceToObject(rs);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
  
}
