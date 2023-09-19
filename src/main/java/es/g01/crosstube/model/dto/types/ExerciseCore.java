package es.g01.crosstube.model.dto.types;

import es.g01.crosstube.model.dto.Exercise;
import es.g01.crosstube.model.dto.Level;
import es.g01.crosstube.model.dto.Vote;

import java.util.HashSet;

/**
 * ExerciseCore va a represetar un ejercicio de tipo core
 * el cual extiende de Exercise
 * @author G1-01
 */

public class ExerciseCore extends Exercise {

    private long time;

    private long fatBurn;

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
     * @param time tiempo
     * @param fatBurn grasa quemada
     */
    public ExerciseCore(int id, String name, String description, boolean calisthenics, int views, int reps, String videoLink, String posterLink, float avgRating, Level level, HashSet<Vote> votes, long time, long fatBurn) {
        super(id, name, description, calisthenics, views, reps, videoLink, posterLink, avgRating, level, votes);
        this.time = time;
        this.fatBurn = fatBurn;
    }


    @Override
    public long getTime() {
        return time;
    }

    /**
     * Concatena el total del tiempo, partiendolo en segundos, minutos y horas
     * @return total tiempo
     */
    @Override
    public String getTimeString() {
        long totalseconds = this.time;
        long minutes = (totalseconds / 60) % 60;
        long seconds = totalseconds % 60;
        long hours = (totalseconds/60)/60;

        String strSec= Long.toString(seconds);
        String strmin= Long.toString(minutes);
        String strHours= Long.toString(hours);

        if (hours >=1) {
            return strHours + "h, " + strmin + "min y " + strSec + "seg";
        } else if (minutes >= 1) {
            return strmin + "min y " + strSec + "seg";
        } else {
            return strSec + "seg";
        }

    }

    @Override
    public long getFatBurn() {
        return fatBurn;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public void setFatBurn(long fatBurn) {
        this.fatBurn = fatBurn;
    }

    @Override
    public String getType() {
        return "CARDIO";
    }


}
