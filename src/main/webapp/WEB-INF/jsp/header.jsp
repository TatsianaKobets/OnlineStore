<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 14.02.2021
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link href="styleCSS.css" rel="stylesheet" type="text/css"/>

        <fmt:setLocale value="${sessionScope.local}" />
        <fmt:setBundle basename="localization.local" var="loc" />

        <fmt:message bundle="${loc}" key="local.message" var="message" />
        <fmt:message bundle="${loc}" key="local.locbutton.name.ru" var="ru_button" />
        <fmt:message bundle="${loc}" key="local.locbutton.name.en" var="en_button" />

        <fmt:message bundle="${loc}" key="local.header.name" var="headerName" />

    </head>

<body>
${headerName}
<div class="languages">
    <table>
        <tr>
            <td>
                <form action="Controller" method="post">
                    <input type="hidden" name="command" value="changeLocale" />
                    <input type="hidden" name="local" value="ru" />
                    <input type="submit" value="${ru_button}" />
                    <br />
                </form>
            </td>
            <td>
                <form action="Controller" method="post">
                    <input type="hidden" name="command" value="changeLocale" />
                    <input type="hidden" name="local" value="en" />
                    <input type="submit" value="${en_button}" />
                    <br />
                </form>
            </td>
        </tr>
    </table>
</div>
</body>
</html>