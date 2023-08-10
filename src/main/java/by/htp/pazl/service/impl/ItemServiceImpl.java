package by.htp.pazl.service.impl;

import by.htp.pazl.bean.Category;
import by.htp.pazl.bean.Item;
import by.htp.pazl.bean.Review;
import by.htp.pazl.dao.ItemDAO;
import by.htp.pazl.dao.exception.DAOException;
import by.htp.pazl.dao.factory.DAOFactory;
import by.htp.pazl.service.ItemService;
import by.htp.pazl.service.exception.ServiceException;

import java.util.List;

public class ItemServiceImpl implements ItemService {
    @Override
    public List<Category> getCategories() throws ServiceException {
        DAOFactory factory = DAOFactory.getInstance();
        ItemDAO itemDAO = factory.getItemDAO();

        try {
            return itemDAO.getCategories();
        } catch (DAOException e) {
            throw new ServiceException("Error while find all categories", e);
        }
    }

    @Override
    public List<Item> getItemsByCategory(int categoryId) throws ServiceException {
        DAOFactory factory = DAOFactory.getInstance();
        ItemDAO itemDAO = factory.getItemDAO();

        if (categoryId < 1) {
            return null;
        }

        try {
            return itemDAO.findItemsByCategory(categoryId);
        } catch (DAOException e) {
            throw new ServiceException("Error while find Items by category", e);
        }
    }

    @Override
    public Item getItem(int itemId) throws ServiceException {
        DAOFactory factory = DAOFactory.getInstance();
        ItemDAO itemDAO = factory.getItemDAO();

        if (itemId < 1) {
            return null;
        }

        try {
            return itemDAO.getItem(itemId);
        } catch (DAOException e) {
            throw new ServiceException("Error while find Item by ID", e);
        }
    }

    @Override
    public boolean addItemReview(int userId, int itemId, byte rate, String comment) throws ServiceException {
        DAOFactory factory = DAOFactory.getInstance();
        ItemDAO itemDAO = factory.getItemDAO();

        if (userId < 1 || itemId < 1 || rate < 1 || rate > 5) {
            return false;
        }

        try {
            itemDAO.addItemReview(userId, itemId, rate, comment);
            return true;
        } catch (DAOException e) {
            throw new ServiceException("Error while adding Review", e);
        }
    }

    @Override
    public List<Review> getItemReviews(int itemId) throws ServiceException {
        DAOFactory factory = DAOFactory.getInstance();
        ItemDAO itemDAO = factory.getItemDAO();

        if (itemId < 1) {
            return null;
        }

        try {
            return itemDAO.getItemReviews(itemId);
        } catch (DAOException e) {
            throw new ServiceException("Error while get last Reviews", e);
        }
    }

}
