package es.g01.crosstube.exceptions;

public class UserNotExistException extends Exception {

    /**
     * Excepción para tratar los usuarios que no existen
     * @param message mensaje
     */
    public UserNotExistException(String message) {
        super(message);
    }

}
