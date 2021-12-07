package service.implement;

import model.User;
import service.serviceInterface.IUserService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService {

    private String jdbcURL = "jdbc:mysql://localhost:3306/product_management?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    private final String INSERT_USERS_SQL = "INSERT INTO users" + " (name, email, password) VALUES " + " (?, ?, ?);";
    private final String SELECT_USER_BY_EMAIL_PASS = "select * from users where email like ? and password like ?";
    private final String SELECT_USER_BY_EMAIL = "select id, name, email, password, role, image from users where email like ?";
    private final String SELECT_USER_BY_ID = "select * from users where id = ?";
    private final String SELECT_ALL_USERS = "select * from users";
    private final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private final String UPDATE_USERS_SQL = "update users set name = ?, email= ?, password = ?, role =?, image = ? where id = ?";
    private final String LOGIN_USER_SQL = "select * from users where email = ? and password = ?";

    private final String SELECT_USER_BY_USERNAME_PASS = "select * from user where username like ? and password like ?";
    private final String SELECT_USER_BY_USERNAME = "select id, username, password, email, address, avatar from user where username like ?";
    private final String SQL_GET_ALL_USERS = "{call get_all_users()}";
    public UserService() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/product_management?useSSL=false", "root", "123456");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<User> findAll() throws SQLException {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_ALL_USERS);) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String image = rs.getString("image");
                int role = rs.getInt("role");
                users.add(new User(id, name, email, password, role, image));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public void save(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }

    }

    @Override
    public void update(int id, User user) throws SQLException {

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setInt(4, user.getRole());
            preparedStatement.setString(5, user.getImage());
            preparedStatement.setInt(6, user.getId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException ignored) {
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL);) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException ignored) {
        }

    }

    @Override
    public User findById(int id) throws SQLException {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                int role = resultSet.getInt("role");
                String image = resultSet.getString("image");
                user = new User(id, name, email, password, role, image);
            }
        } catch (SQLException ignored) {
        }
        return user;
    }

    @Override
    public List<User> findByEmail(String emailToFind) {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL);) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, "%" + emailToFind + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                int role = resultSet.getInt("role");
                String image = resultSet.getString("image");
                users.add(new User(id, name, email, password, role, image));
            }
        } catch (SQLException e) {
        }
        return users;
    }

    @Override
    public User verifyLogin(String email, String password) throws SQLException {
        List <User> users = findAll();
        for ( User user: users) {
            if (user.getEmail().equals(email)){
                if (user.getPassword().equals(password)){
                    return user;
                }
            }
        }
        return null;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
