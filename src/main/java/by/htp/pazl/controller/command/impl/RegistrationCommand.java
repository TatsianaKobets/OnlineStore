package by.htp.pazl.controller.command.impl;

import by.htp.pazl.bean.User;
import by.htp.pazl.controller.command.Command;
import by.htp.pazl.service.UserService;
import by.htp.pazl.service.exception.ServiceException;
import by.htp.pazl.service.exception.ServiceUserAlreadyExistsException;
import by.htp.pazl.service.factory.ServiceFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RegistrationCommand implements Command {

    private static final String REQUEST_PARAMETER_LOGIN = "login";
    private static final String REQUEST_PARAMETER_PASSWORD = "password";
    private static final String REQUEST_PARAMETER_USERNAME = "username";
    private static final String REQUEST_PARAMETER_SURNAME = "surname";
    private static final String REQUEST_PARAMETER_EMAIL = "email";
    private static final int DEFAULT_ROLE_ID = 2;
    private static final String REDIRECT_COMMAND_SUCCESS = "Controller?command=go_to_main&register=success";
    private static final String REDIRECT_COMMAND_ERROR = "Controller?command=go_to_register&register=error";
    private static final String REDIRECT_COMMAND_ERROR_DUPLICATE = "Controller?command=go_to_register&error=unique";

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String login = req.getParameter(REQUEST_PARAMETER_LOGIN);
        String password = req.getParameter(REQUEST_PARAMETER_PASSWORD);
        String username = req.getParameter(REQUEST_PARAMETER_USERNAME);
        String surname = req.getParameter(REQUEST_PARAMETER_SURNAME);
        String email = req.getParameter(REQUEST_PARAMETER_EMAIL);

// Default role for user
        int roleId = DEFAULT_ROLE_ID;

        ServiceFactory serviceFactory = ServiceFactory.getInstance();
        UserService userService = serviceFactory.getUserService();

        Boolean registrationResult;

        try {


            registrationResult = userService.registration(login, password, username, surname, email);


            if (registrationResult) {
                resp.sendRedirect(REDIRECT_COMMAND_SUCCESS);
            } else {
                resp.sendRedirect(REDIRECT_COMMAND_ERROR);
            }
        } catch (ServiceUserAlreadyExistsException e) {
            resp.sendRedirect(REDIRECT_COMMAND_ERROR_DUPLICATE);
        } catch (ServiceException e) {
            // log (unsuccessful registration)
            resp.sendRedirect(REDIRECT_COMMAND_ERROR);
        }

    }
}
