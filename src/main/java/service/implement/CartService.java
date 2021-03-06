package service.implement;

import model.Cart;
import model.Product;
import service.serviceInterface.ICartService;

import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartService implements ICartService {

    private final String SQL_EMPTY_CART = "delete from carts where userId = ?;";
    private final String SQL_DELETE_PRODUCT_FROM_CART = "delete from carts where userId = ? and productId = ?;";
    private final String SQL_GET_PRODUCTS_FROM_CART = "{CALL get_my_cart(?)}";
    private final String SQL_INCREASE_QUANTITY = "{CALL increase_quantity_cart(?,?)}";
    private final String SQL_DECREASE_QUANTITY = "{CALL decrease_quantity_cart(?,?)}";


    public CartService() {
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
    public boolean addProduct(int proId, int usId, int quantity) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall("insert into carts (productId,userId,quantity) values (?,?,?);");) {
            callableStatement.setInt(1, proId);
            callableStatement.setInt(2, usId);
            callableStatement.setInt(3, quantity);
            int result = callableStatement.executeUpdate();
            return result >= 1;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean deleteProduct(int id, int usId) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_DELETE_PRODUCT_FROM_CART);) {
            callableStatement.setInt(1, usId);
            callableStatement.setInt(2, id);
            int result = callableStatement.executeUpdate();
            return result >= 1;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean deleteProduct(int id, List<Cart> cartList) {
        for (int i = 0; i < cartList.size(); i++
        ) {
            if (cartList.get(i).getProductId() == id) {
                cartList.remove(i);
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean deleteAllProduct(List<Cart> cartList) {
        for (int i = 0; i < cartList.size(); i++
        ) {
            cartList.remove(i);
        }

        return true;
    }

    @Override
    public boolean deleteAllProducts(int usId) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_EMPTY_CART);) {
            callableStatement.setInt(1, usId);
            int result = callableStatement.executeUpdate();
            return result >= 1;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean increaseQuantity(int proId, int usId) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_INCREASE_QUANTITY);) {
            callableStatement.setInt(1, proId);
            callableStatement.setInt(2, usId);
            int result = callableStatement.executeUpdate();
            return result >= 1;
        } catch (SQLException e) {
            printSQLException(e);
        }

        return false;
    }

    @Override
    public boolean decreaseQuantity(int proId, int usId) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_DECREASE_QUANTITY);) {
            callableStatement.setInt(1, proId);
            callableStatement.setInt(2, usId);
            int result = callableStatement.executeUpdate();
            return result >= 1;
        } catch (SQLException e) {
            printSQLException(e);
        }
//        int quantity = getQuantity(proId, usId);
//        if (quantity < 1) {
//            deleteProduct(proId, usId);
//        }
        return false;
    }

    @Override
    public boolean decreaseQuantity(int proId, List<Cart> cartList) {
        for (Cart cart : cartList
        ) {
            if (cart.getProductId() == proId) {
                int quantity = cart.getQuantity();
                quantity--;
                cart.setQuantity(quantity);
                if (cart.getQuantity() < 1) {
                    deleteProduct(proId, cartList);
                }
                return true;

            }
        }
        return false;
    }

    @Override
    public boolean increaseQuantity(int proId, List<Cart> cartList) {
        for (Cart cart : cartList
        ) {
            if (cart.getProductId() == proId) {
                int quantity = cart.getQuantity();
                quantity++;
                cart.setQuantity(quantity);
                return true;
            }
        }
        return false;
    }

    @Override
    public double calTotal(int userId) {
        return 0;
    }

    @Override
    public int alreadyInCart(int productId, List<Cart> cartList) {
        for (int i = 0; i < cartList.size(); i++) {
            if (cartList.get(i).getProductId() == productId) {
                return i;
            }
        }
        return -1;
    }

    @Override
    public int getQuantity(int proId, int usId) {
        int quantity = 0;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall("select quantity from carts where userId = ? and productId = ?;");) {
            callableStatement.setInt(1, usId);
            callableStatement.setInt(2, proId);

            ResultSet result = callableStatement.executeQuery();
            result.next();
            quantity = result.getInt("quantity");
        } catch (SQLException e) {
            printSQLException(e);
        }
        return quantity;
    }

    @Override
    public List<Cart> findAll() throws SQLException {
        return null;
    }

    @Override
    public void save(Cart cart) throws SQLException {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall("insert into carts (productId, userId, quantity) values (?,?,?);");) {
            callableStatement.setInt(1, cart.getProductId());
            callableStatement.setInt(2, cart.getUserId());
            callableStatement.setInt(3, cart.getQuantity());
            int result = callableStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public void update(int id, Cart cart) throws SQLException {
    }

    @Override
    public void delete(int id) throws SQLException {
    }

    @Override
    public Cart findById(int id) throws SQLException {
        return null;
    }


    public List<Cart> findByUserId(int id) throws SQLException {
        List<Cart> myCart = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SQL_GET_PRODUCTS_FROM_CART);) {
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("userId");
                int productId = rs.getInt("productId");
                int quantity = rs.getInt("quantity");
                if (quantity < 1) {
                    deleteProduct(productId, userId);
                } else {
                    myCart.add(new Cart(userId, productId, quantity));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return myCart;
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
