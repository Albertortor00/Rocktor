<%-- 
    Document   : manageCurses
    Created on : 11 jun 2022, 3:21:47
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
        <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="../css/styleAdminCurse.css">
        <title>Rocktor Academy</title>
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <section class="principal-section">
            <div class="create-new-curse">
                <form method="POST" class="form-create-new-curse">
                    <h2>Crear un nuevo curso</h2>
                    <input type="submit" name="submitNewCurse" value="+"/>
                </form>
            </div> <br/>
            <table class="manage-table" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Duración</th>
                        <th>Precio</th>
                        <th>Gestión</th>
                    </tr>
                </thead>
                <tbody>
                <td class="responsive-td">Aux</td>
                <c:forEach items="${curses}" var="c">

                    <tr class="content-tr">
                        <td>${c.id}</td>
                        <td>${c.title}</td>
                        <td>${c.author}</td>
                        <td>${c.duration} horas</td>
                        <td>${c.price}€</td>
                        <td class="manage-td">
                            <form action="../adminCurse" method="POST">
                                <input type="hidden" value="${c.id}" name="curseId"/>
                                <button type="submit" name="submitDelete" class="button-submit-td">
                                    <img src="../img/delete.webp" alt="Eliminar" class="img-form"/>
                                </button>
                            </form>
                        </td>
                        <td class="responsive-td">Aux</td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </section>

        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>
