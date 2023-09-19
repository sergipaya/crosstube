package es.g01.crosstube.model.dao.impl;

import es.g01.crosstube.exceptions.DatabaseConnectionException;
import es.g01.crosstube.exceptions.ExerciseNotExistException;
import es.g01.crosstube.model.dao.IExerciseDAO;
import es.g01.crosstube.model.dto.*;
import es.g01.crosstube.model.dto.types.ExerciseCore;
import es.g01.crosstube.model.dto.types.ExerciseMuscle;
import es.g01.crosstube.utils.database.MySQLConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.*;
import java.util.ArrayList;


@Service
public class SQLExerciseDAO implements IExerciseDAO {

    private final MySQLConnection mySQLConnection;

    /**
     * Autoinyecta un constructor de mySQLConnection
     * @param mySQLConnection conexión
     */
    public SQLExerciseDAO(@Autowired MySQLConnection mySQLConnection) {
        this.mySQLConnection = mySQLConnection;
    }

    @Override
    public Exercise findById(int exerciseId) {
        String sql = "SELECT * FROM exercises WHERE exercise_id = ?";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, exerciseId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Exercise exercise = mapToEntity(rs);
                return exercise;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private Exercise mapToEntity(ResultSet rs) throws SQLException {
        int exerciseId = rs.getInt("exercise_id");
        String name = rs.getString("exercise_name");
        Level level = new Level(rs.getInt("level_id"));
        String description = rs.getString("description");
        boolean calisthenics = rs.getBoolean("calisthenics");
        int views = rs.getInt("views");
        int reps = rs.getInt("reps");
        String videoLink = rs.getString("video_link");
        String posterLink = rs.getString("poster_link");
        String typeString = rs.getString("type");
        float avgRating = getAvgRatingFromId(rs.getInt("exercise_id"));

        Exercise exercise;
        if (typeString.equals("CARDIO")) {
            long time = rs.getLong("time");
            long fatBurn = rs.getLong("fat_burn");
            exercise = new ExerciseCore(exerciseId,name,description,calisthenics,views,reps,videoLink, posterLink,avgRating,level,null,time,fatBurn);
        } else {
            ArrayList<MuscleGroup> muscleGroups = findMuscles(exerciseId);
            exercise = new ExerciseMuscle(exerciseId,name,description,calisthenics,views,reps,videoLink, posterLink,avgRating,level,null,muscleGroups);
        }

        return exercise;
    }

    private ArrayList<MuscleGroup> findMuscles(int exerciseId) {
        String sql = "SELECT M.muscle_group_id, M.name FROM muscle_group M INNER JOIN" +
                " muscle_works MW ON M.muscle_group_id=MW.muscle_group_id INNER JOIN" +
                " exercises E ON E.exercise_id=MW.exercise_id WHERE E.exercise_id=?";
        ArrayList<MuscleGroup> muscleGroups = new ArrayList<>();
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setInt(1, exerciseId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int muscleId = rs.getInt("muscle_group_id");
                String muscleName = rs.getString("name");
                MuscleGroup muscleGroup = new MuscleGroup(muscleId,muscleName);
                muscleGroups.add(muscleGroup);
            }
            return muscleGroups;
        }catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }


    @Override
    public Exercise getById(int id) throws ExerciseNotExistException {
        Exercise exercise = findById(id);
        if (exercise == null) {
            throw new ExerciseNotExistException("Id de ejercicio no encontrada");
        }
        return exercise;
    }

    @Override
    public boolean save(Exercise exercise) {

        if (findById(exercise.getId()) == null) {
            return insert(exercise);
        } else {
            return update(exercise);
        }

    }

