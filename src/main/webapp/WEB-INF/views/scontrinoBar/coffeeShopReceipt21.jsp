<%-- 
    Document   : coffeeShopReceipt21
    Created on : Oct 22, 2018, 6:18:34 PM
    Author     : Mauro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanks for coming to our coffee shop!</title>
    </head>
    <body>
        <fieldset>
            <legend>Your Receipt</legend>
            <h1>Price item n°1=${value01} --- Description: ${descr01}</h1>
            <h1>Price item n°2=${value02} --- Description: ${descr02}</h1>
            <h1>Price item n°3=${value03} --- Description: ${descr03}</h1>
            <h1>Total price: ${total}</h1>
            <!-- decided to use the go-back-one-page method -->
            <input type="button" onclick="history.go(-1);" value="Back">
        </fieldset>

    </body>
</html>
