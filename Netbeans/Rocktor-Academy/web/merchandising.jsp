<%-- 
    Document   : merchandising
    Created on : 29-may-2022, 5:51:14
    Author     : alber
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
        <link rel="stylesheet" href="css/styleMerchandising.css">
        <title>Rocktor Academy</title>
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <section class="merchandising">
            <c:forEach items="${merchandisings}" var="mer">
                <article class="product">
                    <img src="${mer.image}" class="img-product" alt="${mer.name}"/>
                    <h3>${mer.name}</h3>
                    <c:choose>
                        <c:when test="${actualUser != null}">
                            <form action="buyWindow" method="post" class="form-price-order-button">
                                <input type="hidden" name="merchandisingId" value="${mer.id}"/>
                                <h3 class="price-task">${mer.price}€</h3>
                                <button type="submit" name="submit" class="btn-buy">Adquirir</button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <h3 class="price-task">${mer.price}€</h3>
                            <label class="btnModal" for="btn-modal-signIn">
                                <div class="btn-buy-without-session">Adquirir</div>
                            </label>
                        </c:otherwise>
                    </c:choose>
                </article>
            </c:forEach>
        </section>

        <jsp:include page="modals.jsp"/>
        <jsp:include page="responsiveMenu.jsp"/>

    </body>
</html>
