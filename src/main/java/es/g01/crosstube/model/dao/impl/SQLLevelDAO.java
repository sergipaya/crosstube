package es.g01.crosstube.model.dao.impl;

import es.g01.crosstube.exceptions.DatabaseConnectionException;
import es.g01.crosstube.exceptions.LevelNotExistException;
import es.g01.crosstube.model.dao.ILevelDAO;
import es.g01.crosstube.model.dto.Level;
import es.g01.crosstube.utils.database.MySQLConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

@Service
public class SQLLevelDAO implements ILevelDAO {

    private final MySQLConnection mySQLConnection;

    /**
     * Autoinyecta un constructor de mySQLConnection
     * @param mySQLConnection conexión
     */
    public SQLLevelDAO(@Autowired MySQLConnection mySQLConnection) {
        this.mySQLConnection = mySQLConnection;
    }

    @Override
    public Level findByName(String name) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "SELECT * from levels where level_name = ?";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapToEntity(rs);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public Level getByName(String name) throws LevelNotExistException {
        Level level = findByName(name);
        if (level == null) {
            throw new LevelNotExistException();
        }
        return level;
    }


    @Override
    public Level findById(int id) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "SELECT * from levels where level_id = ?";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapToEntity(rs);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public Level getById(int id) throws LevelNotExistException{
        Level level = findById(id);
        if (level == null) {
            throw new LevelNotExistException();
        }
        return level;
    }

    private Level mapToEntity(ResultSet rs) throws SQLException {
        int id = rs.getInt("level_id");
        String levelName = rs.getString("level_name");
        String description = rs.getString("description");
        int value = rs.getInt("value");
        return new Level(id,levelName,value,description);
    }

    @Override
    public boolean save(Level level) {
        if (findById(level.getId()) == null) {
            return insert(level);
        }else {
            return false;
        }
    }

    private boolean insert(Level level) {
        Connection connection = mySQLConnection.getConnection();
        String sql = "INSERT INTO levels VALUES (?,?,?,?)";
        try(PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1,level.getId());
            ps.setString(2,level.getName());
            ps.setString(3,level.getDescription());
            ps.setInt(4,level.getValue());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new DatabaseConnectionException(e.getMessage());
        }
    }

    @Override
    public Set<Level> findAll() {
        Connection connection = mySQLConnection.getConnection();
        String sql = "SELECT * from levels";
        try (Statement statement = connection.createStatement()) {
            Set<Level> levels = new HashSet<>();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                levels.add(mapToEntity(rs));
            }
            return levels;
        } catch (SQLException e) {
            throw new DatabaseConnectionException(e.getMessage());
        }
    }

}
