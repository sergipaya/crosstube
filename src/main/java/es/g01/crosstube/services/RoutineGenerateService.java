package es.g01.crosstube.services;


import es.g01.crosstube.exceptions.NotEnougtExercisesFoundException;
import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Routine;
import es.g01.crosstube.model.dto.User;
import es.g01.crosstube.model.repositories.ExerciseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;

@Service
public class RoutineGenerateService {

    private ExerciseRepository repository;

    private String[] nameMuscleParams = {"hombros", "espalda", "pecho", "biceps", "triceps", "hamstring", "core", "grip", "lumbar", "cuadriceps", "gluteos"};

    private String[] nameMuscleDatabase = {"Hombros", "Espalda", "Pecho", "Biceps", "Triceps", "Hamstring", "Core", "Agarre (grip)", "Lumbar", "Cuadriceps", "Glúteos"};


    @Autowired
    public RoutineGenerateService(ExerciseRepository repository) {
        this.repository = repository;
    }

    /**
     * Cuenta el numero de ejercicios que ha en el formulario
     * @param params parametros pasados como argumentos
     * @return numero de ejercicios
     */
    public int countExercisesFromForm(Map<String, String> params) {
        int numExercises = 0;
        numExercises += Integer.parseInt(params.get("hombros"));
        numExercises += Integer.parseInt(params.get("espalda"));
        numExercises += Integer.parseInt(params.get("pecho"));
        numExercises += Integer.parseInt(params.get("biceps"));
        numExercises += Integer.parseInt(params.get("triceps"));
        numExercises += Integer.parseInt(params.get("hamstring"));
        numExercises += Integer.parseInt(params.get("core"));
        numExercises += Integer.parseInt(params.get("cardio"));
        numExercises += Integer.parseInt(params.get("grip"));
        numExercises += Integer.parseInt(params.get("lumbar"));
        numExercises += Integer.parseInt(params.get("cuadriceps"));
        numExercises += Integer.parseInt(params.get("gluteos"));
        return numExercises;
    }

    /**
     * Genera una rutina a través del formulario
     * @param params parametros pasados como argumentos
     * @param user usuario pasado como argumento
     * @return rutina
     */
    public Routine generateRoutineFromForm(Map<String, String> params, User user) {
        int numEjercicios = countExercisesFromForm(params);
        if (numEjercicios < 1 || numEjercicios > 10) {
            throw new NotEnougtExercisesFoundException("Debe Seleccionar entre 1 y 10 ejercicios");
        }
        ArrayList<Exercise> exercises = fillExercisesFromForm(params);
        return new Routine(repository.getNextRoutineId(), LocalDateTime.now(), exercises, user);
    }

    private ArrayList<Exercise> fillExercisesFromForm(Map<String, String> params) {
        HashSet<Exercise> exercises = new HashSet<>();
        int levelId = 0;
        if(!params.get("difficulty").equals("Level")) {
            levelId = Integer.parseInt(params.get("difficulty"));
        }
        int calisthenic = 0;
        if(params.get("calisthenics") != null) {
            calisthenic = 1;
        }

        int countExercises = 0;
        for (int i = 0; i < nameMuscleDatabase.length; i++) {
            int actualNumExercise = Integer.parseInt(params.get(nameMuscleParams[i]));
            if(actualNumExercise > 0) {
                countExercises += actualNumExercise;
                ArrayList<Exercise> actualExercises = repository.getMuscleExercisesForRoutine(nameMuscleDatabase[i], levelId, calisthenic);
                if(actualExercises.size() >= actualNumExercise) {
                    for(int j = 0; exercises.size() < countExercises; j++) {
                        exercises.add(actualExercises.get(j));
                    }
                } else {
                    throw new NotEnougtExercisesFoundException("No hay suficientes ejercicios de " + nameMuscleDatabase[i]
                            + ". " + actualExercises.size() + " de " + actualNumExercise + " ejercicios disponibles");
                }
            }
        }

        int numCardioExercises = Integer.parseInt(params.get("cardio"));
        ArrayList<Exercise> cardioExercises = repository.getCardioExercisesForRoutine(levelId, calisthenic);
        if(cardioExercises.size() >= numCardioExercises) {
            for(int k = 0; exercises.size() < (numCardioExercises + countExercises); k++) {
                exercises.add(cardioExercises.get(k));
            }
        } else {
            throw new NotEnougtExercisesFoundException("No hay suficientes ejercicios de Cardio. "
                    + cardioExercises.size() + " de " + numCardioExercises + " ejercicios disponibles");
        }

        ArrayList<Exercise> exercises1 = new ArrayList<>();
        exercises1.addAll(exercises);
        return exercises1;
    }
}
