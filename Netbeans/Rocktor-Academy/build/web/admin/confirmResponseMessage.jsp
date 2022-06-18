<%-- 
    Document   : confirmResponseMessage
    Created on : 18 jun 2022, 18:48:10
    Author     : albertortor00
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <article class="first-container-admin">
                <form class="form-send-mail" method="POST" action="../adminMessage">
                    <div style="display: flex; justify-content: center; align-items: center; gap:20px;">
                        <img src="../img/confirm.webp" class="img-confirm" alt="confirmación"/>
                        <h3 style="text-align: center;">Mensaje enviado correctamente!</h3>
                    </div>
                    <div class="submit-btn-container">
                        <input type="submit" name="submitConfirmMessage" value="Aceptar" class="send-mail-button">
                    </div>
                </form>
            </article>
        </section>

        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>
