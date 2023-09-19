package es.g01.crosstube.exceptions;

public class MuscleGroupNotExistException extends Exception{

    /**
     * Excepción para tratar los grupos musculares que no existen
     * @param message mensaje
     */
    public MuscleGroupNotExistException(String message) {
        super(message);
    }
}
