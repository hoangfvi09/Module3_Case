package service.serviceInterface;

import model.Cart;
import model.Product;

import java.util.List;

public interface ICartService extends IService<Cart> {
    boolean addProduct(int proId,int usId, int quantity);

    boolean deleteProduct(int id, int usId);

    boolean deleteProduct(int id, List<Cart> cartList);

    boolean deleteAllProduct( List<Cart> cartList);

    boolean deleteAllProducts(int usId);

    boolean increaseQuantity(int proId, int usId);

    boolean decreaseQuantity(int proId, int usId);

    boolean decreaseQuantity(int proId, List<Cart> cartList);

    boolean increaseQuantity(int proId, List<Cart> cartList);

    double calTotal(int userId);

    int alreadyInCart(int productId, List<Cart> cartList);
}
