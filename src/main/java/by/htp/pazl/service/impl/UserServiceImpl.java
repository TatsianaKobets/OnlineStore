package by.htp.pazl.service.impl;

import by.htp.pazl.bean.User;
import by.htp.pazl.dao.UserDAO;
import by.htp.pazl.dao.exception.DAOException;
import by.htp.pazl.dao.exception.DAOUserAlreadyExistsException;
import by.htp.pazl.dao.factory.DAOFactory;
import by.htp.pazl.service.UserService;
import by.htp.pazl.service.exception.ServiceException;
import by.htp.pazl.service.exception.ServiceUserAlreadyExistsException;

public class UserServiceImpl implements UserService {
    @Override
    public User signIn(String login, String password) throws ServiceException {

        DAOFactory factory = DAOFactory.getInstance();
        if (login.equals("") || password.equals("")) {
            return null;
        }

        UserDAO userDAO = factory.getUserDAO();

        try {
            return userDAO.signIn(login, password);
        } catch (DAOException e) {
            throw new ServiceException("Error while signIn User", e);
        }
    }
    @Override
    public boolean registration(String login, String password, String name, String surname, String email) throws ServiceException {

        if (login.equals("") || password.equals("")) {
            return false;
        }

        DAOFactory factory = DAOFactory.getInstance();
        UserDAO userDAO = factory.getUserDAO();

        try {
            userDAO.registration(login, password, name, surname, email);
        } catch (DAOUserAlreadyExistsException e) {
            throw new ServiceUserAlreadyExistsException("User already exists", e);
        } catch (DAOException e) {
            throw new ServiceException("Error while registration User", e);
        }

        return true;
    }

}