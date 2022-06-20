<%-- 
    Document   : newCurse
    Created on : 14 jun 2022, 20:41:10
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
        <link rel="stylesheet" href="css/styleBuyWindow.css">
        <title>Rocktor Academy</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <section class="principal-section" style="padding-top: 5vh;">
            <article class="order-article">
                <form method="POST" class="form-signUp" enctype="multipart/form-data">
                    <label class="input-form" style="background-color: transparent; padding: 0;">Imagen del curso</label>
                    <input type="file" class="input-form" accept="image/*">
                    <input type="text" class="input-form" placeholder="Título del curso">
                    <div style="width: 90%;display: flex;justify-content:flex-start ; align-items: center;">
                        <label class="input-form" style="background-color: transparent; padding: 0;">Precio</label>
                        <input type="number" step=0.01 value=0.00 min=0.00 class="input-form">
                    </div>
                    <textarea name="message" cols="80" rows="8" class="input-form" placeholder="Escribe aquí la descripción del curso"></textarea><br/>

                    <label class="input-form" style="background-color: transparent; padding: 0;">Video inicial</label>
                    <input type="file"class="input-form" accept="video/*">
                    <input type="text" class="input-form" placeholder="Nombre del curso"><br/>

                    <label class="input-form" style="background-color: transparent; padding: 0;">Contenido del curso (Máximo 3 ficheros)</label>
                    <input type="file" class="input-form" accept="*">
                    <input type="file" class="input-form" accept="*">
                    <input type="file" class="input-form" accept="*"><br/>
                    <input type="submit" name="" value="Crear" class="input-form">
                </form>
            </article>
        </section>

        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>
