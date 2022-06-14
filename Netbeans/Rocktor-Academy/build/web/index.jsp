<%-- 
    Document   : index
    Created on : 29-may-2022, 4:47:13
    Author     : alber
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
            <video class="index-video" autoplay muted loop>
                <source src="video/indexVideo.mp4" type="video/mp4">
                <source src="video/indexVideo.ogv" type="video/ogg">
                Tu navegador no es compatible con videos HTML5
            </video>
        </section>

        <jsp:include page="modals.jsp"/>
        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>
