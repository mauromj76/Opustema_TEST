<%-- 
    Document   : formsomma21
    Created on : 19-ott-2018, 12.41.44
    Author     : mauro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forma Somma 21</title>
    </head>
    <body>
       <h1>Inserisci i dati</h1>

        <form
            action="http://localhost:8080/jopustema/somma21"
            method="GET">
            <input type="number" name="Numero1">
            <input type="number" name="Numero2">
            <input type="submit">
        </form>
    </body>
</html>
