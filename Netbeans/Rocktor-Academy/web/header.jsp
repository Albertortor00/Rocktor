<%-- 
    Document   : header
    Created on : 29-may-2022, 5:20:23
    Author     : alber
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="header-container">
        <a href="index.jsp">
            <img src="img/logo.webp" class="logo" alt="Icono Rocktor">
        </a>
        <div class="right-container">

            <div class="buttons">
                <c:choose>
                    <c:when test="${actualUser == null}">
                        <label for="btn-modal-signIn">
                            <div class="btn-signIn">
                                Sign In
                            </div>
                        </label>
                        <label for="btn-modal-signUp">
                            <div class="btn-signUp">
                                Sign Up
                            </div>
                        </label>
                    </c:when>
                    <c:otherwise>
                        <form action="closeSession">
                            <button type="submit" name="closeSession" class="close-session-button">
                                <img src="img/closeSession.webp" class="img-close-session" alt="cerrarSesion"/>
                            </button>
                        </form>
                    </c:otherwise>
                </c:choose>
                <label for="btn-menu-responsive">
                    <img src="img/menu.png" alt="Menú" class="btn-menu">
                </label>
            </div>

            <!-- 
            <div class="search-container">
                <img src="../img/search.png" alt="buscar" class="search-img">
                <input type="search" name="searchInput" id="searchInput" placeholder="Search...">
            </div>
            -->
            
        </div>

    </div>
    <nav class="nav-menu">
        <ul>
            <li class="nav-menu-item">
                <h3><a href="curses.jsp">Cursos</a></h3>
            </li>
            <li class="nav-menu-item">
                <h3><a href="merchandising.jsp">Merchandising</a></h3>
            </li>
            <li class="nav-menu-item">
                <h3><a href="contact.jsp">Contacto</a></h3>
            </li>

            <c:if test="${actualUser != null}">
                <li class="nav-menu-item">
                    <h3><a href="manageProfile.jsp">Mi perfil</a></h3>
                </li>
                <li class="nav-menu-item">
                    <h3><a href="manageCurses.jsp">Mis cursos</a></h3>
                </li>
            </c:if>
        </ul>
    </nav>
</header>
