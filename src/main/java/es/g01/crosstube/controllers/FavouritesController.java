package es.g01.crosstube.controllers;

import es.g01.crosstube.exceptions.ExerciseNotExistException;
import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.User;
import es.g01.crosstube.model.repositories.ExerciseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 * FavouritesController va a represetar el cotnrolador de añadir los ejercicios
 * como favoritos
 * @author G1-01
 */

@Controller
public class FavouritesController {

    private final String LOGGED_USER_KEY  = "userLogged";

    @Autowired
    private ExerciseRepository exerciseRepository;

    /**
     * Añade el ejercicio como favorito
     * @param httpSession sesión del usuario
     * @param exerciseId identificador del ejercicio
     * @param redirectAttributes redireccinador de atributos
     * @return vista
     * @throws ExerciseNotExistException si no existe el ejercicio
     */
    @PostMapping("favourites/save")
    public String postFavoritesAction(HttpSession httpSession, @RequestParam String exerciseId, RedirectAttributes redirectAttributes) throws ExerciseNotExistException {
        User user = (User) httpSession.getAttribute(LOGGED_USER_KEY);
        Exercise exercise = exerciseRepository.getById(Integer.parseInt(exerciseId));

        redirectAttributes.addAttribute("exerciseId", exercise.getId());

        user.addFavorite(exercise);
        exerciseRepository.setFavorite(user, exercise);

        return "redirect:/exercise/details";
    }

    /**
     * Método get para obtener los ejercicios favoritos de un usuario
     * @param userId identificador de un usuario
     * @param model modelo
     * @return vista de exercises_favourites
     */
    @GetMapping("exercises/favourites")
    public String getFavouritesAction(@RequestParam int userId, Model model) {
        User user = exerciseRepository.findUserById(userId);
        ArrayList<Exercise> exercises = exerciseRepository.getFavouritesFromUser(user);
        model.addAttribute("exercises", exercises);
        model.addAttribute("tittle", "Favoritos de " + user.getName());
        return "exercises_favourites";
    }

}