    private boolean insert(Exercise exercise) {
        String sql = "INSERT INTO exercises VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql))
        {
            preparedStatement.setInt(1, exercise.getId());
            preparedStatement.setString(2, exercise.getType());
            preparedStatement.setString(3, exercise.getName());
            preparedStatement.setInt(4, exercise.getLevel().getId());
            preparedStatement.setString(5, exercise.getDescription());
            preparedStatement.setBoolean(6, exercise.isCalisthenics());
            preparedStatement.setInt(7, exercise.getViews());
            preparedStatement.setInt(8, exercise.getReps());
            preparedStatement.setString(9, exercise.getVideoLink());
            preparedStatement.setString(10, exercise.getPosterLink());
            preparedStatement.setLong(11, exercise.getTime());
            preparedStatement.setLong(12, exercise.getFatBurn());

            preparedStatement.executeUpdate();

            if (exercise.getClass().equals(ExerciseMuscle.class)) {
                insertMuscleWorks((ExerciseMuscle) exercise);
            }

            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private boolean insertMuscleWorks(ExerciseMuscle exercise) {
        String sql = "INSERT INTO muscle_works VALUES (?,?)";
        Connection connection = mySQLConnection.getConnection();
        ArrayList<MuscleGroup> muscleGroups = exercise.getMuscleGroups();
        for (MuscleGroup muscleGroup:muscleGroups) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql))
            {
                preparedStatement.setInt(1, muscleGroup.getId());
                preparedStatement.setInt(2, exercise.getId());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return true;
    }

    private boolean update(Exercise exercise) {
        return false;
    }


    private String getConsultByParams(Map<String, String> params, int offset, int limit) {
        String searchBar = params.get("search");
        String category = params.get("category");
        int calisthenic = Integer.parseInt(params.get("calisthenic"));
        int level = Integer.parseInt(params.get("level"));
        StringBuilder sql = new StringBuilder("SELECT E.* FROM exercises E LEFT JOIN muscle_works MW ON E.exercise_id = MW.exercise_id ");

        if(level < 0 && (category == null || category.equals("all")) && searchBar.equals("") && calisthenic == -1) {
            sql.append(" LIMIT ").append(offset).append(",").append(limit);
            return sql.toString();
        }
        sql.append(" WHERE");
        if(calisthenic != -1) {
            sql.append(" calisthenics = ").append(calisthenic);
        }
        if(calisthenic == -1 && !searchBar.equals("")) {
            sql.append(" exercise_name like '%").append(searchBar).append("%'");
        } else if(calisthenic != -1 && !searchBar.equals("")) {
            sql.append(" and exercise_name like '%").append(searchBar).append("%'");
        }

        if(calisthenic == -1 && searchBar.equals("") && category != null) {
            if(category.equals("9")) {
                sql.append(" type like 'CARDIO' ");
            } else if(!category.equals("all")) {
                sql.append(" MW.muscle_group_id = '").append(category).append("'");
            }
        } else if(category != null) {
            if(category.equals("9")) {
                sql.append(" and type like 'CARDIO' ");
            } else if(!category.equals("all")) {
                sql.append(" and MW.muscle_group_id = '").append(category).append("'");
            }
        }

        if(level != -1) {
            if(calisthenic == -1 && searchBar.equals("") && (category == null || category.equals("all"))) {
                sql.append(" level_id = ").append(level);
            } else if(level != -1) {
                sql.append(" and level_id = ").append(level);
            }
        }

        sql.append(" LIMIT ").append(offset).append(",").append(limit);
        return sql.toString();

    }

    @Override
    public List<Exercise> getExercicesByParams(Map<String, String> params, int offset, int limit) {
        Connection connection = mySQLConnection.getConnection();
        String sql = getConsultByParams(params, offset, limit);
        try (Statement statement = connection.createStatement()) {
            List<Exercise> exercises = new ArrayList<>();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                exercises.add(mapToEntity(rs));
            }
            return exercises;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public List<Exercise> findByType(String type, Integer pageSize) {
        String sql = "select E.* , AVG(V.rating) AS avgRating " +
                "from exercises E LEFT JOIN votes V ON E.exercise_id=V.exercise_id " +
                "WHERE E.type LIKE ? group by E.exercise_id order by avgRating DESC, E.exercise_name LIMIT ?";
        List<Exercise> exercises = new ArrayList<>();
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1,  type);
            preparedStatement.setInt(2,  pageSize);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Exercise exercise = mapToEntity(rs);
                exercises.add(exercise);
            }
            return exercises;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public float getAvgRatingFromId(int id) {
        String sql = "SELECT AVG(rating) AS avgRating FROM votes WHERE exercise_id = ? GROUP BY exercise_id";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getFloat("avgRating");
            }
            return 0;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public int getNumberResults(Map<String, String> params) {
        String sql = getNumberResultsSentence(params);
        Connection connection = mySQLConnection.getConnection();
        try (Statement statement = connection.createStatement()) {
            ResultSet rs = statement.executeQuery(sql);
            if (rs.next()) {
                return rs.getInt("totalEjercicios");
            }
            return 0;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private String getNumberResultsSentence(Map<String, String> params) {
        String searchBar = params.get("search");
        String category = params.get("category");
        int level = Integer.parseInt(params.get("level"));
        StringBuilder sql = new StringBuilder("SELECT COUNT(E.exercise_id) as totalEjercicios FROM exercises E, muscle_works MW WHERE (E.exercise_id = MW.exercise_id)");
        if (level < 0 && (category == null || category.equals("all")) && searchBar.equals("")) {
            sql.append(" ORDER BY E.exercise_id");
            return sql.toString();
        }else {
            sql.append(" and");
        }
        if (!searchBar.equals("")) {
            sql.append(" exercise_name like '%").append(searchBar).append("%'");
        }
        if (category != null) {
            if (!category.equals("all") && !searchBar.equals("")) {
                sql.append(" and MW.muscle_group_id = '").append(category).append("'");
            }else if (!category.equals("all")) {
                sql.append(" MW.muscle_group_id = '").append(category).append("'");
            }
        }
        if (level >= 0 && (category != null || !category.equals("all")) && (!category.equals("all") || !searchBar.equals(""))) {
            sql.append(" and level_id = ").append(level);
        }else if (level >= 0){
            sql.append(" level_id = ").append(level);
        }
        sql.append(" ORDER BY E.exercise_id ");
        System.out.println(sql);
        return sql.toString();
    }

    @Override
    public boolean addView(Exercise exercise) {
        String sql = "UPDATE exercises SET views = ? WHERE exercise_id = ?";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql))
        {
            preparedStatement.setInt(1, exercise.getViews() + 1);
            preparedStatement.setInt(2, exercise.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
        return true;
    }

    @Override
    public ArrayList<Exercise> findByRoutine(Routine routine) {
        String sql = "select E.*, AVG(V.rating) AS avgRating from exercises E LEFT JOIN votes V ON E.exercise_id=V.exercise_id" +
                " INNER JOIN routine_exercises RE ON E.exercise_id=RE.exercise_id " +
                "WHERE RE.routine_id = ? GROUP BY E.exercise_id";
        ArrayList<Exercise> exercises = new ArrayList<>();
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, routine.getId());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Exercise exercise = mapToEntity(rs);
                exercises.add(exercise);
            }
            return exercises;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public List<Exercise> getByType(Map<String,String> params, String type, int offsetDefault, int limitDefault) {
        Connection connection = mySQLConnection.getConnection();
        String sql = getSentenceByType(params);
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, type);
            preparedStatement.setInt(2, offsetDefault);
            preparedStatement.setInt(3, limitDefault);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Exercise> exercises = new ArrayList<>();
            while (resultSet.next()) {
                exercises.add(mapToEntity(resultSet));
            }
            return exercises;
        } catch (SQLException e) {
            throw new DatabaseConnectionException(e.getMessage());
        }
    }

