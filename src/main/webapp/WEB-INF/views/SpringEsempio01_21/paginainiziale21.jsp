<%-- 
    Document   : paginainiziale21
    Created on : Nov 12, 2018, 10:14:33 PM
    Author     : Mauro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina iniziale</title>
    </head>
    <body>
        <h1>Pagina iniziale esempio spring 01_21</h1>
        
        <h1>Inserisci un numero intero qualunque</h1>

        <form
            action="http://localhost:8080/jopustema/eseguiesempio01"
            method="GET">
            <input type="number" name="variabileinput01" placeholder="numero intero">
            <input type="submit" value="verifica numero intero">
        </form>
    </body>
</html>
