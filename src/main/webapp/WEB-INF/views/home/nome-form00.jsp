<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Inserisci i dati</h1>
        
        <form 
            action="http://localhost:8080/jopustema/nominativo00"
            method="GET">
            <input type="text" name="nome">
            <input type="text" name="cognome">
            <input type="submit">
        </form>
    </body>
</html>
