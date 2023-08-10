package by.htp.pazl.service.factory;

import by.htp.pazl.service.ItemService;
import by.htp.pazl.service.UserService;
import by.htp.pazl.service.impl.ItemServiceImpl;
import by.htp.pazl.service.OrderService;
import by.htp.pazl.service.impl.OrderServiceImpl;
import by.htp.pazl.service.impl.UserServiceImpl;

public final class ServiceFactory {
    private static final ServiceFactory instance = new ServiceFactory();

    private final UserService userService = new UserServiceImpl();
    private final ItemService itemService = new ItemServiceImpl();
    private final OrderService orderService = new OrderServiceImpl();

    private ServiceFactory() {}

    public static ServiceFactory getInstance() {
        return instance;
    }

    public UserService getUserService() {
        return userService;
    }

    public ItemService getItemService() { return itemService; }

    public OrderService getOrderService() {return orderService;}
}

