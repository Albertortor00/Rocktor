<%-- 
    Document   : responsiveMenu
    Created on : 29-may-2022, 5:31:04
    Author     : alber
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="checkbox" id="btn-menu-responsive">
<div class="modal-menu-responsive">

    <div class="menu-responsive" style="height: 40vh;">
        <nav class="nav-menu-responsive">
            <ul>
                <li class="nav-menu-item">
                    <h3><a href="manageUsers.jsp">Gestionar usuarios</a></h3>
                </li>
                <li class="nav-menu-item">
                    <h3><a href="manageCurses.jsp">Gestionar cursos</a></h3>
                </li>
                <li class="nav-menu-item">
                    <h3><a href="manageMerchandising.jsp">Gestionar merchandising</a></h3>
                </li>
                <li class="nav-menu-item">
                    <form action="../closeSession" class="form-close-session-responsive">
                        <button type="submit" name="closeSession" class="close-session-button">
                            <h3>Cerrar Sesión</h3>
                        </button>
                    </form>
                </li>
            </ul>
        </nav>
    </div>
    <label for="btn-menu-responsive" class="invisible-label-close-modal"></label>
