<%-- 
    Document   : manageUsers
    Created on : 11 jun 2022, 3:19:54
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
        <link rel="stylesheet" href="../css/styleAdminUser.css">
        <title>Rocktor Academy</title>
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <section class="principal-section">
            <div class="create-new-curse">
                <form action="../createUser" method="POST" class="form-create-new-curse">
                    <h2>Crear un nuevo usuario</h2>
                    <input type="submit" name="submitCreateUser" value="+"/>
                </form>
            </div> <br/>
            <table class="manage-table" border="1">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Email</th>
                        <th>Usuario</th>
                        <th>Contraseña</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Rol</th>
                        <th>Gestión</th>
                    </tr>
                </thead>
                <tbody>
                <td class="responsive-td">Aux</td>
                <c:forEach items="${users}" var="u">

                    <tr class="content-tr">
                        <td>${u.name}</td>
                        <td>${u.surnames}</td>
                        <td>${u.email}</td>
                        <td>${u.user}</td>
                        <td>${u.pass}</td>
                        <td>${u.birthday}</td>
                        <td>${u.role}</td>
                        <c:choose>
                            <c:when test="${actualUser.user == u.user}">
                                <td class="manage-td">
                                    <form action="../createUser" method="POST" class="">
                                        <input type="hidden" value="${u.user}" name="userName"/>
                                        <button type="submit" name="submitUpdateUser" class="button-submit-td">
                                            <img src="../img/user.webp" alt="Modificar" class="img-form"/>
                                        </button>
                                    </form>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td class="manage-td">
                                    <form action="../createUser" method="POST">
                                        <input type="hidden" value="${u.user}" name="userName"/>
                                        <button type="submit" name="submitUpdateUser" class="button-submit-td">
                                            <img src="../img/manage.webp" alt="Modificar" class="img-form"/>
                                        </button>
                                    </form>
                                    <form action="../adminUser" method="POST">
                                        <input type="hidden" value="${u.user}" name="userName"/>
                                        <button type="submit" name="submitDelete" class="button-submit-td">
                                            <img src="../img/delete.webp" alt="Eliminar" class="img-form"/>
                                        </button>
                                    </form>
                                </td>
                            </c:otherwise>
                        </c:choose>
                        <td class="responsive-td">Aux</td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </section>

        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>
