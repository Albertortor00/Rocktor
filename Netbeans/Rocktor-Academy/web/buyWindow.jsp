<%-- 
    Document   : buyWindow
    Created on : 13 jun 2022, 14:43:15
    Author     : albertortor00
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

        <c:choose>
            <c:when test="${merchandisingId != null}">
                <section class="principal-section" style="padding-top: 5vh;">
                </c:when>
                <c:otherwise>
                    <section class="principal-section">
                    </c:otherwise>
                </c:choose>

                <article class="order-article">
                    <div class="imgs-buy-window">
                        <img src="img/visa.webp" class="img-buy" alt="alt"/>
                        <img src="img/mastercard.webp" class="img-buy" alt="alt"/>
                    </div>
                    <form class="form-buy-products" method="POST" action="buyWindow">
                        <div>
                            <img src="img/user.webp" class="img-buy-form" alt="tarjeta de crédito"/>
                            <input type="text" name="completeName" placeholder="Nombre completo"class="input-form"/>
                        </div>
                        <div>
                            <img src="img/creditTarget.webp" class="img-buy-form" alt="tarjeta de crédito"/>
                            <input type="text" name="targetNum" placeholder="Número de tarjeta"class="input-form"/>
                        </div>
                        <div>
                            <img src="img/cvv.webp" class="img-buy-form" alt="cvv"/>
                            <input type="text" name="targetCVV" placeholder="CVV"class="input-form"/>
                        </div>
                        <div>
                            <img src="img/expirated.webp" class="img-buy-form" alt="cvv"/>
                            <input type="text" min="2022-06-23" name="expiration" placeholder="Fecha de caducidad" onfocus="(this.type = 'date')"
                                   class="input-form">
                        </div>
                        <c:if test="${merchandisingId != null}">
                            </br>
                            <div>
                                <img src="img/address.webp" class="img-buy-form" alt="cvv"/>
                                <input type="text" name="address" class="input-form" placeholder="Dirección de envío">
                            </div>
                            <div>
                                <img src="img/postalCode.webp" class="img-buy-form" alt="cvv"/>
                                <input type="text" name="postalCode" class="input-form" placeholder="Código postal">
                            </div>
                        </c:if>

                        <p style="color: #C41414; text-align: center;" class="error-message">${errorMessage}</p>
                        <div class="form-buttons">
                            <input type="submit" name="submitCancel" value="Cancelar" class="cancel-button">
                            <input type="submit" name="submitOrder" value="Adquirir" class="order-button">
                        </div>
                    </form>
                </article>
            </section>

            <jsp:include page="responsiveMenuWN.jsp"/>
    </body>
</html>