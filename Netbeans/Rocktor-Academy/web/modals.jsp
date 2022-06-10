<%-- 
    Document   : modals
    Created on : 29-may-2022, 5:21:35
    Author     : alber
--%>


<!---------------------------- Estructura de Modal SignUp ---------------------------->
<input type="checkbox" id="btn-modal-signUp">
<div class="modal-signUp-container">
    <div class="modal-signUp">
        <div class="btn-close">
            <label for="btn-modal-signUp">
                <img src="img/close-modal.png" alt="cerrar" class="img-close-modal">
            </label>
        </div>
        <h2 class="modal-form-title">¡Unete a nosotros!</h2>
        <hr class="personal-hr" />
        <br />
        <form method="POST" action="signUp" class="form-signUp">
            <input type="text" name="name" placeholder="Nombre" class="input-form">
            <input type="text" name="surnames" placeholder="Apellidos" class="input-form">
            <input type="email" name="email" placeholder="email@email.com" class="input-form">
            <input type="text" name="birthday" placeholder="Fecha de nacimiento" onfocus="(this.type = 'date')"
                   class="input-form">
            <!-- <hr class="personal-hr"/><br /> -->
            <input type="text" name="userName" placeholder="Nombre de usuario" class="input-form">
            <input type="password" name="pass" placeholder="Contraseña" class="input-form">
            <input type="password" name="confirmPass" placeholder="Repita la contraseña"
                   class="input-form"><br />
            <input type="submit" value="Sign Up" class="input-form">
        </form>
    </div>
    <label for="btn-modal-signUp" class="invisible-label-close-modal"></label>
</div>
<!------------------------------------------------------------------------------------>

<!---------------------------- Estructura de Modal SignIn ---------------------------->
<input type="checkbox" id="btn-modal-signIn">
<div class="modal-signIn-container">
    <div class="modal-signIn">
        <div class="btn-close">
            <label for="btn-modal-signIn">
                <img src="img/close-modal.png" alt="cerrar" class="img-close-modal">
            </label>
        </div>
        <h2 class="modal-form-title">Inicia sesión</h2>
        <hr class="personal-hr" />
        <br />
        <form method="POST" action="signIn" class="form-signIn">
            <input type="text" name="userName" placeholder="Nombre de usuario" class="input-form">
            <input type="password" name="pass" placeholder="Contraseña" class="input-form">
            <p style="color: #C41414;" class="error-message">${errorMessage}</p>
            <input type="submit" name="submitSignIn" value="Sign In" class="input-form">
        </form>
    </div>
    <label for="btn-modal-signIn" class="invisible-label-close-modal"></label>
</div>
<!------------------------------------------------------------------------------------>

