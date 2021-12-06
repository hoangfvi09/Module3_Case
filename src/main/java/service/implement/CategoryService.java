package service.implement;

import model.Category;
import model.Product;
import service.serviceInterface.ICategoryService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryService implements ICategoryService {
    public CategoryService() {
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
    public List<Category> findAll() throws SQLException {
        List<Category> categories = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall("select * from categories;");) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
               categories.add(new Category(id, name));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return categories;
    }

    @Override
    public void save(Category category) throws SQLException {

    }

    @Override
    public void update(int id, Category category) throws SQLException {

    }

    @Override
    public void delete(int id) throws SQLException {

    }

    @Override
    public Category findById(int id) throws SQLException {
        Category category= null;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall("select * from categories c where c.id = ?;");) {
            callableStatement.setInt(1,id);
            ResultSet rs = callableStatement.executeQuery();
            rs.next();
            String name = rs.getString("name");
            category = new Category(id, name);

        } catch (SQLException e) {
            printSQLException(e);
        }
        return category;
    }

    public List<Category> findByProductList(List<Product> products) throws SQLException {
        List<Category> categoryList = new ArrayList<>();
        for (Product product:products
             ) {
            categoryList.add(findById(product.getCategoryId()));
        }
        return categoryList;
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