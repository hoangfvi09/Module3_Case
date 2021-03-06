package service.serviceInterface;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService extends IService<User> {
    List<User> findByEmail(String emailToFind);

    User verifyLogin(String username, String password) throws SQLException;

    User checkAccountExist(String username) throws SQLException;

    boolean isExisting(String email) throws SQLException;


}
