<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <c:forEach items="${elenco}" var="elem">
                <tr>
                    <td>${elem.nome}</td>
                    <td>${elem.cap}</td>
                    <td>${elem.prov}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>