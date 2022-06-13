<%-- 
    Document   : responsiveMenu
    Created on : 29-may-2022, 5:31:04
    Author     : alber
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="checkbox" id="btn-menu-responsive">
<div class="modal-menu-responsive">
    <c:choose>
        <c:when test="${actualUser != null}">
            <div class="menu-responsive" style="height: 10vh;">
            </c:when>
            <c:otherwise>
                <div class="menu-responsive">
                </c:otherwise>
            </c:choose>

            <nav class="nav-menu-responsive">
                <ul>
                    <c:if test="${actualUser != null}">
                        <li class="nav-menu-item">
                            <form action="closeSession" class="form-close-session-responsive">
                                <button type="submit" name="closeSession" class="close-session-button">
                                    <h3>Cerrar Sesión</h3>
                                </button>
                            </form>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <label for="btn-menu-responsive" class="invisible-label-close-modal"></label>
