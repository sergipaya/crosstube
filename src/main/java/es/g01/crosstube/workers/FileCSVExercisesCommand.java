package es.g01.crosstube.workers;

import es.g01.crosstube.CrosstubeApplication;
import es.g01.crosstube.exceptions.LevelNotExistException;
import es.g01.crosstube.model.dao.IExerciseDAO;
import es.g01.crosstube.model.dao.ILevelDAO;
import es.g01.crosstube.model.dao.IMuscleDAO;
import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Level;
import es.g01.crosstube.model.dto.MuscleGroup;
import es.g01.crosstube.model.dto.types.ExerciseCore;
import es.g01.crosstube.model.dto.types.ExerciseMuscle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

/**
 * FileCSVExercisesCommand representa la transcripción de los ejercicios
 * de un fichero a la base de datos
 * @author G1-01
 */

@Component
@ConditionalOnProperty(name = "Exercises")
public class FileCSVExercisesCommand implements CommandLineRunner {

    public  String ruta = "src/main/resources/database/ejercicios.csv";

    @Autowired
    private IMuscleDAO iMuscleDAO ;

    @Autowired
    private ILevelDAO iLevelDAO;

    @Autowired
    private IExerciseDAO iExerciseDAO;

    /**
     * Ejecuta la aplicación
     * @param args argumentos
     */
    public static void main(String[] args) {
        new SpringApplicationBuilder(CrosstubeApplication.class).web(WebApplicationType.NONE).run("--Exercises");
    }

    /**
     * Corre la aplicación con unos argumentos pasados
     * @param args argumentos
     */
    @Override
    public void run(String... args) {
        ArrayList<Exercise> exercises = readFile();
        importExercises(exercises);
    }

    private ArrayList<Exercise> readFile() {
        File file = new File(ruta);
        ArrayList<Exercise> exercises = new ArrayList<>();
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(file))) {
            bufferedReader.readLine();
            do {
                String line = bufferedReader.readLine();
                if (line == null) {
                    return exercises;
                }
                Exercise exercise = getExerciseFromRegistrer(line);
                exercises.add(exercise);
            } while (true);
        } catch (IOException e) {
           throw new RuntimeException(e.getMessage());
        }
    }

    private Exercise getExerciseFromRegistrer(String line) {
        String[] datos = line.split("\\|");
        int id = Integer.parseInt(datos[0].trim());
        String name = datos[1].trim();
        String type = datos[2].trim();
        String levelName = datos[3].trim();
        int reps = Integer.parseInt(datos[4].trim());
        String videoLink = datos[5].trim();
        boolean calisthenics = Boolean.parseBoolean(datos[6].trim());
        String posterLink = datos[7].trim();
        String description = datos[8].trim();
        String musclesNames = datos[9].trim();
        long fatBurn =  Long.parseLong(datos[10].trim());
        long time = Long.parseLong(datos[11].trim());
        Level level;
        try {
            level = iLevelDAO.getByName(levelName);
        } catch (LevelNotExistException e) {
            throw new RuntimeException(e.getMessage());
        }
        if (type.equals("Musculacion")) {
            ArrayList<MuscleGroup> muscles = getMuscles(musclesNames);
            return new ExerciseMuscle(id, name, description, calisthenics, 0, reps, videoLink, posterLink, 0, level, null, muscles);
        }
        return new ExerciseCore(id, name, description, calisthenics, 0, reps, videoLink, posterLink, 0, level, null, time, fatBurn);
    }

    private ArrayList<MuscleGroup> getMuscles(String musclesNames) {
        ArrayList<MuscleGroup> muscles = new ArrayList<>();
        String[] musclesGroups = musclesNames.split(",");
        for(String muscle : musclesGroups) {
            MuscleGroup actualMuscle = iMuscleDAO.findByName(muscle);
            muscles.add(actualMuscle);
        }
        return muscles;
    }

    private void importExercises(ArrayList<Exercise> exercises) {
        for (Exercise exercise : exercises) {
            iExerciseDAO.save(exercise);
        }
    }

}
