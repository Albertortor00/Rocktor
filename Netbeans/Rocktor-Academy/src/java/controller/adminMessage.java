/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.DAOAdmin;
import model.Email;
import model.Message;
import model.RocktorMail;
import model.User;

/**
 *
 * @author albertortor00
 */
@WebServlet(name = "adminMessage", urlPatterns = {"/adminMessage"})
public class adminMessage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            if (request.getParameter("submitResponse") != null) {
                int messageId = Integer.parseInt(request.getParameter("messageId"));
                String messageEmail = request.getParameter("messageEmail");
                request.getSession().setAttribute("messageId", messageId);
                request.getSession().setAttribute("messageEmail", messageEmail);
                response.sendRedirect("admin/responseMessage.jsp");

            } else if (request.getParameter("submitConfirmMessage") != null) {
                response.sendRedirect("admin/contactMessage.jsp");

            } else if (request.getParameter("submitSendEmail") != null) {
                User actualUser = (User) request.getSession().getAttribute("actualUser");
                Email email = new Email();
                email.setFrom("admin@rocktor.es");
                email.setSubject(request.getParameter("subject"));
                email.setTo((String) request.getSession().getAttribute("messageEmail"));
                email.setText(request.getParameter("message"));
                email.setPass("48TCQjwD.uNFQiU");
                RocktorMail rm = new RocktorMail();
                try {
                    // Enviamos el Mail
                    rm.setSendEmail(email);

                    // Borramos el mensaje y luego actualizamos la lista de mensajes, junto con el número
                    new DAOAdmin().deleteMessage((int) request.getSession().getAttribute("messageId"));
                    updateDatas(request.getSession());

                } catch (Exception e) {
                    throw new ServletException("Error al enviar Email", e);
                }

                response.sendRedirect("admin/confirmResponseMessage.jsp");

            } else if (request.getParameter("submitDelete") != null) {
                new DAOAdmin().deleteMessage(Integer.parseInt(request.getParameter("messageId")));

                updateDatas(request.getSession());
                
                response.sendRedirect("admin/contactMessage.jsp");

            } else {
                updateDatas(request.getSession());
                response.sendRedirect("admin/contactMessage.jsp");
            }

        }
    }

    private void updateDatas(HttpSession s) {
        List<Message> messages = new DAOAdmin().getMessages();
        s.setAttribute("messages", messages);

        int messagesNum = new DAOAdmin().getMessagesNum();
        s.setAttribute("messagesNum", messagesNum);
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
