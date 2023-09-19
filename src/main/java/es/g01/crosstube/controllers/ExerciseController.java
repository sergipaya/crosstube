
package es.g01.crosstube.controllers;

import es.g01.crosstube.exceptions.ExerciseNotExistException;
import es.g01.crosstube.model.dto.*;
import es.g01.crosstube.model.dto.types.ExerciseCore;
import es.g01.crosstube.model.dto.types.ExerciseMuscle;
import es.g01.crosstube.model.repositories.ExerciseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Set;

/**
 * ExerciseController va a represetar el cotnrolador del ejercicio
 * @author G1-01
 */

@Controller
public class ExerciseController {

    private final String LOGGED_USER_KEY  = "userLogged";

    @Autowired
    private ExerciseRepository exerciseRepository;

    /**
     * Mustra los detalles de una rutina, añadiendo sus atributos
     * correspondientes
     * @param exerciseId identificador del ejercicio
     * @param modelFromView modelo
     * @param httpSession sesión del usuario
     * @return vista
     * @throws ExerciseNotExistException si el ejercicio no existe
     */
    @GetMapping("exercise/details")
    public String getDetallesAction(@RequestParam int exerciseId, Model modelFromView, HttpSession httpSession) throws ExerciseNotExistException {
        Exercise exercise = exerciseRepository.getById(exerciseId);
        exerciseRepository.addView(exercise);
        if (exercise.getClass().equals(ExerciseCore.class)) {
            modelFromView.addAttribute("fatBurn", exercise.getFatBurn());
            modelFromView.addAttribute("time", exercise.getTimeString());
        }
        if (exercise.getClass().equals(ExerciseMuscle.class)) {
            modelFromView.addAttribute("exerciseMuscles",((ExerciseMuscle) exercise).getMuscleGroups());
        }

        Set<Level> levels = exerciseRepository.findAllLevels();
        modelFromView.addAttribute("levels", levels);
        ArrayList<MuscleGroup> muscleGroups = exerciseRepository.findAllMuscles();
        modelFromView.addAttribute("muscles", muscleGroups);
        modelFromView.addAttribute("exercise",exercise);
        modelFromView.addAttribute("level", exercise.getLevel());
        modelFromView.addAttribute("tittle","Detalles del ejercicio");
        User user = (User) httpSession.getAttribute(LOGGED_USER_KEY);
        if (user != null) {
            Vote vote = exerciseRepository.findVote(exercise, user);
            modelFromView.addAttribute("vote", vote);
            modelFromView.addAttribute("isFavorite", exerciseRepository.isFavorite(user.getId(), exerciseId));
            modelFromView.addAttribute("user", user);
        }

        return "exercise_detail";
    }

}


