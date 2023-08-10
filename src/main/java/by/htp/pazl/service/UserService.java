package by.htp.pazl.service;

import by.htp.pazl.bean.User;
import by.htp.pazl.service.exception.ServiceException;

public interface UserService {
    User signIn (String login, String password) throws ServiceException;
    boolean registration(String login, String password, String name, String surname, String email) throws ServiceException;
}