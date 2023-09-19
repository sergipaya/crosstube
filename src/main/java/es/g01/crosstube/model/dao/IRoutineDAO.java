package es.g01.crosstube.model.dao;

import es.g01.crosstube.exceptions.RoutineNotExistException;
import es.g01.crosstube.model.dto.Routine;
import es.g01.crosstube.model.dto.User;

import java.util.ArrayList;

public interface IRoutineDAO {

    /**
     * Busca una rutina a traves de un id pasado como argumento
     * @param routineId identificador de la rutina
     * @return rutina
     * @throws RoutineNotExistException si no existe una rutina
     */
    Routine getById(int routineId) throws RoutineNotExistException;

    /**
     * Busca una rutina a traves de un id pasado como argumento
     * @param routineId identificador de la rutina
     * @return rutina
     */
    Routine findById(int routineId);

    /**
     * Obtiene el último id de las rutinas
     * @return último id
     */
    int getLastRoutineId();

    /**
     * Guarda en la base de datos la rutina pasada como argumento
     * @param routine rutina
     * @return boobleano del guardado
     */
    boolean save(Routine routine);

    public ArrayList<Routine> findByUser(User user);

    public boolean deleteRoutine(Routine routine);

}
