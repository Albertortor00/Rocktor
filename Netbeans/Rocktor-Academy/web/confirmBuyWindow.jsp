<%-- 
    Document   : confirmBuyWindow
    Created on : 13 jun 2022, 19:58:51
    Author     : albertortor00
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/styleBuyWindow.css">
        <title>Rocktor Academy</title>
    </head>
    <body>
        <jsp:include page="headerWN.jsp"/>

        <section class="principal-section">
            <article class="order-article">
                <div class="imgs-buy-window">
                    <img src="img/visa.webp" class="img-buy" alt="alt"/>
                    <img src="img/mastercard.webp" class="img-buy" alt="alt"/>
                </div>
                <form class="form-buy-products" method="POST" action="buyWindow">
                    <div>
                        <img src="img/confirm.webp" class="img-buy" alt="confirmación"/>
                        <h3 style="text-align: center;">${message}</h3>
                    </div>
                    <div class="form-buttons">
                        <input type="submit" name="submitConfirmOrder" value="Aceptar" class="order-button">
                    </div>
                </form>
            </article>
        </section>

        <jsp:include page="responsiveMenuWN.jsp"/>
    </body>
</html>
