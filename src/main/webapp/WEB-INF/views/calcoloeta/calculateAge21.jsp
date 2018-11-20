<%-- 
    Document   : calcoloEta21
    Created on : Oct 22, 2018, 5:20:58 PM
    Author     : Mauro
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Age Calculation</title>
    </head>
    <body>
        <h1>Please insert your year of birth</h1>

        <form
            action="http://localhost:8080/jopustema/calcage21"
            method="GET">
            <input type="number" name="year" placeholder="Year of birth">
            <input type="submit" value="Find how old you are!">
        </form>
    </body>
</html>
