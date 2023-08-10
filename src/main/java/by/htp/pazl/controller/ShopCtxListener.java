package by.htp.pazl.controller;

import by.htp.pazl.controller.exception.ControllerRuntimeException;
import by.htp.pazl.dao.impl.connection.C3P0ConnectionPool;
import by.htp.pazl.service.ItemService;
import by.htp.pazl.service.OrderService;
import by.htp.pazl.service.exception.ServiceException;
import by.htp.pazl.service.factory.ServiceFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ShopCtxListener implements ServletContextListener {

    private static final String CATEGORY_LIST_ATTR = "categoryList";
    private static final String PAYMENT_TYPES_MAP_ATTR = "paymentTypesMap";

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();

        ServiceFactory serviceFactory = ServiceFactory.getInstance();
        ItemService itemService = serviceFactory.getItemService();
        OrderService orderService = serviceFactory.getOrderService();

        try {

            servletContext.setAttribute(CATEGORY_LIST_ATTR, itemService.getCategories());
            servletContext.setAttribute(PAYMENT_TYPES_MAP_ATTR, orderService.getPaymentTypes());
        } catch (ServiceException e) {
            throw new ControllerRuntimeException(e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}