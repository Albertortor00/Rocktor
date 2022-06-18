<%-- 
    Document   : header
    Created on : 11 jun 2022, 3:02:05
    Author     : albertortor00
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="header-container">
        <a href="index.jsp">
            <img src="../img/logo.webp" class="logo" alt="Icono Rocktor">
        </a>
        <div class="right-container">

            <div class="buttons">

                <form action="../closeSession">
                    <button type="submit" name="closeSession" class="close-session-button">
                        <img src="../img/closeSession.webp" class="img-close-session" alt="cerrarSesion"/>
                    </button>
                </form>

                <label for="btn-menu-responsive">
                    <img src="../img/menu.png" alt="Menú" class="btn-menu">
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
                <h3><a href="../adminMessage">Mensajes <small class="message-number">${messagesNum}</small></a></h3>
            </li>
            <li class="nav-menu-item">
                <h3><a href="../adminUser">Gestionar usuarios</a></h3>
            </li>
            <li class="nav-menu-item">
                <h3><a href="../adminCurse">Gestionar cursos</a></h3>
            </li>
            <li class="nav-menu-item">
                <h3><a href="../adminMerchandising">Gestionar merchandising</a></h3>
            </li>
        </ul>
    </nav>
</header>

