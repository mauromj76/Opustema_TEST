
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Beep Blue</title>
    </head>
    <body>
        <h1>Gioca a Beep Blue!</h1>
        <hr>
        <h2>${esitoHu}</h2>
        <hr>
        <h2>Il mio tentativo è ${tentativoBB}</h2>
        <a href="http://localhost:8080/jopustema/vintoBB00">
            <button type="button">Hai vinto!</button>
        </a>
        <hr>
        <form action="http://localhost:8080/jopustema/play00" 
              method="GET">
            Inserisci il tuo tentativo 
            <input type="text" name="huten">
            <br>
            <select name="bbesito">
                <option value="TG">Troppo Grande</option>
                <option value="TP">Troppo Piccolo</option>
            </select>
            <input type="submit">
        </form>
        <hr>
    </body>
</html>
