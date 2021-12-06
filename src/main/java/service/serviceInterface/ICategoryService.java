package service.serviceInterface;

import model.Category;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryService extends IService <Category>{
    List<Category> findByProductList(List<Product> products) throws SQLException;
}
