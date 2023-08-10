package by.htp.pazl.service;

import by.htp.pazl.bean.Category;
import by.htp.pazl.bean.Item;
import by.htp.pazl.bean.Review;
import by.htp.pazl.service.exception.ServiceException;

import java.util.List;

public interface ItemService {

        List<Category> getCategories() throws ServiceException;
        List<Item> getItemsByCategory(int categoryId) throws ServiceException;
        Item getItem(int itemId) throws ServiceException;
        boolean addItemReview(int userId, int itemId, byte rate, String comment) throws ServiceException;
        List<Review> getItemReviews(int itemId) throws ServiceException;
}
