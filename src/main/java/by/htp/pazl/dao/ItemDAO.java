package by.htp.pazl.dao;

import by.htp.pazl.bean.Category;
import by.htp.pazl.bean.Item;
import by.htp.pazl.bean.Review;
import by.htp.pazl.dao.exception.DAOException;

import java.util.List;

public interface ItemDAO {
    List<Item> findItemsByCategory(int categoryId) throws DAOException;
    List<Category> getCategories() throws DAOException;
    Item getItem(int itemId) throws DAOException;
    void addItemReview(int userId, int itemId, byte rate, String comment) throws DAOException;
    List<Review> getItemReviews(int itemId) throws DAOException;
}



