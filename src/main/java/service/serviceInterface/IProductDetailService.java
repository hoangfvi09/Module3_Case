package service.serviceInterface;

import model.Product;
import model.ProductDetailUpdated;

import java.sql.SQLException;
import java.util.List;

public interface IProductDetailService extends IService <ProductDetailUpdated> {
    List<ProductDetailUpdated> findByProductList(List<Product> products) throws SQLException;
    void updateStatus(int id, int status);
}
