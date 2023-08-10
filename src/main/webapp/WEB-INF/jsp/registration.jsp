<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 14.02.2021
  Time: 2:50
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

    <fmt:message bundle="${loc}" key="local.registration.login.name" var="loginNameLbl" />
    <fmt:message bundle="${loc}" key="local.registration.password.name" var="passwordName" />
    <fmt:message bundle="${loc}" key="local.registration.Name.name" var="Name" />
    <fmt:message bundle="${loc}" key="local.registration.LastName.name" var="lastName" />
    <fmt:message bundle="${loc}" key="local.registration.email.name" var="emailName" />

    <fmt:message bundle="${loc}" key="local.catalog.label.price" var="priceLabel" />
    <fmt:message bundle="${loc}" key="local.catalog.label.currency" var="priceCurrency" />
    <fmt:message bundle="${loc}" key="local.item.label.rating" var="ratingLabel" />

    <fmt:message bundle="${loc}" key="local.item.cart.cartName" var="CartName" />

    <fmt:message bundle="${loc}" key="local.order.confirm.comment.text" var="confirmComment" />
    <fmt:message bundle="${loc}" key="local.order.confirm.address.text" var="confirmAddress" />
    <fmt:message bundle="${loc}" key="local.order.confirm.paymentType.text" var="confirmPaymentType" />
    <fmt:message bundle="${loc}" key="local.order.confirm.submit.button" var="confirmSubmitBtn" />
    <fmt:message bundle="${loc}" key="local.order.confirm.ok.message1" var="confirmOkMessage1" />
    <fmt:message bundle="${loc}" key="local.order.confirm.ok.message2" var="confirmOkMessage2" />
    <fmt:message bundle="${loc}" key="local.order.cart.empty.text" var="cartEmptyText" />

    <fmt:message bundle="${loc}" key="local.registration.btnSubmit.name" var="btnSubmitName" />
    <fmt:message bundle="${loc}" key="local.registration.fail.message" var="registrationFailMessage" />
    <fmt:message bundle="${loc}" key="local.registration.fail.unique.message" var="registrationFailUnique" />

    <fmt:message bundle="${loc}" key="local.footer.copyright" var="copyright" />

</head>
<body>

<div id="wrap">

    <header>
        <jsp:include page="/WEB-INF/jsp/header.jsp" />
    </header>

    <main>
        <br />

        <jsp:include page="/WEB-INF/jsp/menuTop.jsp" />

        <br />

        <c:if test="${param.register == 'error'}">
            <h2 class="login_fail_message">${registrationFailMessage}</h2>
        </c:if>
        <c:if test="${param.error == 'unique'}">
            <h2 class="login_fail_message">${registrationFailUnique}</h2>
        </c:if>

        <div class="registration_container">
            <form action="Controller" method="post">
                <input type="hidden" name="command" value="registration" />

                <TABLE class="tbl_cnt">
                    <tr>
                        <td>
                            <label for="login">${loginNameLbl}</label>
                        </td>
                        <td>
                            <input type="text" id="login" name="login" >
                            <br /><br />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="password">${passwordName}</label>
                        </td>
                        <td>
                            <input type="password" id="psw" name="password" >
                            <br /><br />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="username">${Name}</label>
                        </td>
                        <td>
                            <input type="text" id="username" name="username" >
                            <br /><br />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="surname">${lastName}</label>
                        </td>
                        <td>
                            <input type="text" id="surname" name="surname" >
                            <br /><br />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="email">${emailName}</label>
                        </td>
                        <td>
                            <input type="email" id="email" name="email" >
                            <br /><br />
                        </td>
                    </tr>
                </table>
                <input type="submit" value="${btnSubmitName}">
            </form>
        </div>
    </main>
</div>

<footer>
    ${copyright}
</footer>

</body>
</html>
