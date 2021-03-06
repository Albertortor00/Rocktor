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
import model.DAO.DAOUser;
import model.User;

/**
 *
 * @author albertortor00
 */
@WebServlet(name = "manageUser", urlPatterns = {"/manageUser"})
public class manageUser extends HttpServlet {

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

            String errorMessage, successMessage;

            if (request.getParameter("submitUpdateProfile") != null) {
                if (!request.getParameter("name").equals("")
                        && !request.getParameter("surnames").equals("")
                        && !request.getParameter("email").equals("")
                        && !request.getParameter("birthday").equals("")
                        && !request.getParameter("userName").equals("")
                        && !request.getParameter("pass").equals("")
                        && !request.getParameter("confirmPass").equals("")
                        && !request.getParameter("role").equals("")) {

                    String name = request.getParameter("name"),
                            surnames = request.getParameter("surnames"),
                            email = request.getParameter("email"),
                            birthday = request.getParameter("birthday"),
                            userName = request.getParameter("userName"),
                            password = request.getParameter("pass"),
                            confirmPass = request.getParameter("confirmPass"),
                            role = request.getParameter("role");

                    if (password.equals(confirmPass)) {
                        User usuario = new User(name, surnames, email, userName, password, birthday, role);

                        if (new DAOUser().update(usuario)) {
                            successMessage = "Usuario actualizado correctamente!";
                            request.setAttribute("successMessage", successMessage);
                            request.getSession().setAttribute("actualUser", usuario);
                            getServletContext().getRequestDispatcher("/manageProfile.jsp").forward(request, response);
                        } else {
                            errorMessage = "Hemos tenido un problema al actualizar los datos de tu usuario";
                            request.setAttribute("errorMessage", errorMessage);
                            getServletContext().getRequestDispatcher("/manageProfile.jsp").forward(request, response);
                        }

                    } else {
                        errorMessage = "Las contrase??as introducidas no coinciden";
                        request.setAttribute("errorMessage", errorMessage);
                        getServletContext().getRequestDispatcher("/manageProfile.jsp").forward(request, response);
                    }

                } else {
                    errorMessage = "Debe rellenar todos los campos, son obligatorios";
                    request.setAttribute("errorMessage", errorMessage);
                    getServletContext().getRequestDispatcher("/manageProfile.jsp").forward(request, response);
                }

            } else {
                errorMessage = "";
                successMessage = "";
                request.setAttribute("errorMessage", errorMessage);
                request.setAttribute("successMessage", successMessage);
                getServletContext().getRequestDispatcher("/manageProfile.jsp").forward(request, response);
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
