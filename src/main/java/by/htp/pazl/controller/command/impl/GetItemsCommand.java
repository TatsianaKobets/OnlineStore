package by.htp.pazl.controller.command.impl;


import by.htp.pazl.controller.command.Command;
import by.htp.pazl.service.ItemService;
import by.htp.pazl.service.exception.ServiceException;
import by.htp.pazl.service.factory.ServiceFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetItemsCommand implements Command {


    private static final String REQUEST_PARAMETER_CATEGORY_ID = "category";
    private static final String ITEMS_PAGE_URI = "WEB-INF/jsp/items.jsp";
    private static final String REDIRECT_COMMAND_ERROR = "Controller?command=go_to_catalog";
    private static final String ITEM_LIST_ATTR = "itemList";

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        ServiceFactory serviceFactory = ServiceFactory.getInstance();
        ItemService itemService = serviceFactory.getItemService();

       try {
           int categoryId = Integer.parseInt(req.getParameter(REQUEST_PARAMETER_CATEGORY_ID));
           req.setAttribute(ITEM_LIST_ATTR, itemService.getItemsByCategory(categoryId));
           RequestDispatcher dispatcher = req.getRequestDispatcher(ITEMS_PAGE_URI);
           dispatcher.forward(req, resp);
       } catch (ServiceException | NumberFormatException e) {
           e.printStackTrace();
           System.err.println("Some unexpected error for get Items - " + e.getMessage());
            resp.sendRedirect(REDIRECT_COMMAND_ERROR);
       }

    }
}