package es.g01.crosstube.model.dto;

import es.g01.crosstube.model.dto.types.ExerciseMuscle;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 * Routine, va a representar una rutina
 * @author G1-01
 */

public class Routine {

    private final int DEFAULT_ROUNDS = 2;

    private final int MAX_EXERCISES = 10;

    private final int MAX_EXTRA_POINTS = 5;

    private int id;

    private int difficulty;

    private LocalDateTime date;

    private int rounds;

    private ArrayList<Exercise> exercises;

    private User user;


    /**
     * Constructor con parametros
     * @param id identificador
     * @param date fecha
     * @param exercise ejercicios
     * @param user usuario
     */
    public Routine(int id, LocalDateTime date, ArrayList<Exercise> exercise, User user) {
        this.id = id;
        this.date = date;
        this.exercises = exercise;
        this.rounds = DEFAULT_ROUNDS;
        this.user = user;
        this.difficulty = getTotalDifficulty();
    }

    /**
     * Constructor con parametros
     * @param routineId identificador
     * @param date fecha
     * @param difficulty dificultad
     */
    public Routine(int routineId, int difficulty, LocalDateTime date) {
        this.id = routineId;
        this.difficulty = difficulty;
        this.date = date;
        this.exercises = new ArrayList<>();
        this.rounds = DEFAULT_ROUNDS;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }

    public void setRounds(int rounds) {
        this.rounds = rounds;
    }

    public int getId() {
        return id;
    }

    public ArrayList<Exercise> getExercises() {
        return exercises;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public int getRounds() {
        return rounds;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    /**
     * Introduce un conjunto de ejercicios como rutina
     * @param newExercises nuevos ejercicios
     * @return booleano insertado
     */
    public boolean setExercises(ArrayList<Exercise> newExercises) {
        if (exercises.size() + newExercises.size() > MAX_EXERCISES) {
            return false;
        }

        for (Exercise exercise:newExercises) {
            exercises.add(exercise);
        }
        return true;
    }

    private int getTotalDifficulty() {

        if (exercises.isEmpty()) {
            return 0;
        }

        int totalPoints = 0;
        ArrayList<MuscleGroup> routineMuscles = new ArrayList<>();
        int extraPoints = 0;
        int extraPointsCounter = 1;
        for (Exercise exercise:exercises) {
            int dificultad = exercise.getLevel().getId();
            totalPoints += dificultad * rounds;
            if (exercise.getClass().equals(ExerciseMuscle.class)) {
                ArrayList<MuscleGroup> exerciseMuscles = ((ExerciseMuscle) exercise).getMuscleGroups();
                for (MuscleGroup muscle:exerciseMuscles) {
                    if (routineMuscles.contains(muscle)) {
                        extraPointsCounter ++;
                        if (extraPointsCounter == 2) {
                            extraPoints ++;
                            extraPointsCounter = 0;
                        }
                        break;
                    }
                }
                routineMuscles.addAll(((ExerciseMuscle) exercise).getMuscleGroups());
            }
        }
        totalPoints += extraPoints;

        int maxPoints = getMaxPoints(exercises.get(0).getLevel().getMAX_DIFFICULTY());
        totalPoints = totalPoints * 100 / maxPoints;

        return totalPoints;

    }

    private int getMaxPoints(int levelMaxDificulty) {
        int maxPoints = MAX_EXERCISES * levelMaxDificulty * rounds + MAX_EXTRA_POINTS;

        return maxPoints;
    }

    public String getDateStringES(){
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        return dateTimeFormatter.format(date);
    }

}
