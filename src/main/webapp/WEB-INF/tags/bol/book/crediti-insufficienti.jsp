<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../layout/html-head.jsp" %>

        <title>Crediti Insufficienti | Booking Online </title>
    </head>
    <body>

        <%@ include file="../layout/bol-header.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <h1> Siamo spiacenti ma il suo credito non è sufficiente per l'acquisto.</h1>
            </div>
        </div>
        <%@ include file="../layout/bol-footer.jsp"%>
        <%@ include file="../layout/html-end-of-body.jsp" %>



    </body>
</html>
