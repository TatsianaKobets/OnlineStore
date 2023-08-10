<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 14.02.2021
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="styleCSS.css" rel="stylesheet" type="text/css"/>

    <fmt:setLocale value="${sessionScope.local}" />
    <fmt:setBundle basename="localization.local" var="loc" />

    <fmt:message bundle="${loc}" key="local.header.name" var="headerName" />

</head>

<body>
<div class="menu_left">

    <c:forEach items="${applicationScope.categoryList}" var="element">
        <p><a href="Controller?command=get_items&category=${element.categoryId}">${element.name}</a></p>
    </c:forEach>

</div>
</body>
</html>
