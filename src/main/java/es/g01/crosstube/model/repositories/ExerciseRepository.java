package es.g01.crosstube.model.repositories;

import es.g01.crosstube.exceptions.*;
import es.g01.crosstube.model.dao.IExerciseDAO;
import es.g01.crosstube.model.dao.ILevelDAO;
import es.g01.crosstube.model.dao.IMuscleDAO;
import es.g01.crosstube.model.dao.IVotesDAO;
import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Level;
import es.g01.crosstube.model.dto.MuscleGroup;
import es.g01.crosstube.model.dto.Vote;
import es.g01.crosstube.model.dao.*;
import es.g01.crosstube.model.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * ExerciseRepository va a represetar un repositorio de ejercicios.
 * Donde juntaremos todos los dao para insertarlos en el ejercicio
 * @author G1-01
 */

@Service
public class ExerciseRepository {

    private final IExerciseDAO exerciseDAO;

    private final ILevelDAO levelDAO;

    private final IMuscleDAO muscleDAO;

    private final IVotesDAO votesDAO;

    private final IUserDAO userDAO;

    private final IRoutineDAO routineDAO;

    @Autowired
    public ExerciseRepository(IExerciseDAO exerciseDAO, ILevelDAO levelDAO, IMuscleDAO muscleDAO,
                              IVotesDAO votesDAO, IUserDAO userDAO, IRoutineDAO routineDAO) {
        this.exerciseDAO = exerciseDAO;
        this.levelDAO = levelDAO;
        this.muscleDAO = muscleDAO;
        this.votesDAO = votesDAO;
        this.userDAO = userDAO;
        this.routineDAO = routineDAO;
    }

    /**
     * Nos devuelve un ejercicio a traves de una id pasada como argumento
     * @param id identificador del ejercicio
     * @return el ejercicio encontrado
     * @throws ExerciseNotExistException en el caso de que no exista el ejercicio
     */
    public Exercise getById(int id) throws ExerciseNotExistException {
        Exercise exercise = this.findById(id);
        if (exercise == null) {
            throw new ExerciseNotExistException("Id de ejercicio no encontrada");
        }
        return exercise;
    }

    /**
     * Busca el ejercicio por una id y lo rellena añadiendole los votos, y añadiendole el nivel
     * @param exerciseId identificador del ejercicio
     * @return ejercicio
     */
    public Exercise findById(int exerciseId) {
        Exercise exercise = exerciseDAO.findById(exerciseId);
        Set<Vote> votes = votesDAO.findByExercise(exerciseId);
        exercise.setVotes((HashSet<Vote>) votes);
        Level level = levelDAO.findById(exercise.getLevel().getId());
        exercise.setLevel(level);
        return exercise;
    }

    /**
     * Rellena un ejercicio añadiendole los votos, y añadiendole el nivel
     * @param exercise ejercicio
     */
    public void addAgregados(Exercise exercise) {
        Set<Vote> votes = votesDAO.findByExercise(exercise.getId());
        exercise.setVotes((HashSet<Vote>) votes);
        Level level = levelDAO.findById(exercise.getLevel().getId());
        exercise.setLevel(level);
    }

    /**
     * Busca todos los ejercicios a partir de un tipo, pasandole el tipo y las paginas
     * @param type tipo de ejercicio
     * @param pageSize numero de página
     * @return ejercicios
     */
    public List<Exercise> findByType(String type, Integer pageSize) {
        List<Exercise> exercises = exerciseDAO.findByType(type, pageSize);
        for(Exercise exercise : exercises) {
            addAgregados(exercise);
        }
        return exercises;
    }

    /**
     * Busca todos los niveles
     * @return niveles
     */
    public Set<Level> findAllLevels() {
        return levelDAO.findAll();
    }

    /**
     * Busca todos los grupos musculares
     * @return grupos musculares
     */
    public ArrayList<MuscleGroup> findAllMuscles() {
        return muscleDAO.findAll();
    }

