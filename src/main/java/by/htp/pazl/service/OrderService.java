package by.htp.pazl.service;


import by.htp.pazl.bean.Order;
import by.htp.pazl.dao.exception.DAOException;
import by.htp.pazl.service.exception.ServiceException;

import java.util.List;
import java.util.Map;

public interface OrderService {

    int createEmptyOrder(int userId) throws ServiceException; // создать пустой заказ
    boolean addItem(int orderId, int itemId, int count) throws ServiceException; //добавить товар в заказ
    boolean deleteItem(int orderId, int itemId) throws ServiceException; // удалить товар из заказа
    Order getOrder(int orderId) throws ServiceException; // получить заказ
    int getCurrentOrderId(int userId) throws ServiceException; // получить ID текущий заказ
    Map<Integer, String> getPaymentTypes() throws ServiceException; // список платежей
    void confirmOrder (Order order) throws ServiceException; // подтверждение заказа

}

