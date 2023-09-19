package es.g01.crosstube.controllers;

import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Level;
import es.g01.crosstube.model.dto.MuscleGroup;
import es.g01.crosstube.model.repositories.ExerciseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

/**
 * SearchController va a represetar el controlador de búsqueda, representando
 * la página de busquedas, tanto la de por parametros como los de tipo
 * @author G1-01
 */

@Controller
public class SearchController {

    public static final int LIMIT_DEFAULT = 24;

    @Autowired
    private ExerciseRepository repository;

    /**
     * Método get de búsqueda por barra, por categoría de musculo y nível
     * @param params parametros
     * @param model modelo
     * @return vista paǵina search
     */
    @GetMapping("/search")
    public String getSearchByParams(@RequestParam Map<String, String> params, Model model) {
        Set<Level> levels = repository.findAllLevels();
        ArrayList<MuscleGroup> muscleGroups = repository.findAllMuscles();
        model.addAttribute("muscles", muscleGroups);
        model.addAttribute("levels", levels);
        int page = Integer.parseInt(params.get("page"));
        int offsetDefault = page * (LIMIT_DEFAULT-1);
        model.addAttribute("page", page);
        List<Exercise> exercises = repository.getExercicesByParams(params, offsetDefault, LIMIT_DEFAULT);
        int paginas = repository.getNumberResults(params) / LIMIT_DEFAULT;
        model.addAttribute("paginas", paginas);
        model.addAttribute("exercises", exercises);
        model.addAttribute("busqueda", params);
        model.addAttribute("parametros", getParamsSearched(params));
        model.addAttribute("tittle", "Resultados");
        return "search";
    }

    /**
     * Método get de búsqueda por tipo de ejercicio y filtrado
     * @param params parametros
     * @param type tipo de ejercicio
     * @param page página
     * @param model modelo
     * @return vista de search
     */
    @GetMapping("/search/type")
    public String getSearchByType(@RequestParam Map<String, String> params, @RequestParam String type, int page, Model model) {
        model.addAttribute("isGlobal", false);
        Set<Level> levels = repository.findAllLevels();
        model.addAttribute("type", type);
        ArrayList<MuscleGroup> muscleGroups = repository.findAllMuscles();
        model.addAttribute("muscles", muscleGroups);
        model.addAttribute("levels", levels);
        model.addAttribute("tittle", type);
        int offsetDefault = page * (LIMIT_DEFAULT-1);
        model.addAttribute("page", page);
        model.addAttribute("paginas", repository.getNumberResultsSentenceFindByType(type) / LIMIT_DEFAULT);
        List<Exercise> exercises = repository.getByType(params,type, offsetDefault, LIMIT_DEFAULT);
        model.addAttribute("exercises", exercises);
        return "search";
    }

    private List<String> getParamsSearched(Map<String, String> params) {
        List<String> parametros = new ArrayList<>();
        if (params.get("search") != null){

            if (!params.get("search").equals("")) {
                parametros.add(params.get("search"));
            }
        }

        if (!params.get("category").equals("all")) {
            int muscleId = Integer.parseInt(params.get("category"));
            MuscleGroup muscleGroup = repository.getMuscleGroupById(muscleId);
            parametros.add(muscleGroup.getName());
        }
        if (Integer.parseInt(params.get("level")) >= 0) {
            int levelId = Integer.parseInt(params.get("level"));
            Level level = repository.getLevelById(levelId);
            parametros.add(level.getName());
        }
        return parametros;
    }

}
