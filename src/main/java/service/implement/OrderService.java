package service.implement;

import model.Order;
import model.User;
import service.serviceInterface.IOrderService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class OrderService implements IOrderService {

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
    public List<Order> findByUser(User user) {
        return null;
    }

    @Override
    public List<Order> findByStatus(int status) {
        return null;
    }

    @Override
    public boolean changeStatus(int status) {
        return false;
    }

    @Override
    public boolean checkStatus(Order order) {
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
        return null;
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
