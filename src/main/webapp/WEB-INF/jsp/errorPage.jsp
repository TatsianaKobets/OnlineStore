<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 09.05.2021
  Time: 2:57
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

    <fmt:message bundle="${loc}" key="local.errorPage.message" var="errorText" />
    <fmt:message bundle="${loc}" key="local.errorPage.message.link" var="errorLink" />

    <fmt:message bundle="${loc}" key="local.footer.copyright" var="copyright" />

</head>
<body>

<div id="wrap">

    <header>
        <jsp:include page="/WEB-INF/jsp/header.jsp" />
    </header>

    <main>

        <br />

        <h1>${errorText}</h1>

        <br /><br />

        <a href="Controller?command=go_to_main">${errorLink}</a>

    </main>
</div>

<footer>
    ${copyright}
</footer>

</body>
</html>