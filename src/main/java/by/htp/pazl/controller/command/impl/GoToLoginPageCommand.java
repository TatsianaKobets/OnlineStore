package by.htp.pazl.controller.command.impl;

import by.htp.pazl.controller.command.Command;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GoToLoginPageCommand implements Command {

    private static final String LOGIN_PAGE_URI = "WEB-INF/jsp/login.jsp";

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher(LOGIN_PAGE_URI);
        dispatcher.forward(req, resp);
    }
}