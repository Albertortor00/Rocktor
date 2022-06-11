<%-- 
    Document   : manageUser
    Created on : 11 jun 2022, 1:59:40
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
        <link rel="stylesheet" href="css/styleIndex.css">
        <title>Rocktor Academy</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <section class="principal-section">
            <!-- Imagen desechada por mi parte, ya que no me agradaba la estética 
                <img src="img/wallpapers/img-1.webp" alt="Background"> -->
        </section>

        <jsp:include page="modals.jsp"/>
        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>