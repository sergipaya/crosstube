package es.g01.crosstube.utils.database;

import es.g01.crosstube.exceptions.DatabaseConnectionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * MySQLConnection, va a servir para representar la base de datos,
 * y para poder conectarnos con esta
 * @author G1-01
 */

@Service
public class MySQLConnection {

    private Connection connection;

    private String connectionURI;

    private String username;

    private String password;

    public MySQLConnection(String connectionURI, String username, String password) {
        this.connectionURI = connectionURI;
        this.username = username;
        this.password = password;
    }

    @Autowired
    public MySQLConnection(Environment environment){
        this.connectionURI = environment.getProperty("spring.datasource.url");
        this.username = environment.getProperty("spring.datasource.username");
        this.password = environment.getProperty("spring.datasource.password");
    }

    /**
     * Genera una conexión con la base de datos
     * @return conexión
     */
    public Connection getConnection() {
        try {
            if (connection != null && connection.isValid(2)) {
                return connection;
            }
            connection = DriverManager.getConnection(connectionURI, username, password);
            return connection;
        } catch (SQLException exception) {
            throw new DatabaseConnectionException(exception.getMessage());
        }
    }

}
