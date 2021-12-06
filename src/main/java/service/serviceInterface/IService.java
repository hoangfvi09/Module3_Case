package service.serviceInterface;

import java.sql.SQLException;
import java.util.List;

public interface IService<T> {
    List<T> findAll() throws SQLException;

    void save(T t) throws SQLException;

    void update(int id, T t) throws SQLException;

    void delete(int id) throws SQLException;

    T findById(int id) throws SQLException;
}
