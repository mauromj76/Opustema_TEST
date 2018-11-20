<%-- 
    Document   : coffeeShop21
    Created on : Oct 22, 2018, 6:19:02 PM
    Author     : Mauro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to our coffee shop!</title>
    </head>
    <body>
        <h1>Welcome to our coffee shop!</h1>
        <h1>Please place your order below</h1>

        <form
            action="http://localhost:8080/jopustema/coffees21"
            method="GET">
            First item:<br>
            <input type="text" name="descr01"> : <input type="number" name="value01" step="0.01"><br>
            Second item:<br>
            <input type="text" name="descr02"> : <input type="number" name="value02" step="0.01"><br>
            Third item:<br>
            <input type="text" name="descr03"> : <input type="number" name="value03" step="0.01"><br>
            <input type="submit" value="PRINT RECEIPT">
            
        </form>

    </body>
</html>