    /**
     * Busca los ejercicios a traves de los parametros, limitando la consulta.
     * @param params paramtros pasados
     * @param offset limite
     * @param limit limite
     * @return ejercicios
     */
    public List<Exercise> getExercicesByParams(Map<String, String> params, int offset, int limit) {
        List<Exercise> exercises = exerciseDAO.getExercicesByParams(params, offset, limit);
        ArrayList<Exercise> exerciseLlenos = new ArrayList();
        for (Exercise exercise: exercises) {
            addAgregados(exercise);
            exerciseLlenos.add(exercise);
        }
        return exerciseLlenos;
    }

    /**
     * Busca el nivel a traves de una id
     * @param id identificador del nivel
     * @return nivel
     */
    public Level getLevelById(int id) {
        try {
            return levelDAO.getById(id);
        } catch (LevelNotExistException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    /**
     * Busca un grupo muscular a través de una id
     * @param id identificador del grupo muscular
     * @return grupo muscular
     */
    public MuscleGroup getMuscleGroupById(int id) {
        try {
            return muscleDAO.getById(id);
        } catch (MuscleGroupNotExistException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    /**
     * Busca un usuario a través de una id
     * @param userId identificador del usuario
     * @return usuario
     */
    public User findUserById(int userId) {
        return userDAO.findById(userId);
    }

    public User getUserById(int userId) throws UserNotExistException {
        return userDAO.getById(userId);
    }

    /**
     * Inserta un ejercicio a un usuario como favorito
     * @param user usuario
     * @param exercise ejercicio
     * @return booleano si se ha insertado
     */
    public boolean setFavorite(User user, Exercise exercise) {
        return userDAO.setFavorite(user, exercise);
    }

    /**
     * Guarda el voto pasado como argumento
     * @param vote voto
     * @return booleano si se ha guardado
     */
    public boolean saveVote(Vote vote) {
        return votesDAO.saveVote(vote);
    }

    /**
     * Buscar el usuario para ver si existe
     * @param user usuario
     * @return booleano existe
     */
    public boolean existUser(User user) {
        return userDAO.existUser(user);
    }

    /**
     * Busca si un usuario esta logeado
     * @param user usuario
     * @return booleano el usuario esta logeado
     */
    public boolean isUserLoged(User user) {
        return userDAO.isLogedUser(user);
    }

    /**
     * Busca si es el usuario pasado como id y el ejercicio pasado como id
     * esta en favoritos
     * @param userId identificador del usuario
     * @param exerciseId identificador del ejercicio
     * @return booleano si esta en favoritos
     */
    public boolean isFavorite(int userId, int exerciseId) {
        return userDAO.isFavorite(userId, exerciseId);
    }

    /**
     * Busca el usuario por el nombre pasado como argumento
     * @param name nickname del usuario
     * @return booleano si el nombre existe
     */
    public User findUserByName(String name) {
        return userDAO.findByName(name);
    }

    /**
     * Devuelve el id del próximo usuario
     * @return número del proximo usuaraio
     */
    public int getNextUserId() {
        return userDAO.getLastUserId() + 1;
    }

    /**
     * Guarda el usuario en la base de datos
     * @param user usuario
     * @return booleano si se ha guardado
     */
    public boolean saveUser(User user) {
        return userDAO.save(user);
    }

    /**
     * Busca el número de resultados a través de los parametros
     * @param params parametros pasados
     * @return número de resultados
     */
    public int getNumberResults(Map<String, String> params) {
        return exerciseDAO.getNumberResults(params);
    }

    /**
     * Busca la media de un ejercicio pasado como id
     * @param id identificador del ejercicio
     * @return la media del ejercicio
     */
    public float getAvgRatingFromId(int id) {
        return exerciseDAO.getAvgRatingFromId(id);
    }

    /**
     * Busca el voto a través de un ejercicio y un usuario pasado como parametros
     * @param exercise ejercicio
     * @param user usuario
     * @return voto
     */
    public Vote findVote(Exercise exercise, User user) {
        return votesDAO.findVote(exercise, user);
    }

    /**
     * Añade una visita a un ejercicio
     * @param exercise ejericio
     * @return booleano si se ha añadido la visita
     */
    public boolean addView(Exercise exercise) {
        return exerciseDAO.addView(exercise);
    }

    /**
     * Buysca una rutina por id
     * @param routineId identificador de la rutina
     * @return rutina
     * @throws RoutineNotExistException si no existe la rutina
     */
    public Routine getRoutineById(int routineId) throws RoutineNotExistException {
        Routine routine = routineDAO.getById(routineId);
        User user = userDAO.findByRoutine(routine);
        routine.setUser(user);
        ArrayList<Exercise> routineExercises = exerciseDAO.findByRoutine(routine);
        routine.setExercises(routineExercises);
        return routine;
    }

    /**
     * Busca el total de resultados que cumplen con el tipo de ejercicio
     * @param type tipo de ejercicio
     * @return número de ejercicios
     */
    public int getNumberResultsSentenceFindByType(String type) {
        return exerciseDAO.getNumberResultsSentenceFindByType(type);
    }

    /**
     * Busca por tipo especificando unos parametros y teniendo limitado la busqueda
     * @param params parametros pasados
     * @param type tipo de ejercicio
     * @param offsetDefault límite
     * @param limitDefault límite
     * @return listado ejercicios
     */
    public List<Exercise> getByType(Map<String,String> params, String type, int offsetDefault, int limitDefault) {
        List<Exercise> ejercicios = exerciseDAO.getByType(params,type,offsetDefault,limitDefault);
        List<Exercise> exercisesVacios = new ArrayList<>();
        for (Exercise exercise: ejercicios) {
            addAgregados(exercise);
            exercisesVacios.add(exercise);
        }
        return exercisesVacios;
    }

    public ArrayList<Exercise> getMuscleExercisesForRoutine(String muscleName, int levelId, int calisthenics) {
        return exerciseDAO.getMuscleExercisesForRoutine(muscleName, levelId, calisthenics);
    }

    public ArrayList<Exercise> getCardioExercisesForRoutine(int levelId, int calisthenics) {
        return exerciseDAO.getCardioExercisesForRoutine(levelId, calisthenics);
    }

    /**
     * Obtener el id de la próxima nueva rutina
     * @return número de la próxima rutina
     */
    public int getNextRoutineId() {
        return routineDAO.getLastRoutineId() + 1;
    }

    /**
     * Busca un usuario a través de una rutina pasada como argumento
     * @param routine rutina
     * @return usuario
     */
    public User findUserByRoutine(Routine routine) {
        return userDAO.findByRoutine(routine);
    }

    /**
     * Guarda la rutina en la base de datos
     * @param routine rutina pasada como argumento
     * @return booleano guardado
     */
    public boolean saveRoutine(Routine routine) {
        return routineDAO.save(routine);
    }

    /**
     * Obtiene los favoritos de un usuario
     * @param user usuario pasado como argumento
     * @return conjuto de ejercicios
     */
    public ArrayList<Exercise> getFavouritesFromUser(User user) {
        ArrayList<Exercise> exercises = exerciseDAO.getFavouritesFromUser(user);
        for (Exercise exercise:exercises) {
            addAgregados(exercise);
        }
        return exercises;
    }

    public ArrayList<Routine> findRoutinesByUser(User user) {
        ArrayList<Routine> routines = routineDAO.findByUser(user);
        for (Routine routine:routines) {
            routine.setExercises(exerciseDAO.findByRoutine(routine));
        }
        return routines;
    }

    public boolean deleteRoutine(Routine routine) {
        return routineDAO.deleteRoutine(routine);
    }

}

