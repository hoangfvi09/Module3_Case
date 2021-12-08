package service.serviceInterface;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductService extends IService<Product> {

    List<Product> find(String info);

    List<Product> findAllPriceDesc();

    List<Product> findAllPriceAsc();

    List<Product> findByPrice(double max, double min);

    public List<Product> findByCategory(int categoryId);
    List<Product> findPurchasedProducts(int usId) throws SQLException;



}
