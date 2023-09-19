package es.g01.crosstube.controllers;

import es.g01.crosstube.exceptions.ExerciseNotExistException;
import es.g01.crosstube.exceptions.InvalidVoteException;
import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.User;
import es.g01.crosstube.model.dto.Vote;
import es.g01.crosstube.model.repositories.ExerciseRepository;
import es.g01.crosstube.utils.Validator;
import org.springframework.beans.InvalidPropertyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * VotesController va a represetar el controlador de los votos, representando
 * la página de votos
 * @author G1-01
 */

@Controller
public class VotesController {

    private final String LOGGED_USER_KEY  = "userLogged";

    @Autowired
    private ExerciseRepository exerciseRepository;

    /**
     * Métodos post para guardar los votos de un usuario
     * @param httpSession sesión de usuario
     * @param exerciseId identificador de ejercicios
     * @param rating tasa
     * @param redirectAttributes redireccionador de atributos
     * @return redirect vista details
     * @throws ExerciseNotExistException si no existe el ejercicio
     * @throws InvalidVoteException si el voto es inválido
     */
    @PostMapping("votes/save")
    public String postFavoritesAction(HttpSession httpSession, @RequestParam String exerciseId, @RequestParam String rating,
                                      RedirectAttributes redirectAttributes) throws ExerciseNotExistException, InvalidVoteException {
        User user = (User) httpSession.getAttribute(LOGGED_USER_KEY);
        Exercise exercise = exerciseRepository.getById(Integer.parseInt(exerciseId));
        int ratingInt = Integer.parseInt(rating);

        if (ratingInt > 5 || ratingInt < 1) {
            throw new InvalidVoteException("Valor inválido");
        }

        Vote vote = new Vote(ratingInt, user, exercise);
        exerciseRepository.saveVote(vote);

        redirectAttributes.addAttribute("exerciseId", exercise.getId());
        return "redirect:/exercise/details";
    }

}
