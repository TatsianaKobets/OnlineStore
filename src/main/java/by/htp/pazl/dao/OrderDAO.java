package by.htp.pazl.dao;


import by.htp.pazl.bean.Order;
import by.htp.pazl.dao.exception.DAOException;

import java.util.List;
import java.util.Map;


public interface OrderDAO {
    int createEmptyOrder(int userId) throws DAOException; // создать пустой заказ
    void addItem(int orderId, int itemId, int count) throws DAOException; // добавить товар в заказ
    void deleteItem(int orderId, int itemId) throws DAOException; //удаолить товар
    Order getOrder(int orderId) throws DAOException; // получить заказ
    int getCurrentOrderId(int userId) throws DAOException;//получить ID текущий заказ
    Map<Integer, String> getPaymentTypes() throws DAOException;// список платежей
    void confirmOrder(Order oder) throws DAOException; //подтверждение заказа
}
