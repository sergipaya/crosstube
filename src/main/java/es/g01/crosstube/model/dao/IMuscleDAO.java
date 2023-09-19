package es.g01.crosstube.model.dao;

import es.g01.crosstube.exceptions.MuscleGroupNotExistException;
import es.g01.crosstube.model.dto.MuscleGroup;

import java.util.ArrayList;

public interface IMuscleDAO {

    /**
     * Busca el grupo muscular a partir de un nombre pasado como argumento
     * @param searchedName nombre del grupo muscular
     * @return grupo muscular
     */
    MuscleGroup findByName(String searchedName);

    /**
     * Hace una conexión a la base de datos para guardar el nivel
     * @param muscleGroup grupo muscular
     * @return booleano dependiendo de si ha sido satisfactorio o no
     */
    boolean save(MuscleGroup muscleGroup);

    /**
     * Busca todos los grupo musculares que hay en la base de datos
     * @return grupos musculares
     */
    ArrayList<MuscleGroup> findAll();

    /**
     * Busca el grupo muscular a traves de una id pasado como argumento
     * @param id identificador del grupo muscular
     * @return grupo muscular
     */
    MuscleGroup findById(int id);

    /**
     * Busca el grupo muscular a traves de una id pasado como argumento
     * tratando una excepción
     * @param id identificador del grupo muscular
     * @return grupo muscular
     * @throws MuscleGroupNotExistException si el grupo muscular no existe
     */
    MuscleGroup getById(int id) throws MuscleGroupNotExistException;

}