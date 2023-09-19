package es.g01.crosstube.exceptions;

public class ExerciseNotExistException extends Exception {

    /**
     * Excepción para tratar los ejercicios que no existen
     * @param message mensaje
     */
    public ExerciseNotExistException(String message) {
        super(message);
    }

}
