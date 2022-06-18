<%-- 
    Document   : responseMessage
    Created on : 18 jun 2022, 18:08:25
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
            <div class="first-container-admin">
                <form action="../adminMessage" method="POST" class="form-send-mail">
                    <h3>Introduzca el mensaje de respuesta</h3>
                    <input required type="text" style="min-width: 60vw;" name="subject" placeholder="Asunto" class="input-form"/>
                    <textarea required name="message" style="min-width: 60vw;" rows="10" class="input-form" placeholder="Escribe aquí tu comentario..."></textarea>
                    <div class="submit-btn-container">
                        <input type="submit" name="submitSendEmail" value="Enviar respuesta" class="send-mail-button">
                    </div>
                </form>
            </div>
        </section>

        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>