    private String getSentenceByType(Map<String,String> params) {
        String sql = "SELECT E.*, AVG(V.rating) AS avgRating from exercises E LEFT JOIN votes V ON E.exercise_id=V.exercise_id WHERE TYPE LIKE ? GROUP BY E.exercise_id ";
        String orderByLevel = params.get("orderLevel");
        String orderByAvg = params.get("orderAvg");
        String orderByTitle = params.get("orderTitulo");
        StringBuilder sentenceOrder = new StringBuilder();
        if (!orderByLevel.equals("disabled") || !orderByAvg.equals("disabled") || !orderByTitle.equals("disabled")) {
            sentenceOrder.append("order by ");
        }
        if (!orderByLevel.equals("disabled")) {
            if(orderByLevel.equals("desc")) {
                sentenceOrder.append("level_id desc ");
            }else {
                sentenceOrder.append("level_id asc ");
            }
        }
        if (orderByLevel.equals("disabled") && !orderByAvg.equals("disabled")) {
            if(orderByAvg.equals("desc")) {
                sentenceOrder.append("avgRating DESC ");
            }else {
                sentenceOrder.append("avgRating ASC ");
            }
        }else if(!orderByAvg.equals("disabled")) {
            if(orderByAvg.equals("desc")) {
                sentenceOrder.append(",avgRating DESC ");
            }else {
                sentenceOrder.append(",avgRating ASC ");
            }
        }
        if (orderByLevel.equals("disabled") && orderByAvg.equals("disabled") && !orderByTitle.equals("disabled")) {
            if(orderByTitle.equals("desc")) {
                sentenceOrder.append("exercise_name desc ");
            }else {
                sentenceOrder.append("exercise_name asc" );
            }
        }else if (!orderByTitle.equals("disabled")) {
            if(orderByTitle.equals("desc")) {
                sentenceOrder.append(",exercise_name desc ");
            }else {
                sentenceOrder.append(",exercise_name asc ");
            }
        }
        sentenceOrder.append(" LIMIT ?,?");
        sql = sql + sentenceOrder;
        return sql;
    }

