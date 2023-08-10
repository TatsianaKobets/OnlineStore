package by.htp.pazl.controller.command.impl;

import javax.servlet.http.HttpServletRequest;

import by.htp.pazl.bean.Order;
import by.htp.pazl.controller.command.Command;
import by.htp.pazl.service.OrderService;
import by.htp.pazl.service.exception.ServiceException;
import by.htp.pazl.service.factory.ServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ConfirmOrderCommand implements Command {

    private static final String REDIRECT_COMMAND = "Controller?command=get_cart";
    private static final String ORDER_ID_SESSION_ATTR = "orderId";
    private static final String CONFIRM_OK = "&confirm=ok&orderId=";
    private static final String CONFIRM_ERROR = "&confirm=error";
    private static final String ADDRESS_REQ_ATTR = "address";
    private static final String COMMENT_REQ_ATTR = "comment";
    private static final String PAYMENT_TYPE_REQ_ATTR = "paymentType";

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Order order;
        int orderId;

        try {
            orderId = (int) session.getAttribute(ORDER_ID_SESSION_ATTR);

            ServiceFactory serviceFactory = ServiceFactory.getInstance();
            OrderService orderService = serviceFactory.getOrderService();
            order = orderService.getOrder(orderId);

            order.setAddress(req.getParameter(ADDRESS_REQ_ATTR));
            order.setComment(req.getParameter(COMMENT_REQ_ATTR));
            order.setPaymentType(req.getParameter(PAYMENT_TYPE_REQ_ATTR));
            orderService.confirmOrder(order);

            resp.sendRedirect(REDIRECT_COMMAND + CONFIRM_OK + orderId);

        } catch (ServiceException e) {
            resp.sendRedirect(REDIRECT_COMMAND + CONFIRM_ERROR);
        }

    }
}

