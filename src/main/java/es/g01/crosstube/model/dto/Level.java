package es.g01.crosstube.model.dto;

/**
 * Level va a represetar un nivel de dificultad
 * @author G1-01
 */

public class Level {

    private final int MAX_DIFFICULTY = 4;

    private int id;

    private String name;

    private int value;

    private String description;

    /**
     * Constructor con todos los parámetros
     * @param id identificador
     * @param value valor
     * @param name nombre
     * @param description descripción
     */
    public Level(int id, String name, int value, String description) {
        this.id = id;
        this.name = name;
        this.value = value;
        this.description = description;
    }

    public Level(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getValue() {
        return value;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getMAX_DIFFICULTY() {
        return MAX_DIFFICULTY;
    }
}