    @Override
    public int getNumberResultsSentenceFindByType(String type) {
        String sql = "SELECT count(exercise_id) as totalEjercicios from exercises where type = ?";
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
           ps.setString(1,type);
           ResultSet rs = ps.executeQuery();
           if (rs.next()) {
               return rs.getInt("totalEjercicios");
           }
           return 0;
        } catch (SQLException e) {
            throw new DatabaseConnectionException(e.getMessage());
        }
    }

    @Override
    public ArrayList<Exercise> getMuscleExercisesForRoutine(String muscleName, int levelId, int calisthenics) {
        String sql = "SELECT E.* FROM exercises E, muscle_group MG, muscle_works MW WHERE (E.exercise_id = MW.exercise_id) " +
                "AND (MW.muscle_group_id = MG.muscle_group_id) AND (MG.name LIKE ?)";
        if(levelId != 0) {
            sql +=  " AND E.level_id = ?";
        }
        sql += " AND calisthenics = ? ORDER BY RAND()";
        ArrayList<Exercise> exercises = new ArrayList<>();
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, muscleName);
            if(levelId == 0) {
                ps.setInt(2, calisthenics);
            } else {
                ps.setInt(2, levelId);
                ps.setInt(3, calisthenics);
            }


            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                exercises.add(mapToEntity(rs));
            }
            return exercises;
        } catch (SQLException e) {
            throw new DatabaseConnectionException(e.getMessage());
        }
    }

    @Override
    public  ArrayList<Exercise> getCardioExercisesForRoutine(int levelId, int calisthenics) {
        String sql = "SELECT * FROM exercises WHERE type LIKE 'CARDIO'";
        if(levelId != 0) {
            sql += " AND E.level_id = ?";
        }
        sql += " ORDER BY RAND()";
        ArrayList<Exercise> exercises = new ArrayList<>();
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if(levelId != 0) {
                ps.setInt(1, levelId);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                exercises.add(mapToEntity(rs));
            }
            return exercises;
        } catch (SQLException e) {
            throw new DatabaseConnectionException(e.getMessage());
        }
    }

    @Override
    public ArrayList<Exercise> getFavouritesFromUser(User user) {
        String sql = "SELECT E.* FROM exercises E INNER JOIN favourites F ON E.exercise_id = F.exercise_id WHERE F.user_id = ?";
        ArrayList<Exercise> exercises = new ArrayList<>();
        Connection connection = mySQLConnection.getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, user.getId());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                exercises.add(mapToEntity(rs));
            }
            return exercises;
        } catch (SQLException e) {
            throw new DatabaseConnectionException(e.getMessage());
        }
    }

}