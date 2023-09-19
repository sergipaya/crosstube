package es.g01.crosstube.model.dto;

import org.springframework.boot.CommandLineRunner;

import java.util.HashSet;
import java.util.Objects;

/**
 * Exercise va a represetar un ejercicio
 * el cual va a ser abstracto
 * @author G1-01
 */

public abstract class Exercise {

    private int id;

    private String name;

    private String description;

    private boolean calisthenics;

    private int views;

    private int reps;

    private String videoLink;

    private String posterLink;

    private float avgRating;

    private Level level;

    private HashSet<Vote> votes;

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
     */
    public Exercise(int id, String name, String description, boolean calisthenics, int views, int reps, String videoLink, String posterLink, float avgRating, Level level, HashSet<Vote> votes) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.calisthenics = calisthenics;
        this.views = views;
        this.reps = reps;
        this.videoLink = videoLink;
        this.posterLink = posterLink;
        this.avgRating = avgRating;
        this.level = level;
        this.votes = votes;
    }
    
    public void setLevel(Level level) {
        this.level = level;
    }

    public void setVotes(HashSet<Vote> votes) {
        this.votes = votes;
    }

    public Level getLevel() {
        return level;
    }

    public HashSet<Vote> getVotes() {
        return votes;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public boolean isCalisthenics() {
        return calisthenics;
    }

    public int getViews() {
        return views;
    }

    public int getReps() {
        return reps;
    }

    public String getVideoLink() {
        return videoLink;
    }

    public String getPosterLink() {
        return posterLink;
    }

    public float getAvgRating() {
        return avgRating;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCalisthenics(boolean calisthenics) {
        this.calisthenics = calisthenics;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public void setReps(int reps) {
        this.reps = reps;
    }

    public void setVideoLink(String videoLink) {
        this.videoLink = videoLink;
    }

    public void setPosterLink(String posterLink) {
        this.posterLink = posterLink;
    }

    public void setAvgRating(float avgRating) {
        this.avgRating = avgRating;
    }

    public abstract String getType();

    public abstract long getTime();

    public abstract String getTimeString();

    public abstract long getFatBurn();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Exercise exercise = (Exercise) o;
        return id == exercise.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
