<%-- 
    Document   : contactMessage
    Created on : 11 jun 2022, 17:11:54
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
        <link rel="stylesheet" href="../css/styleAdmin.css">
        <title>Rocktor Academy</title>
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <section class="principal-section">
            <table class="manage-table" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Email</th>
                        <th>Mensaje</th>
                        <th>Responder</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody style="max-width: 50%;">
                <td class="responsive-td">Aux</td>
                <c:forEach items="${messages}" var="me">
                    <tr>
                        <td>${me.id}</td>
                        <td>${me.name}</td>
                        <td>${me.surnames}</td>
                        <td>${me.email}</td>
                        <td style="color: #8394bd;">${me.message}</td>
                        <td>
                            <form action="../adminMessage" method="POST">
                                <input type="hidden" value="${me.id}" name="messageId"/>
                                <input type="hidden" value="${me.email}" name="messageEmail"/>
                                <button type="submit" name="submitResponse" class="button-submit-td">
                                    <img src="../img/email.webp" alt="Responder" class="img-form"/>
                                </button>
                            </form>
                        </td>
                        <td>
                            <form action="../adminMessage" method="POST">
                                <input type="hidden" value="${me.id}" name="messageId"/>
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
