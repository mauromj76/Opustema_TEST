

<%@page import="it.logicadeisistemi.bol.hbol.controller.FomExampleController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simple Calculator</title>
    </head>
    <body>
        <c:url value="<%= FomExampleController.RQ_SUM%>" var="formAction"/>
        <form:form modelAttribute="calcForm" action="${formAction}" method="post">
            Number1 : <form:input path="number1"/>   +   Number2: <form:input path="number2"/>
            <input type="submit" value="Calculate" />
        </form:form>
    </body>
</html>
