package es.g01.crosstube.exceptions;

public class DatabaseConnectionException extends RuntimeException {

    /**
     * Excepción para tratar las conexiones de la base de datos
     * @param msg mensaje
     */
    public DatabaseConnectionException(String msg) {
        super(msg);
    }

}

