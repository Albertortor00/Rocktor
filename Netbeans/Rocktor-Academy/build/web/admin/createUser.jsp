<%-- 
    Document   : createCurse
    Created on : 19 jun 2022, 23:09:04
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
            <div class="first-container-admin">
                <form method="POST" action="../createUser" class="form-create-new-user">
                    <input type="text" name="name" placeholder="Nombre" class="input-form"/>
                    <input type="text" name="surnames" placeholder="Apellidos" class="input-form"/>
                    <input type="email" name="email" placeholder="email@email.com" class="input-form"/>
                    <input type="text" name="birthday" placeholder="Fecha de nacimiento" onfocus="(this.type = 'date')"
                           class="input-form"/>
                    <input type="text" name="userName" placeholder="Nombre de usuario" class="input-form"/>
                    <input type="password" name="pass" placeholder="Contraseña" class="input-form"/>
                    <input type="password" name="confirmPass" placeholder="Repita la contraseña"
                           class="input-form"/>
                    <select name="role" class="input-form">
                        <option value="" selected disabled>Seleccione su rol</option>
                        <option value="Administrador">Administrador</option>
                        <option value="Alumno">Alumno</option>
                        <option value="Profesor">Profesor</option>
                    </select>
                    <br />
                    <c:if test="${errorEmptyInputs != null}">
                        <p style="color: #C41414;" >Debe rellenar todos los campos, son obligatorios</p>
                    </c:if>
                    <c:if test="${errorPass != null}">
                        <p style="color: #C41414;" >Las contraseñas introducidas no coinciden</p>
                    </c:if>
                    <c:if test="${errorSQLProblem != null}">
                        <p style="color: #C41414;" >Hemos tenido un problema al registrar el nuevo usuario</p>
                    </c:if>
                    <c:if test="${errorUserExist != null}">
                        <p style="color: #C41414;" >El nombre de usuario ya existe!</p>
                    </c:if>
                    <div>
                        <input type="submit" name="submitCreate" value="Añadir usuario" class="create-submit-button">
                    </div>
                </form>
            </div>
        </section>

        <jsp:include page="responsiveMenu.jsp"/>
    </body>
</html>