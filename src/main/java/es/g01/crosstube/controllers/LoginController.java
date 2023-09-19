package es.g01.crosstube.controllers;

import es.g01.crosstube.model.dto.User;
import es.g01.crosstube.model.repositories.ExerciseRepository;
import es.g01.crosstube.services.PasswordHelper;
import es.g01.crosstube.utils.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * LoginController va a represetar el controlador de los usuarios, así como añadirlos
 * logearse o deslogearse, entre otras cosas
 * @author G1-01
 */

@Controller
public class LoginController {

    private final String LOGGED_USER_KEY  = "userLogged";

    @Autowired
    private PasswordHelper passwordHelper;

    @Autowired
    private ExerciseRepository repository;

    /**
     * Método get para el login
     * @param params  parametros
     * @param model modelo
     * @return vista de user_form
     */
    @GetMapping("user/login")
    public String getUserAction(@RequestParam Map<String, String> params, Model model) {
        if(params.containsKey("userId")) {
            int userId = Integer.parseInt(params.get("userId"));
            User user = repository.findUserById(userId);
            model.addAttribute("user", user);
            model.addAttribute("tittle", "Perfil de " + user.getName());
            return "user_form";
        }

        model.addAttribute("tittle", "Bienvenido a Crosstube");
        return "login";
    }

    /**
     * Método post de login, para logearse con los parametros pasados
     * @param params parametros
     * @param redirectAttributes redireccionamiento de atributo
     * @param httpSession sesión de usuario
     * @return redireccionamiento a inicio
     */
    @PostMapping("user/login")
    public String postUserAction(@RequestParam Map<String, String> params, RedirectAttributes redirectAttributes, HttpSession httpSession) {
        String name = params.get("usuario");
        String password = params.get("password");
        HashMap<String, String> errors = new HashMap<>();
        User user = repository.findUserByName(name);
        if(user != null && passwordHelper.verify(password, user.getPassword())) {
            httpSession.setAttribute(LOGGED_USER_KEY, user);
            return "redirect:/inicio";
        }else {
            errors.put("Error:", " Usuario o password incorrectos");
            redirectAttributes.addFlashAttribute("errors",errors);
            return "redirect:/user/login";
        }
    }

    /**
     * Método get para añadir un usuario
     * @param params parametros
     * @param redirectAttributes redireccionamiento de atributos
     * @param model modelo
     * @return vista user_form
     */
    @GetMapping("user/add")
    public String getUserAddAction(@RequestParam Map<String, String> params, RedirectAttributes redirectAttributes, Model model) {
        if(params.containsKey("userId")) {
            User user = repository.findUserById(Integer.parseInt(params.get("userId")));
            model.addAttribute("user", user);
            model.addAttribute("tittle", "Perfil de usuario");
            return "user_form";
        } else {
            model.addAttribute("tittle", "Nuevo usuario");
            return "user_form";
        }
    }

    /**
     * Metodo post para añadir a un usuario con su nombre, contraseña y email,
     * además la contraseña de este se cifrará
     * @param params parametros
     * @param redirectAttributes redireccionamiento de atributos
     * @param httpSession sesión de usuario
     * @return redirecciona a inicio
     */
    @PostMapping("user/add")
    public String postUserAddAction(@RequestParam Map<String, String> params, RedirectAttributes redirectAttributes, HttpSession httpSession) {
        String name = params.get("usuario");
        String password = params.get("password");
        String passwordHash = passwordHelper.generateHashCode(password);
        String email = params.get("email");
        int userId;
        if(params.containsKey("userId")) {
             userId = Integer.parseInt(params.get("userId"));
        } else {
            userId = 0;
        }
        HashMap<String, String> errors = new HashMap<>();

        if(userId == 0 && repository.existUser(new User(name))) {
            errors.put("Nombre incorrecto", "El nombre ya está utilizandose, elige otro");
        }
        if(!Validator.isEmailValid(email)) {
            errors.put("Email inválido", "El email no es válido");
        }
        if(userId != 0) {
            User user1 = repository.findUserById(userId);
            if(!user1.getName().equals(name)) {
                errors.put("Nombre incorrecto", "El nombre ya está utilizandose, elige otro");
            }
            userId = Integer.parseInt(params.get("userId"));
        } else {
            userId = repository.getNextUserId();
        }
        User user;
        if(password.equals("")) {
            User repoUser = repository.findUserById(userId);
            user = new User(userId, name, repoUser.getPassword(), email);
        } else {
            user = new User(userId, name, passwordHash, email);
        }
        if(errors.size() == 0) {
            if(repository.saveUser(user)) {
                httpSession.setAttribute(LOGGED_USER_KEY, user);
                return "redirect:/inicio";
            } else {
                errors.put("Error", "No se ha podido guardar el usuario");
            }
        }
        redirectAttributes.addFlashAttribute("errors", errors);
        return "redirect:/user/add";
    }

    /**
     * Metodo get para deslogearse de la página
     * @param httpSession sesión del usuario
     * @return redirect a incio
     */
    @GetMapping("/user/logout")
    public String logoutAction(HttpSession httpSession) {
        httpSession.removeAttribute(LOGGED_USER_KEY);
        return "redirect:/inicio";
    }

}
