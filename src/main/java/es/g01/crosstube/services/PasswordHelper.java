package es.g01.crosstube.services;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

/**
 * PasswordHelper, va a servir para generar un hash de una contraseña
 * y para comprobar que corresponde un hash a una contraseña
 * @author G1-01
 */

@Service
public class PasswordHelper {

    /**
     * Genera el hash de la contraseña a traves de una password pasada como argumento
     * @param password
     * @return hashCode
     */
    public String generateHashCode(String password) {
        return DigestUtils.sha1Hex(password);
    }

    /**
     * Verifica si el password y el hashCode pasado
     * @param password
     * @param hashCode
     * @return booleano si coinciden
     */
    public boolean verify(String password, String hashCode) {
        return generateHashCode(password).equals(hashCode);
    }

}
