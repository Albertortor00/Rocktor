<%-- 
    Document   : manageCurses
    Created on : 13 jun 2022, 1:59:40
    Author     : albertortor00
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
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
            <c:if test="${actualUser.role == 'Profesor'}">
                <div class="create-new-curse">
                    <form action="createCurse" method="POST" class="form-create-new-curse">
                        <h2>Crear un nuevo curso</h2>
                        <input type="submit" name="submitNewCurse" value="+"/>
                    </form>
                </div>
            </c:if>
            <c:choose>
                <c:when test="${myCurses.size() <= 0}">
                    <article class="curse">
                        <div class="first-container">
                            <h2>Todavía no se ha adquirido ningún curso</h2>
                        </div>
                    </article>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${myCurses}" var="cur">
                        <article class="curseAux">
                            <div class="first-container">
                                <h2>${cur.title}</h2>
                                <img src="${cur.image}" alt="${cur.title}" class="img-curse">
                            </div>
                            <div class="second-container">
                                <p class="curse-description">${cur.description}</p>
                                <br />
                                <h3>Duración estimada: ${cur.duration} Horas</h3>
                                <small>Autor: ${cur.author}</small>
                                <form action="curse" method="POST" class="form-access-curse">
                                    <input type="hidden" name="curseId" value="${cur.id}"/>
                                    <input type="submit" name="submit" value="Acceder" class="input-access-curse"/>
                                </form>
                            </div>
                        </article>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </section>

        <jsp:include page="modals.jsp"/>
        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>