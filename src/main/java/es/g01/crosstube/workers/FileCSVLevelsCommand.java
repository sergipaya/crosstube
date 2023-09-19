package es.g01.crosstube.workers;

import es.g01.crosstube.CrosstubeApplication;
import es.g01.crosstube.model.dao.ILevelDAO;
import es.g01.crosstube.model.dto.Level;
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
 * FileCSVLevelsCommand representa la transcripción de los niveles
 * de un fichero a la base de datos
 * @author G1-01
 */

@Component
@ConditionalOnProperty(name = "Levels")
public class FileCSVLevelsCommand implements CommandLineRunner {

    public  String ruta = "src/main/resources/database/niveles.csv";

    @Autowired
    private ILevelDAO iLevelDAO;

    /**
     * Ejecuta la aplicación
     * @param args argumentos
     */
    public static void main(String[] args) {
        new SpringApplicationBuilder(CrosstubeApplication.class).web(WebApplicationType.NONE).run("--Levels");
    }

    /**
     * Corre la aplicación con unos argumentos pasados
     * @param args argumentos
     */
    @Override
    public void run(String... args) {
        ArrayList<Level> levels = readFile();
        if (levels != null) {
            importLevels(levels);
        }
    }

    private ArrayList<Level> readFile () {
        File file = new File(ruta);
        ArrayList<Level> levels = new ArrayList<>();
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(file))) {
            bufferedReader.readLine();
            do {
                String line = bufferedReader.readLine();
                if (line == null) {
                    return levels;
                }
                Level level = getLevelFromRegistrer(line);
                levels.add(level);
            } while (true);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    private Level getLevelFromRegistrer(String line) {
        String[] datos = line.split(",");
        int id = Integer.parseInt(datos[0].trim());
        String name = datos[1].trim();
        String description = datos[2].trim();
        return new Level(id, name, id, description);
    }

    private void importLevels(ArrayList<Level> levels) {
        for (Level level : levels) {
            iLevelDAO.save(level);
        }
    }
}
