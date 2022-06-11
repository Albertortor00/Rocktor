/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ContactMessage;
import model.DAO.DAOContactMessage;

/**
 *
 * @author albertortor00
 */
@WebServlet(name = "contactMessage", urlPatterns = {"/contactMessage"})
public class contactMessage extends HttpServlet {

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

            String name, surnames, email, message, responseMessage = "";

            if (request.getParameter("submitMessage") != null) {
                if (!request.getParameter("name").equals("")
                        && !request.getParameter("surnames").equals("")
                        && !request.getParameter("email").equals("")
                        && !request.getParameter("message").equals("")) {

                    name = request.getParameter("name");
                    surnames = request.getParameter("surnames");
                    email = request.getParameter("email");
                    message = request.getParameter("message");

                    if (message.length() <= 250) {
                        ContactMessage m = new ContactMessage(name, surnames, email, message);
                        if (new DAOContactMessage().sendMessage(m)) {
                            responseMessage = "Hemos recibido tu petición correctamente!";
                            request.setAttribute("responseMessage", responseMessage);
                            getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
                        } else {
                            responseMessage = "Ha habido un error al enviar la petición";
                            request.setAttribute("responseMessage", responseMessage);
                            getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
                        }

                    } else {
                        responseMessage = "El mensaje no puede superar los 250 carácteres";
                        request.setAttribute("responseMessage", responseMessage);
                        getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
                    }
                } else {
                    responseMessage = "Todos los campos son obligatorios";
                    request.setAttribute("responseMessage", responseMessage);
                    getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
                }
            } else {
                responseMessage = "";
                request.setAttribute("responseMessage", responseMessage);
                getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
            }

        }
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
