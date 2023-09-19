package es.g01.crosstube.model.dto;


public class MuscleGroup {

    private int id;

    private String name;

    /**
     * Constructor con todos los parámetros
     * @param id identificador
     * @param name nombre
     */
    public MuscleGroup(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * Comprueba si un objeto es el mismo objeto pasaado y si existe
     * @param o objeto
     * @return booleano de si existe o si son el mismo objeto
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MuscleGroup that = (MuscleGroup) o;
        return id == that.id;
    }

}
