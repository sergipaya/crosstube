package es.g01.crosstube.utils;

/**
 * Validator va a represetar un validador para validar las entradas
 * @author G1-01
 */

public class Validator {

    private static final String REGEXP_EMAIL = "^[a-z0-9!#$%&'*+=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";

    /**
     * Comprueba si el email pasado cumple con la expresión regular
     * @param email introducido
     * @return booleano si cumple la condición
     */
    public static boolean isEmailValid(String email) {
        return email.matches(REGEXP_EMAIL);
    }

}

