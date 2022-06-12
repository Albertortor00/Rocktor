<%-- 
    Document   : cursos
    Created on : 29-may-2022, 5:51:20
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
        <link rel="stylesheet" href="css/styleCurses.css">
        <title>Rocktor Academy</title>
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <section class="curses">
            <c:forEach items="${curses}" var="cur">
                <article class="curse">
                    <div class="first-container">
                        <h2>${cur.title}</h2>
                        <img src="${cur.image}" alt="${cur.title}" class="img-curse">
                    </div>
                    <div class="second-container">
                        <p class="curse-description">${cur.description}</p>
                        <br />
                        <h3>Duración estimada: ${cur.duration} Horas</h3>
                        <small>Autor: ${cur.author}</small>
                        <h3 class="price-task">${cur.price}€</h3>
                        <button class="btn-buy">Adquirir</button>
                        <button class="btn-buy-responsive">+</button>
                    </div>
                </article>
            </c:forEach>
        </section>

        <jsp:include page="modals.jsp"/>
        <jsp:include page="responsiveMenu.jsp"/>

    </body>
</html>