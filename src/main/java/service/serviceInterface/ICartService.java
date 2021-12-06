package service.serviceInterface;

import model.Cart;
import model.Product;

public interface ICartService extends IService<Cart> {
    boolean addProduct(Product product, int quantity);

    boolean deleteProduct(int id);

    boolean deleteAllProducts();

    boolean increaseQuantity(int proId, int usId);

    boolean decreaseQuantity(int proId, int usId);

    double calTotal(int userId);
}
