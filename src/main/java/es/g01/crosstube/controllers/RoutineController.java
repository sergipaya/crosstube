package es.g01.crosstube.controllers;

import es.g01.crosstube.exceptions.NotEnougtExercisesFoundException;
import es.g01.crosstube.exceptions.RoutineNotExistException;
import es.g01.crosstube.exceptions.UserNotExistException;
import es.g01.crosstube.model.dto.*;
import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Level;
import es.g01.crosstube.model.dto.MuscleGroup;
import es.g01.crosstube.model.dto.Routine;
import es.g01.crosstube.model.repositories.ExerciseRepository;
import es.g01.crosstube.services.RoutineGenerateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * RoutineController va a represetar el controlador de RoutineController, representando
 * la página de rutinas
 * @author G1-01
 */

@Controller
public class RoutineController {

    private final String LOGGED_USER_KEY  = "userLogged";

    @Autowired
    private ExerciseRepository repository;

    /**
     * Método get para crear una rutina
     * @param model modelo
     * @return vista de routine_create
     */
    @GetMapping("/routine/create")
    public String routineCreateAction(Model model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute(LOGGED_USER_KEY);
        if(user != null) {
            model.addAttribute("user", user);
            Set<Level> level = repository.findAllLevels();
            model.addAttribute("tittle", "Nueva Rutina");
            model.addAttribute("levels", level);
            return "routine_create";
        }
        model.addAttribute("tittle", "Login");
        return "login";
    }

    /**
     * Método get para mostrar los detalles de la rutina
     * @param routineId identificador de la rutina
     * @param modelFromView modelo
     * @return vista routine_detail
     * @throws RoutineNotExistException si la rutina no existe
     */
    @GetMapping("/routine/detail")
    public String getRoutineDetailAction(@RequestParam int routineId, Model modelFromView) throws RoutineNotExistException {
        Set<Level> levels = repository.findAllLevels();
        ArrayList<MuscleGroup> muscleGroups = repository.findAllMuscles();
        modelFromView.addAttribute("muscles", muscleGroups);
        modelFromView.addAttribute("levels", levels);

        Routine routine = repository.getRoutineById(routineId);
        ArrayList<Exercise> exercises = routine.getExercises();
        int difficulty = routine.getDifficulty();

        modelFromView.addAttribute("difficulty", difficulty);
        modelFromView.addAttribute("exercises", exercises);
        modelFromView.addAttribute("routine", routine);
        return "routine_detail";
    }

    @PostMapping("/routine/create")
    public String postRoutineCreateAction(@RequestParam Map<String, String> params, HttpSession httpSession, RedirectAttributes redirectAttributes) {
        User user = (User) httpSession.getAttribute(LOGGED_USER_KEY);
        RoutineGenerateService routineGenerateService = new RoutineGenerateService(repository);
        if (user == null){
            return "redirect:/login";
        }
        try {
            Routine routine = routineGenerateService.generateRoutineFromForm(params, user);
            repository.saveRoutine(routine);
            redirectAttributes.addAttribute("routineId", routine.getId());
            return "redirect:/routine/detail";
        } catch (NotEnougtExercisesFoundException e) {
            HashMap<String, String> errors = new HashMap<>();
            errors.put("error", e.getMessage());
            redirectAttributes.addFlashAttribute("errors", errors);
            return "redirect:/routine/create";
        }
    }

    @GetMapping("/routine/history")
    public String getRoutineHistoryAction(Model modefFromView, HttpSession httpSession) throws UserNotExistException {
        User user = (User) httpSession.getAttribute(LOGGED_USER_KEY);
        if (user == null){
            return "redirect:/login";
        }
        ArrayList<Routine> routines = repository.findRoutinesByUser(user);
        modefFromView.addAttribute("routines", routines);
        modefFromView.addAttribute("user", user);

        return "routines_list";
    }

    @PostMapping("/routine/delete")
    public String postRoutineDeleteAction(@RequestParam int routineId, HttpSession httpSession) throws RoutineNotExistException {
        User user = (User) httpSession.getAttribute(LOGGED_USER_KEY);
        Routine routine = repository.getRoutineById(routineId);
        repository.deleteRoutine(routine);
        return "redirect:/routine/history?userId=" + user.getId();
    }

}
