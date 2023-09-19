package es.g01.crosstube.model.dao;

import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.User;
import es.g01.crosstube.model.dto.Vote;

import java.util.Set;

public interface IVotesDAO {

    /**
     * Busca los votos que tiene un ejercicio a traves de una id de ejercicio
     * @param exerciseId identificador del ejercicio
     * @return votos
     */
    Set<Vote> findByExercise(int exerciseId);

    /**
     * Guarda en la base de datos un voto
     * @param vote voto
     * @return booelano si se ha podido guardar
     */
    boolean saveVote(Vote vote);

    /**
     * Busca un voto en la base de datos pasandole el usuario que ha votado y el ejericio
     * @param exercise ejercicio
     * @param user usuario
     * @return voto
     */
    Vote findVote(Exercise exercise, User user);
}
