package service.serviceInterface;

import model.Order;
import model.User;

import java.util.List;

public interface IOrderService extends IService<Order> {
    List<Order> findByUserId(int id);


    List<Order> findByStatus(int status);

    boolean changeStatus(int id, int status);

    boolean checkStatus(int id);

    boolean changeAddress(Order order, String address);

    boolean changePhoneNo(Order order, String phoneNo);

}
