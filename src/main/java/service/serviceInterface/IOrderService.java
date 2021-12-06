package service.serviceInterface;

import model.Order;
import model.User;

import java.util.List;

public interface IOrderService extends IService<Order> {
    List<Order> findByUser(User user);

    List<Order> findByStatus(int status);

    boolean changeStatus(int status);

    boolean checkStatus(Order order);

    boolean changeAddress(Order order, String address);

    boolean changePhoneNo(Order order, String phoneNo);

}
