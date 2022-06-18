<%-- 
    Document   : manageMerchandising
    Created on : 11 jun 2022, 3:23:30
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
        <link rel="stylesheet" href="../css/styleAdminMerchandising.css">
        <title>Rocktor Academy</title>
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <section class="principal-section">
            <div class="create-new-curse">
                <form method="POST" class="form-create-new-curse">
                    <h2>Crear un nuevo producto</h2>
                    <input type="submit" name="submitNewCurse" value="+"/>
                </form>
            </div> <br/>
            <table class="manage-table" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Gestión</th>
                    </tr>
                </thead>
                <tbody>
                <td class="responsive-td">Aux</td>
                <c:forEach items="${merchandisings}" var="m">

                    <tr class="content-tr">
                        <td>${m.id}</td>
                        <td>${m.name}</td>
                        <td>${m.price}€</td>
                        <td class="manage-td">
                            <form action="../adminMerchandising" method="POST">
                                <input type="hidden" value="${m.id}" name="merchandisingId"/>
                                <button type="submit" name="submitDelete" class="button-submit-td">
                                    <img src="../img/delete.webp" alt="Eliminar" class="img-form"/>
                                </button>
                            </form>
                            <form action="../adminMerchandising" method="POST">
                                <input type="hidden" value="${m.id}" name="merchandisingId"/>
                                <button type="submit" name="submitManage" class="button-submit-td">
                                    <img src="../img/manage.webp" alt="Gestionar" class="img-form"/>
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