package es.g01.crosstube.model.dao;

import es.g01.crosstube.exceptions.LevelNotExistException;
import es.g01.crosstube.model.dto.Level;

import java.util.Set;

public interface ILevelDAO {

    /**
     * Busca un nivel a traves del nombre pasado como argumento
     * @param name del nivel
     * @return nivel
     */
    Level findByName(String name);

    /**
     * Busca un nivel a traves de un id pasado como argumento
     * @param id identificador del nivel
     * @return nivel
     */
    Level findById(int id);

    /**
     * Busca un nivel a traves de un id pasado como argumento,
     * tratando una excepción
     * @param id identificador del nivel
     * @return nivel
     * @throws LevelNotExistException si el nivel no existe
     */
    Level getById(int id) throws LevelNotExistException;

    /**
     * Hace una conexión a la base de datos para guardar el nivel
     * @param level
     * @return booleano dependiendo de si ha sido satisfactorio o no
     */
    boolean save(Level level);

    /**
     * Busca un nivel a traves del nombre pasado como argumento,
     * tratando una excepcion
     * @param name del nivel
     * @throws LevelNotExistException si el nivel no existe
     */
    Level getByName(String name) throws LevelNotExistException;

    /**
     * Busca todos los niveles que hay en la base de datos
     * @return niveles
     */
    Set<Level> findAll();

}
