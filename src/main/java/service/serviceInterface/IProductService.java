package service.serviceInterface;

import model.Product;

import java.util.List;

public interface IProductService extends IService<Product> {

    List<Product> find(String info);

    List<Product> findAllPriceDesc();

    List<Product> findAllPriceAsc();

    List<Product> findByPrice(double max, double min);

    List<Product> findByCategory(String name);



}
