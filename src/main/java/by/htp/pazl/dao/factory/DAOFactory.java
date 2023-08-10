package by.htp.pazl.dao.factory;

import by.htp.pazl.dao.ItemDAO;
import by.htp.pazl.dao.OrderDAO;
import by.htp.pazl.dao.UserDAO;
import by.htp.pazl.dao.impl.OrderDAOImpl;
import by.htp.pazl.dao.impl.UserDAOImpl;
import by.htp.pazl.dao.impl.ItemDAOImpl;


public final class DAOFactory {
    private static final DAOFactory instance = new DAOFactory();



    private final UserDAO userDAO = new UserDAOImpl();
    private final ItemDAO itemDAO = new ItemDAOImpl();
    private final OrderDAO orderDAO = new OrderDAOImpl();
    private DAOFactory() {
    }

    public static DAOFactory getInstance() {
        return instance;
    }

    public UserDAO getUserDAO() { return userDAO;  }
    public ItemDAO getItemDAO() { return  itemDAO; }
    public OrderDAO getOrderDAO() {return  orderDAO;}
}