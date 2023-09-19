package es.g01.crosstube.model.dao;

import es.g01.crosstube.exceptions.ExerciseNotExistException;
import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Routine;
import es.g01.crosstube.model.dto.User;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface IExerciseDAO {

    /**
     * Hace una conexión a la base de datos para guardar el ejercicio
     * @param exercise el ejercicio que queremos guardar
     * @return booleano dependiendo de si ha sido satisfactorio o no
     */
    boolean save(Exercise exercise);

    /**
     * Nos devuelve un ejercicio a traves de una id pasada como argumento
     * @param id identificador del ejercicio
     * @return el ejercicio encontrado
     * @throws ExerciseNotExistException en el caso de que no exista el ejercicio
     */
    Exercise getById(int id) throws ExerciseNotExistException;

    /**
     * Nos devuelve un ejercicio a traves de una id pasada como argumento
     * @param exerciseId identificador del ejercicio
     * @return el ejercicio encontrado
     */
    Exercise findById(int exerciseId);

    /**
     * Retorna los ejercicios que cuenten con los parametros pasados como argumento
     * y limitados
     * @param params parametros pasados
     * @param offset sentencia limit mysql
     * @param limit sentencia limit mysql
     * @return listado de ejercicios
     */
    List<Exercise> getExercicesByParams(Map<String, String> params, int offset, int limit);

    /**
     * Busca el tipo de ejercicio pasandole el tipo de ejercicio y el numero
     * de páginas.
     * @param type tipo de ejercicio
     * @param pageSize número de página
     * @return el conjunto de ejercicios
     */
    List<Exercise> findByType(String type, Integer pageSize);

    /**
     * Devuelve la media de votos que tiene un ejercicio, haciendo una
     * conexión a la base de datos.
     * @param id identificador del ejercicio
     * @return la media del ejericio
     */
    float getAvgRatingFromId(int id);

    /**
     * Busca el numero de resultados de los ejercicios
     * @param params parametros pasados
     * @return total de ejercicios
     */
    int getNumberResults(Map<String, String> params) ;

    /**
     * Inserta en la base de datos el total de visitas que ha tenido
     * un ejercicio
     * @param exercise ejercicio
     * @return booleano dependiendo de si ha sido satisfactorio o no
     */
    boolean addView(Exercise exercise);

    //List<Exercise> getByType(String type, int offsetDefault, int limitDefault);

    /**
     * Devuelve el número de resultados que tienen los ejercicios
     * de un típo en especifico
     * @param type tipo de ejercicio
     * @return número de ejercicios
     */
    int getNumberResultsSentenceFindByType(String type);

    /**
     * Obtiene los ejercicios especificados por un típo, y ordenados
     * por unos parametros
     * @param params parametros pasaados
     * @param type tipo de ejercicio
     * @param offsetDefault limit
     * @param limitDefault limit
     * @return ejercicios
     */
    List<Exercise> getByType(Map<String,String> params, String type, int offsetDefault, int limitDefault);

    /**
     * Nos devuelve un conjunto de ejercicios a traves de una rutina
     * @param routine rutina pasada
     * @return ejercicios
     */
    ArrayList<Exercise> findByRoutine(Routine routine);

    /**
     * Obtiene un conjunto de ejercicios de musculos a través de unos parámetros pasados como argumento
     * @param muscleName nombre del grupo muscular
     * @param numberOfExercises número del ejercicio
     * @param levelId identificador del nivel
     * @param calisthenics booleano
     * @return conjunto de ejercicios
     */
   ArrayList<Exercise> getMuscleExercisesForRoutine(String muscleName, int levelId, int calisthenics);

    /**
     * Obtiene un conjunto de ejerciccios de tipo cardio a través de unos parametros
     * @param numberOfExercises numero de ejercicios
     * @param levelId identificador de nivle
     * @param calisthenics boobleano
     * @return conjunto de ejercicios
     */
    ArrayList<Exercise> getCardioExercisesForRoutine(int levelId, int calisthenics);

    /**
     * Obtiene un conjunto de ejercicios favoritos a través de un usuario pasado como argumento
     * @param user usuario
     * @return conjunto de ejercicios
     */
    ArrayList<Exercise> getFavouritesFromUser(User user);
}