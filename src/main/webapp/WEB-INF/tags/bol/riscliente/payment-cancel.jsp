<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../layout/html-head.jsp" %>

        <title>Pagamento non riuscito | Booking Online </title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/risaffiliato.css"/>'>
    </head>
    <body>

        <%@ include file="../layout/bol-header.jsp"%>
        <div class="container-fluid riepilogo-risafiliato">
            <div class="row">
                <h1><center> Siamo spiacenti ma si è verificato un problema durante il pagamento.</center></h1>
                <br>
                <h2><center>La preghiamo di provare a ripetere l'operazione tra qualche minuto o la invitiamo a contattarci per risolvere il problema.</center></h2>
            </div>
            <%@ include file="../layout/bol-footer.jsp"%>  
        </div>
        <%@ include file="../layout/html-end-of-body.jsp" %>



    </body>
</html>
