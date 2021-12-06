package service.implement;

import model.Order;
import model.Product;
import model.ProductDetailUpdated;
import service.serviceInterface.IProductDetailService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDetailService implements IProductDetailService {
    private final String SQL_GET_PRO_DETAIL_BY_ID = "{Call get_product_detail_by_id(?)}";
    private final String SQL_GET_ALL_PRO_DETAILS = "{Call get_all_product_detail()}";

    public ProductDetailService() {
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
    public List<ProductDetailUpdated> findAll() throws SQLException {
        List<ProductDetailUpdated> productDetails = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_ALL_PRO_DETAILS);) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productId");
                int inStock = rs.getInt("inStock");
                double price = rs.getDouble("price");
                int status = rs.getInt("status");
                productDetails.add(new ProductDetailUpdated(productId, inStock, price, status));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return productDetails;
    }

    @Override
    public void save(ProductDetailUpdated productDetailUpdated) throws SQLException {

    }

    @Override
    public void update(int id, ProductDetailUpdated productDetailUpdated) throws SQLException {

    }

    @Override
    public void delete(int id) throws SQLException {

    }

    @Override
    public ProductDetailUpdated findById(int proId) throws SQLException {
        ProductDetailUpdated productDetails = new ProductDetailUpdated();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_PRO_DETAIL_BY_ID);) {
            ResultSet rs = callableStatement.executeQuery();

            int productId = rs.getInt("productId");
            int inStock = rs.getInt("inStock");
            double price = rs.getDouble("price");
            int status = rs.getInt("status");
            productDetails = new ProductDetailUpdated(productId, inStock, price, status);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return productDetails;
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

    @Override
    public List<ProductDetailUpdated> findByProductList(List<Product> products) throws SQLException {
        List<ProductDetailUpdated> productDetailList = new ArrayList<>();
        for (Product product : products
        ) {
            productDetailList.add(findById(product.getId()));
        }
        return productDetailList;
    }
}
