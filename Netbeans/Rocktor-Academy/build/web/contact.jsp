<%-- 
    Document   : contacto
    Created on : 29-may-2022, 5:51:26
    Author     : alber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/styleContacto.css">
        <title>Rocktor Academy</title>
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <section>
            <article class="article-first-container">
                <div class="first-content">
                    <h1>¿Quienes somos?</h1><br />
                    <p>Rocktor es la web de formación online que necesitas. <span class="container-optional-content">Somos
                            una familia con amplias gamas de
                            conocimientos,
                            ya que englobamos todo tipo de contenidos tecnológicos, desde el desarrollo web, interconectando
                            con la
                            programación electrónica,
                            y sin olvidarnos del desarollo de software a medida que suministramos por nuestros
                            profesionales.<br />
                            Debemos tener en cuenta que aquí puedes conocer a todos los tutores de los cursos que adquieras,
                            tendrás contacto directo con cada uno de ellos, y sabes lo mejor?
                            <b>¡Que te responderán super rápido!</b><br /></span><br />
                        Por otra parte tendrás a tu disposición un agente para tu atención personalizada, a tiempo completo
                        para cualquier cosa que necesites.<br /><span class="container-optional-content">
                            Además tambien tendrás acceso a todos los cursos gratuitamente para previsualizar algunos
                            apartados de su contenido
                            <b>¡Confía en nosotros, no te defraudaremos!</b><br />
                        </span>
                        Te esperamos para poder ofrecerte las mejores posiblidades para inserción en el mundo laboral
                        gracias a los
                        conocimientos que puedes adquirir gracias a nosotros.
                    </p>
                </div>
            </article>
            <article class="article-second-container">
                <div class="second-content">
                    <div class="first-circle">
                        <img src="img/picture.webp" alt="Picture" class="img-first-circle">
                        <h2>Creatividad</h2>
                        <p>¡Aprenderás a desarrollar tu creatividad con los mejores profesionales, que se encargaran de que seas un auténtico <b>artista</b>!</p>
                    </div>
                    <div class="second-circle">
                        <img src="img/binaryCode.webp" alt="Code" class="img-second-circle">
                        <h2>Aprendizaje</h2>
                        <p>¡Obtén la capacidad <b>autodidacta</b> para aprender cualquier tecnología gracias a la enseñanza de nuestros profesionales!</p>
                    </div>
                    <div class="third-circle">
                        <img src="img/briefcase.webp" alt="BriefCase" class="img-thrid-circle">
                        <h2>Demanda laboral</h2>
                        <p>¡Desenvuelveté como un auténtico <b>profesional</b> en el entorno laboral, despues de adquirir tus conocimientos con Rocktor!</p>
                    </div>
                </div>
            </article>
            <article class="article-thrid-container">
                <div class="first-content">
                    <h1>¿Quieres contactar con nosotros?</h1><br />
                    <p>
                        Envíanos un mensaje por correo y nos pondremos en contacto en un periodo máximo de 48 horas! No dudes en consultarnos cualquier duda que te pueda surgir, además de comentar tu experiencia con nosotros, y proponermos opciones de mejora!
                    </p><br/>
                    <form class="form-contactUs">
                        <input type="text" name="name" placeholder="Nombre" class="input-form-contactUs">
                        <input type="text" name="surnames" placeholder="Apellidos" class="input-form-contactUs">
                        <input type="email" name="email" placeholder="email@email.com" class="input-form-contactUs">
                        <textarea name="comment" cols="80" rows="10" class="input-form-contactUs" placeholder="Escribe aquí tu comentario..."></textarea>
                        <input type="submit" value="Enviar" class="input-form-contactUs">
                    </form>
                </div>
            </article>
        </section>

        <jsp:include page="modals.jsp"/>
        <jsp:include page="responsiveMenu.jsp"/>

    </body>
</html>
