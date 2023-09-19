package es.g01.crosstube.controllers;

import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Level;
import es.g01.crosstube.model.dto.MuscleGroup;
import es.g01.crosstube.model.dto.User;
import es.g01.crosstube.model.repositories.ExerciseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * MainController va a represetar el controlador de MainController, representando
 * la página inicial de ejercicios
 * @author G1-01
 */

@Controller
public class MainController {

    private final String LOGGED_USER_KEY = "userLogged";

    @Autowired
    private ExerciseRepository repository;

    @GetMapping("/")
    public String getInicio() {
        return "redirect:/inicio";
    }
    /**
     * Método get para mostrar la página principal de la página
     * @param params parametros
     * @param model modelos
     * @param httpSession sesión de usuario
     * @return retorna vista main
     */
    @GetMapping("inicio")
    public String getInicio(@RequestParam Map<String, String> params, Model model, HttpSession httpSession) {
        Set<Level> levels = repository.findAllLevels();
        ArrayList<MuscleGroup> muscleGroups = repository.findAllMuscles();
        model.addAttribute("muscles", muscleGroups);
        model.addAttribute("levels", levels);
        model.addAttribute("tittle", "INICIO");
        List<Exercise> exerciseMuscleSet = repository.findByType("MUSCLE", 4);
        model.addAttribute("muscleExercises", exerciseMuscleSet);
        List<Exercise> exerciseCardioSet = repository.findByType("CARDIO", 4);
        model.addAttribute("cardioExercises", exerciseCardioSet);
        if (params.get("userId") != null) {
            model.addAttribute(repository.findUserById(Integer.parseInt(params.get("userId"))));
            User user = (User) httpSession.getAttribute(LOGGED_USER_KEY);
            if (user != null) {
                model.addAttribute("user", user);
            }
        }
        return "main";
    }

}
