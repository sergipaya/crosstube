package es.g01.crosstube.model.dao;

import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.exceptions.UserNotExistException;
import es.g01.crosstube.model.dto.Routine;
import es.g01.crosstube.model.dto.User;

public interface IUserDAO {

    /**
     * Busca un usuario a traves de un id pasado como argumento
     * @param id identificador del usuario
     * @return usuario
     */
    User findById(int id);

    /**
     * Inserta un ejercicio como favorito en la base de datos pasandole un usuario
     * y un ejercicio como parametros
     * @param user usuario
     * @param exercise ejercicio
     * @return booelano si se ha podido
     */
    boolean setFavorite(User user, Exercise exercise);

    /**
     * Comprueba si un usuario tiene un ejercicio como favorito
     * @param userId identificador del usuario
     * @param exerciseId identificador del ejercicio
     * @return booelano es favorito
     */
    boolean isFavorite(int userId, int exerciseId);

    /**
     * Busca un usuario a traves de un id pasado como argumento
     * @param id identificador del usuario
     * @return usuario
     * @throws UserNotExistException si no existe el usuario
     */
    User getById(int id) throws UserNotExistException;

    /**
     * Busca un usuario a traves de un nombre de usuario pasado como argumento
     * @param name nickname del usuario
     * @return usuario
     */
    User findByName(String name);

    /**
     * Comprueba si existe el usuario en la base de datos
     * @param user usuario
     * @return booleano dependiendo de si existe
     */
    boolean existUser(User user);

    /**
     * Busca si el usuario esta logeado
     * @param user usuario
     * @return booleano dependiendo de si está logeado
     */
    boolean isLogedUser(User user);

    /**
     * Guarda un usuario en la base de datos pasandole un usuario como argumento
     * @param user usuario
     * @return booelano si se ha podido insertar
     */
    boolean save(User user);

    /**
     * Devuelve el total de numeros de usuarios que hay
     * @return numero usuarios
     */
    int getLastUserId();

    /**
     * Busca un usuario a través de una rutina
     * @param routine rutina
     * @return usuario
     */
    User findByRoutine(Routine routine);

}
