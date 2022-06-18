package model;

import java.util.Properties;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author albertortor00
 */
public class RocktorMail {
    public void setSendEmail(Email email) throws Exception {
        Properties p = new Properties();
        // Servidor smtp de correo
        p.setProperty("mail.smtp.host", "smtp.1and1.es");
        // Usar TLS
        p.setProperty("mail.smtp.starttls.enable", "true");
        // puerto del servidor smtp
        p.setProperty("mail.smtp.port", "25");
        // Usuario smtp
        p.setProperty("mail.smtp.user", email.getFrom());
        // Autenticación requerida
        p.setProperty("mail.smtp.auth", "true");
        // Obtenemos la sesión
        Session sesion = Session.getDefaultInstance(p);
        sesion.setDebug(false);
        // Creamos el mensaje
        MimeMessage mensaje = new MimeMessage(sesion);
        // Y establecemos sus propiedades

        mensaje.setFrom(new InternetAddress(email.getFrom()));
        mensaje.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email.getTo()));
        mensaje.setSubject(email.getSubject());
        mensaje.setText(email.getText());
        // Enviamos el mensaje
        Transport t = sesion.getTransport("smtp");
        // Para conectarnos usamos usuario y password
        t.connect(email.getFrom(), email.getPass());
        t.sendMessage(mensaje, mensaje.getAllRecipients());

    }
}
