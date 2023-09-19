package es.g01.crosstube.model.dto.types;

import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Level;
import es.g01.crosstube.model.dto.MuscleGroup;
import es.g01.crosstube.model.dto.Vote;

import java.util.ArrayList;
import java.util.HashSet;

/**
 * ExerciseMuscle va a represetar un ejercicio de tipo muscle
 * el cual extiende de Exercise
 * @author G1-01
 */

public class ExerciseMuscle extends Exercise {

    private ArrayList<MuscleGroup> muscleGroups;

    /**
     * Constructor con todos los parámetros
     * @param id identificador
     * @param name nombre
     * @param description descripción
     * @param calisthenics boobleano
     * @param views visitas
     * @param reps repeticiones
     * @param videoLink link del video
     * @param posterLink link de la imagen
     * @param avgRating voto medio
     * @param level nivel
     * @param votes votos
     * @param muscleGroups grupo muscular
     */
    public ExerciseMuscle(int id, String name, String description, boolean calisthenics, int views, int reps, String videoLink, String posterLink, float avgRating, Level level, HashSet<Vote> votes, ArrayList<MuscleGroup> muscleGroups) {
        super(id, name, description, calisthenics, views, reps, videoLink, posterLink, avgRating, level, votes);
        this.muscleGroups = muscleGroups;
    }

    public ArrayList<MuscleGroup> getMuscleGroups() {
        return muscleGroups;
    }

    public void setMuscleGroups(ArrayList<MuscleGroup> muscleGroups) {
        this.muscleGroups = muscleGroups;
    }

    @Override
    public String getType() {
        return "MUSCLE";
    }

    @Override
    public long getTime() {
        return 0;
    }

    @Override
    public String getTimeString() {return null;}

    @Override
    public long getFatBurn() {
        return 0;
    }

}
