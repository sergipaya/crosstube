package es.g01.crosstube.model.dto;

import java.util.ArrayList;

/**
 * User, va a representar un usuario
 * @author G1-01
 */

public class User {

    private int id;

    private String name;

    private String password;

    private String email;

    private ArrayList<Routine> routines;

    private ArrayList<Exercise> favorites;

    /**
     * Constructor con parametros
     * @param id identificador
     * @param date fecha
     * @param difficulty dificultad
     */
    public User(int id) {
        this.id = id;
    }

    /**
     * Constructor con parametros
     * @param id identificador
     * @param name nombre
     * @param password contraseña
     * @param email email
     */
    public User(int id, String name, String password, String email) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.routines = new ArrayList<>();
        this.favorites = new ArrayList<>();
    }

    /**
     * Constructor con parametros
     * @param name nombre
     */
    public User(String name) {
        this.name = name;
        this.id = 0;
    }

    /**
     * Constructor con parametros
     * @param name nombre
     * @param password contraseña
     */
    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFavorites(ArrayList<Exercise> favorites) {
        this.favorites = favorites;
    }

    public ArrayList<Exercise> getFavorites() {
        return favorites;
    }

    public void setRoutines(ArrayList<Routine> routines) {
        this.routines = routines;
    }

    public ArrayList<Routine> getRoutines() {
        return routines;
    }

    public void addFavorite(Exercise exercise) {
        favorites.add(exercise);
    }

}
