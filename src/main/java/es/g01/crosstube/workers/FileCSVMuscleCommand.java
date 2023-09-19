package es.g01.crosstube.workers;

import es.g01.crosstube.CrosstubeApplication;
import es.g01.crosstube.model.dao.IMuscleDAO;
import es.g01.crosstube.model.dto.MuscleGroup;
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
 * FileCSVMuscleCommand representa la transcripción de los ejercicios
 * de un fichero a la base de grupos de músculos
 * @author G1-01
 */

@Component
@ConditionalOnProperty(name = "Muscles")
public class FileCSVMuscleCommand implements CommandLineRunner {

    public  String ruta = "src/main/resources/database/categorias.csv";

    @Autowired
    private IMuscleDAO iMuscleDAO;

    /**
     * Ejecuta la aplicación
     * @param args argumentos
     */
    public static void main(String[] args) {
        new SpringApplicationBuilder(CrosstubeApplication.class).web(WebApplicationType.NONE).run("--Muscles");
    }

    /**
     * Corre la aplicación con unos argumentos pasados
     * @param args argumentos
     */
    @Override
    public void run(String... args) {
        ArrayList<MuscleGroup> muscleGroups = readFile();
        importMuscleGroups(muscleGroups);
    }

    private ArrayList<MuscleGroup> readFile () {
        File file = new File(ruta);
        ArrayList<MuscleGroup> musclesGroup = new ArrayList<>();
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(file))) {
            bufferedReader.readLine();
            do {
                String line = bufferedReader.readLine();
                if (line == null) {
                    return musclesGroup;
                }
                MuscleGroup muscleGroup = getLMuscleGroupFromRegistrer(line);
                musclesGroup.add(muscleGroup);
            } while (true);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    private MuscleGroup getLMuscleGroupFromRegistrer(String line) {
        String[] datos = line.split(",");
        int id = Integer.parseInt(datos[0].trim());
        String name = datos[1].trim();
        return new MuscleGroup(id, name);
    }

    private void importMuscleGroups(ArrayList<MuscleGroup> muscleGroups) {
        for (MuscleGroup muscleGroup : muscleGroups) {
            iMuscleDAO.save(muscleGroup);
        }
    }


}
