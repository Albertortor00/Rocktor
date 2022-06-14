<%-- 
    Document   : curse
    Created on : 14 jun 2022, 22:29:33
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
        <link rel="stylesheet" href="css/styleCurse.css">
        <title>Rocktor Academy</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <section class="principal-section">
            <article class="first-container">
                <video class="index-video" controls>
                    <source src="video/C${currentCurse.id}.mp4" type="video/mp4">
                    <source src="video/C${currentCurse.id}.ogv" type="video/ogg">
                    Tu navegador no es compatible con videos HTML5
                </video>
            </article>
<!--            <article class="first-container files-container">
                <h2 style="text-align: left;">Descargue los ficheros del curso</h2>
                
            </article>-->
        </section>

        <jsp:include page="modals.jsp"/>
        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>
