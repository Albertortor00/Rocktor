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
                        <c:choose>
                            <c:when test="${actualUser != null}">
                                <form action="buyWindow" method="post">
                                    <input type="hidden" name="curseId" value="${cur.id}"/>
                                    <button type="submit" name="submit" class="btn-buy">Adquirir</button>
                                    <button type="submit" name="submit" class="btn-buy-responsive">+</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <label for="btn-modal-signIn">
                                    <div class="btn-buy">Adquirir</div>
                                </label>
                                <label for="btn-modal-signIn">
                                    <div class="btn-buy-responsive">+</div>
                                </label>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </article>
            </c:forEach>
        </section>

        <jsp:include page="modals.jsp"/>
        <jsp:include page="responsiveMenu.jsp"/>

    </body>
</html>