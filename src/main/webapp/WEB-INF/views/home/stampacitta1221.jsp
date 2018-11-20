<%-- 
    Document   : stampacitta1221
    Created on : Nov 7, 2018, 5:44:36 PM
    Author     : Mauro
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
        <table>
            <c:forEach items="${elencoCitta}" var="elem">
                <tr>
                    <td>${elem.nome}</td>
                    <td>${elem.cap}</td>
                    <td>${elem.provincia}</td>                    
                </tr>                
            </c:forEach>         
        </table>
    </body>
</html>
