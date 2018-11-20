<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Castello</h1>
        <a href="http://localhost:8080/jopustema/buca21">Vai alle Scale</a>
        <a href="http://localhost:8080/jopustema/drago21">Vai alla Torre</a>
        <hr>

        <c:forEach begin="1" end="20" var="j">
            ${j} <br>
        </c:forEach>
        <hr>
        <ul>
            <c:forEach items="${nani}" var="n">
                <li> ${n}</li>
            </c:forEach>
        </ul>
    </body>
</html>
