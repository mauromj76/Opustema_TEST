<%-- 
    Document   : campo00
    Created on : 17-ott-2018, 14.55.03
    Author     : studente
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Sei nel castello</h1>
        <a href="http://localhost:8080/jopustema/scale00">Vai per le scale</a><br>
        <a href="http://localhost:8080/jopustema/torre00">Vai sulla torre</a><br>

        <c:forEach begin="1" end="20" var="j">
            ${j} <br>
        </c:forEach>

        <hr>
        <ul>
            <c:forEach items="${nani}" var="n">
                <li>${n}</li>
            </c:forEach>
        </ul>
    </body>
</html>
