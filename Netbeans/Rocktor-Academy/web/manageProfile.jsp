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
        <link rel="stylesheet" href="css/styleBuyWindow.css">
        <title>Rocktor Academy</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <section class="principal-section" style="padding-top: 10vh;">
            <article class="order-article">
                <form method="POST" action="manageUser" class="form-signUp">
                    <input type="text" name="name" value="${actualUser.name}" class="input-form"/>
                    <input type="text" name="surnames" value="${actualUser.surnames}" class="input-form"/>
                    <input type="email" name="email" value="${actualUser.email}" class="input-form"/>
                    <input type="text" name="birthday" value="${actualUser.birthday}" onfocus="(this.type = 'date')"
                           class="input-form"/>
                    <!-- <hr class="personal-hr"/><br /> -->
                    <input type="hidden" name="userName" value="${actualUser.user}"/>
                    <input type="text" value="${actualUser.user}" class="input-form disabled" disabled/></br>
                    <input type="password" name="pass" placeholder="Cambia tu contraseña" value="${actualUser.pass}" class="input-form"/>
                    <input type="password" name="confirmPass" value="${actualUser.pass}" placeholder="Repita la nueva contraseña"
                           class="input-form"/>
                    <input type="hidden" name="role" value="${actualUser.role}"/>
                    <input type="text" value="${actualUser.role}" class="input-form disabled" disabled/>
                    <br />
                    <p style="color: #C41414;" >${errorMessage}</p>
                    <p style="color: #5DC414;" >${successMessage}</p>
                    <input type="submit" name="submitUpdateProfile" value="Actualizar datos" class="input-form">
                </form>
            </article>
        </section>

        <jsp:include page="modals.jsp"/>
        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>