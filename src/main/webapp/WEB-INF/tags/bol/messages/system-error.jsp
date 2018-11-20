<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../layout/html-head.jsp" %>
        <title>Pagina di errore | Prenotazione Aule </title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/risaffiliato.css"/>'>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>
        <div class="container-fluid riepilogo-risafiliato">
            <div class="row">
                <br><br><br>
                <h1><center>Pagina di errore</center></h1>
                <br><br>
                <h2> <center> Siamo spiacenti ma si è verificato un errore nel sistema.</center></h1>
                    <br>
                    <h3><center>La preghiamo di provare a ripetere l'operazione tra qualche minuto o di contattarci per risolvere il problema.</center></h3>
                    <br>
                    <br>
                    <h4><center>Codice identificativo di errore: ${errorId}</center></h4>
                    <!--
                      Codice identificativo di errore: ${errorId}
                      URL: ${url}
                      Eccezione:  ${exception.message}
                    <c:forEach items="${exception.stackTrace}" var="ste">    
                        ${ste} 
                    </c:forEach>
                    -->
            </div>
            <%@ include file="../layout/bol-footer.jsp"%>  
        </div>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
