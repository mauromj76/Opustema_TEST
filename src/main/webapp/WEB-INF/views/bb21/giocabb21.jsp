<%-- 
    Document   : GiocaBB21
    Created on : Nov 12, 2018, 5:50:13 PM
    Author     : Mauro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gioco BB21</title>
    </head>
    <body>
       <h1>Benvenuto nel gioco BB</h1>
        <hr>
        <h2>${esitoHu}</h2>
        <hr>
        <h2>Il tentativo di BB è ${tentativoBB21}</h2>
        <a href="http://localhost:8080/jopustema/vincebb21">
            <button type="button">BB ha vinto</button>
        </a>
        <hr>
        <form action="http://localhost:8080/jopustema/giocabb21" 
              method="GET">
            Inserisci il tuo tentativo 
            <input type="text" name="huten21">
            <br>
            <select name="bbesito21">
                <option value="TG">Troppo Grande</option>
                <option value="TP">Troppo Piccolo</option>
            </select>
            <input type="submit" value="AVANTI">
        </form>
        <hr>
    </body>
</html>
