package es.g01.crosstube.exceptions;

public class InvalidVoteException extends Exception{

    /**
     * Excepción para tratar los votos invalidos
     * @param message mensaje
     */
    public InvalidVoteException(String message) {
        super(message);
    }

}
