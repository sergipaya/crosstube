package es.g01.crosstube.exceptions;

public class NotEnougtExercisesFoundException extends RuntimeException {

    /**
     * Excepción para tratar que no hay suficientes ejercicios
     * @param msg mensaje
     */
    public NotEnougtExercisesFoundException(String msg) {
        super(msg);
    }

}

