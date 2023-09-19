package es.g01.crosstube.model.dto;

/**
 * Vote, va a representar un voto que votará un usuario
 * @author G1-01
 */

public class Vote {

    private int rating;

    private User user;

    private Exercise exercise;

    /**
     * Constructor con parametros
     * @param rating media
     * @param user usuario
     */
    public Vote(int rating, User user) {
        this.rating = rating;
        this.user = user;
    }

    /**
     * Constructor con todos los parametros
     * @param rating media
     * @param user usuario
     * @param exercise ejercicio
     */
    public Vote(int rating, User user, Exercise exercise) {
        this.rating = rating;
        this.user = user;
        this.exercise = exercise;
    }

    public Exercise getExercise() {
        return exercise;
    }

    public int getRating() {
        return rating;
    }

    public User getUser() {
        return user;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setExercise(Exercise exercise) {
        this.exercise = exercise;
    }

}
