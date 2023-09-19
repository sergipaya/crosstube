package es.g01.crosstube.exceptions;

public class RoutineNotExistException extends Exception{

    /**
     * Excepción para tratar las rutinas que no existen
     * @param message mensaje
     */
    public RoutineNotExistException(String message) {
            super(message);
        }

}
