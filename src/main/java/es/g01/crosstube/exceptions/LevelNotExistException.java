package es.g01.crosstube.exceptions;

public class LevelNotExistException extends Exception {

    /**
     * Excepción para tratar losniveles que no existen
     */
    public LevelNotExistException() {
        super("El nivel no ha sido encontrado");
    }

    /**
     * Excepción para tratar los niveles que no existen
     * @param message mensaje
     */
    public LevelNotExistException(String message) {
        super(message);
    }
}
