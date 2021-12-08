package service.implement;

import model.Order;
import model.Product;
import model.User;
import service.serviceInterface.IOrderService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderService implements IOrderService {

    private final String SQL_GET_ORDERS_BY_USER = "{CALL get_orders_by_users(?)}";
    private final String SQL_GET_ALL_ORDERS = "{CALL get_all_orders()}";


    public OrderService() {
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
    public List<Order> findByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall("select * from orders where userId = ?;");) {
            callableStatement.setInt(1, userId);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String time = (rs.getDate("time")).toString();
                String address = rs.getString("address");
                String phoneNo = rs.getString("phoneNo");
                int status = rs.getInt("status");
                orders.add(new Order(id, userId,time, address, phoneNo, status));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return orders;
    }

    @Override
    public List<Order> findByStatus(int status) {
        return null;
    }

    @Override
    public boolean changeStatus(int id, int status) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall("update orders set status = ? where id = ?;");) {
            callableStatement.setInt(1, status);
            callableStatement.setInt(2, id);
            int result = callableStatement.executeUpdate();
            return result >= 1;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean checkStatus(int id) {


        return false;
    }

    @Override
    public boolean changeAddress(Order order, String address) {
        return false;
    }

    @Override
    public boolean changePhoneNo(Order order, String phoneNo) {
        return false;
    }

    @Override
    public List<Order> findAll() throws SQLException {
        List<Order> orders = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_ALL_ORDERS);) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("userId");
                String time = (rs.getDate("time")).toString();
                String address = rs.getString("address");
                String phoneNo = rs.getString("phoneNo");
                int status = rs.getInt("status");
                orders.add(new Order(id, userId, time, address, phoneNo, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return orders;
    }

    @Override
    public void save(Order order) throws SQLException {

    }

    @Override
    public void update(int id, Order order) throws SQLException {

    }

    @Override
    public void delete(int id) throws SQLException {

    }

    @Override
    public Order findById(int id) throws SQLException {
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
