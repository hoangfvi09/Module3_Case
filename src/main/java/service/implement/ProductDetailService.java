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
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO productDetails (inStock,price,status) VALUES (?,?,?);")) {
            preparedStatement.setInt(1, productDetailUpdated.getInStock());
            preparedStatement.setDouble(2,productDetailUpdated.getPrice());
            preparedStatement.setInt(3, productDetailUpdated.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException ignored) {
        }

    }

    @Override
    public void update(int id, ProductDetailUpdated productDetailUpdated) throws SQLException {

    }

    @Override
    public void delete(int id) throws SQLException {

    }

    @Override
    public ProductDetailUpdated findById(int proId) throws SQLException {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_PRO_DETAIL_BY_ID);) {
            callableStatement.setInt(1, proId);
            ResultSet rs = callableStatement.executeQuery();
            rs.next();
            int productId = rs.getInt("productId");
            int inStock = rs.getInt("inStock");
            double price = rs.getDouble("price");
            int status = rs.getInt("status");
            return new ProductDetailUpdated(productId, inStock, price, status);
        } catch (SQLException e) {
            printSQLException(e);
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

    @Override
    public List<ProductDetailUpdated> findByProductList(List<Product> products) throws SQLException {
        List<ProductDetailUpdated> productDetailList = new ArrayList<>();
        for (Product product : products
        ) {
            int id = product.getId();
            ProductDetailUpdated productDetail = findById(id);
            productDetailList.add(productDetail);
        }
        return productDetailList;
    }

    @Override
    public void updateStatus(int id, int status) {
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("update productDetails set status = ? where productId = ?;")) {
            preparedStatement.setInt(1,status);
            preparedStatement.setInt(2,id);
            preparedStatement.executeUpdate();
        } catch (SQLException ignored) {
        }

    }

    @Override
    public Double findPriceByProductId(int id) {
        double price = 0;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall("select price from productDetails where productId = ?");) {
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            rs.next();
            price = rs.getDouble("price");
        } catch (SQLException e) {
            printSQLException(e);
        }
        return price;
    }

    public List <Double> findPriceListByProductList(List <Product> products){
        List <Double> priceList = new ArrayList<>();
        for (Product product:products
             ) {
            double price = findPriceByProductId(product.getId());
            priceList.add(price);

        }
        return priceList;
    }
}
