package service.implement;

import model.Product;
import service.serviceInterface.IProductService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private final String SQL_GET_PRODUCTS = "{CALL get_products(?)}";
    private final String SQL_GET_PRODUCTS_BY_PRICE = "{CALL get_products_by_price(?,?)}";
    private final String SQL_GET_ALL_PRODUCTS_PRICE_ASC = "{CALL get_all_products_price_asc()}";
    private final String SQL_GET_ALL_PRODUCTS_PRICE_DESC = "{CALL get_all_products_price_desc()}";
    private final String SQL_GET_ALL_PRODUCTS = "{CALL get_all_products()}";
    private final String SQL_GET_PRODUCT_BY_ID = "{CALL get_product_by_id(?)}";
    private final String SQL_GET_PRODUCT_BY_CID = "select * from products where categoryId = ? ";


    private static final String INSERT_PRODUCTS_SQL = "INSERT INTO products (name,categoryId,description,image) VALUES (?,?,?,?);";
    private static final String SELECT_PRODUCTS_BY_ID = "select id,name,categoryId,description,image,sold from products where id =?";
    private static final String SELECT_ALL_PRODUCTS = "select * from products";
    private static final String DELETE_PRODUCTS_SQL = "delete from products where id = ?;";
    private static final String UPDATE_PRODUCTS_SQL = "update products set name=?,categoryId=?,description=?,image=?,sold=? where id = ?;";


    public ProductService() {
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
    public List<Product> find(String info) {
        List<Product> products = new ArrayList<>();

        try (Connection connection = getConnection();

             CallableStatement callableStatement = connection.prepareCall(SQL_GET_PRODUCTS);) {
            callableStatement.setString(1, "%" + info + "%");

            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("name");
                int categoryId = rs.getInt("categoryId");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int sold = rs.getInt("sold");
                products.add(new Product(id, productName, categoryId, description, image, sold));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    @Override
    public List<Product> findAllPriceDesc() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_ALL_PRODUCTS_PRICE_DESC);) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("name");
                String description = rs.getString("description");
                int categoryId = rs.getInt("categoryId");
                String image = rs.getString("image");
                int sold = rs.getInt("sold");
                products.add(new Product(id, productName, categoryId, description, image, sold));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;

    }

    @Override
    public List<Product> findAllPriceAsc() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_ALL_PRODUCTS_PRICE_ASC);) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("name");
                String description = rs.getString("description");
                int categoryId = rs.getInt("categoryId");
                String image = rs.getString("image");
                int sold = rs.getInt("sold");
                products.add(new Product(id, productName, categoryId, description, image, sold));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    @Override
    public List<Product> findByPrice(double max, double min) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_PRODUCTS_BY_PRICE);) {
            callableStatement.setDouble(1, min);
            callableStatement.setDouble(1, max);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("name");
                String description = rs.getString("description");
                int categoryId = rs.getInt("categoryId");
                String image = rs.getString("image");
                int sold = rs.getInt("sold");
                products.add(new Product(id, productName, categoryId, description, image, sold));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }


    @Override
    public List<Product> findAll() throws SQLException {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_ALL_PRODUCTS);) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("name");
                String description = rs.getString("description");
                int categoryId = rs.getInt("categoryId");
                String image = rs.getString("image");
                int sold = rs.getInt("sold");
                products.add(new Product(id, productName, categoryId, description, image, sold));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    @Override
    public void save(Product product) throws SQLException {
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCTS_SQL)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getCategoryId());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getImage());
            preparedStatement.executeUpdate();
        } catch (SQLException ignored) {
        }

    }

    @Override
    public void update(int id, Product product) throws SQLException {
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCTS_SQL);) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getCategoryId());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getImage());
            preparedStatement.setInt(5, product.getSold());
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();
        } catch (SQLException ignored) {
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCTS_SQL);) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException ignored) {
        }
    }

    @Override
    public Product findById(int id) throws SQLException {
        Product product = null;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_PRODUCT_BY_ID);) {
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            String productName = rs.getString("name");
            String description = rs.getString("description");
            int categoryId = rs.getInt("categoryId");
            String image = rs.getString("image");
            int sold = rs.getInt("sold");
            product = new Product(id, productName, categoryId, description, image, sold);

        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
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

    public List<Product> findByCategory(int categoryId) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_PRODUCT_BY_CID);) {
            callableStatement.setInt(1, categoryId);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int sold = rs.getInt("sold");
                products.add(new Product(id, productName, categoryId, description, image, sold));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }
}
