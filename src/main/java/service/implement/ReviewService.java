package service.implement;

import model.Review;
import service.serviceInterface.IReviewService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewService implements IReviewService {

    private final String SQL_GET_REVIEWS_BY_PRODUCT = "{CALL get_reviews_by_product(?)}";

    public ReviewService() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/product_management?useSSL=false", "root", "123456");
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Review> findAllByProduct(int id) throws SQLException {
        List<Review> reviews = new ArrayList<>();

        try (Connection connection = getConnection();

             CallableStatement callableStatement = connection.prepareCall(SQL_GET_REVIEWS_BY_PRODUCT);) {
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("userId");
                int productId = rs.getInt("productId");
                String content = rs.getString("content");
                int rate = rs.getInt("rate");
                String date = rs.getString("date");
                reviews.add(new Review(userId, productId, content, rate));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return reviews;
    }

    @Override
    public List<Review> findAllByUser(int id) throws SQLException {
        return null;
    }

    @Override
    public List<Review> findAll() throws SQLException {
        return null;
    }

    @Override
    public void save(Review review) throws SQLException {


    }

    @Override
    public void update(int id, Review review) throws SQLException {

    }

    @Override
    public void delete(int id) throws SQLException {

    }

    @Override
    public Review findById(int id) throws SQLException {
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
