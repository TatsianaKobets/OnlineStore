package by.htp.pazl.dao;

import by.htp.pazl.bean.User;
import by.htp.pazl.dao.exception.DAOException;

public interface UserDAO {
    void registration(String login, String password, String name, String surname, String email) throws DAOException;

    User signIn(String login, String password) throws DAOException;
}

