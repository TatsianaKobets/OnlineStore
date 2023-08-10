package by.htp.pazl.controller.command.impl;

import by.htp.pazl.bean.User;
import by.htp.pazl.controller.command.Command;
import by.htp.pazl.service.OrderService;
import by.htp.pazl.service.UserService;
import by.htp.pazl.service.exception.ServiceException;
import by.htp.pazl.service.factory.ServiceFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SignInCommand implements Command {

    private static final String REQUEST_PARAMETER_USERNAME = "username";
    private static final String REQUEST_PARAMETER_LOGIN = "password";
    private static final String REDIRECT_COMMAND_SUCCESS = "Controller?command=go_to_main&login=success";
    private static final String REDIRECT_COMMAND_ERROR = "Controller?command=go_to_login&login=fail";
    private static final String ORDER_ID_SESSION_ATTR = "orderId";
    private static final String USER_SESSION_ATTR = "user";

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String login = req.getParameter(REQUEST_PARAMETER_USERNAME);
        String password = req.getParameter(REQUEST_PARAMETER_LOGIN);

        User user;

        ServiceFactory serviceFactory = ServiceFactory.getInstance();
        UserService userService = serviceFactory.getUserService();
        OrderService orderService = serviceFactory.getOrderService();
        HttpSession session = req.getSession(true);


        try {
            user = userService.signIn(login, password);

            if (user == null) {
                resp.sendRedirect(REDIRECT_COMMAND_ERROR);
                return;
            }


           int currentOrderId = orderService.getCurrentOrderId(user.getUserId());

            session.setAttribute(USER_SESSION_ATTR, user);

            if (currentOrderId > 0) {
                session.setAttribute(ORDER_ID_SESSION_ATTR, currentOrderId);
            }

            resp.sendRedirect(REDIRECT_COMMAND_SUCCESS);

        } catch (ServiceException e) {
            // log
            resp.sendRedirect(REDIRECT_COMMAND_ERROR);
        }

    }
}
