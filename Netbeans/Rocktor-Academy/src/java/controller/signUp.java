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
import javax.servlet.http.HttpSession;
import model.DAO.DAOUser;
import model.User;

/**
 *
 * @author alber
 */
@WebServlet(name = "signUp", urlPatterns = {"/signUp"})
public class signUp extends HttpServlet {

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
            HttpSession sesion = request.getSession();
            String errorMessage;

            if (request.getParameter("submitSignUp") != null) {
                String name = request.getParameter("name"),
                        surnames = request.getParameter("surnames"),
                        email = request.getParameter("email"),
                        birthday = request.getParameter("birthday"),
                        userName = request.getParameter("userName"),
                        password = request.getParameter("pass"),
                        confirmPass = request.getParameter("confirmPass");
                        
                User usuario = new User(name, surnames, email, userName, password);

                if (new DAOUser().signIn(userName, password)) {
                    sesion.setAttribute("actualUser", usuario);

                    if (usuario.isAdmin()) {
                        response.sendRedirect("admin.jsp");
                    } else {
                        response.sendRedirect("main.jsp");
                    }
                    return;

                } else {
                    errorMessage = "El usuario o contraseña es incorrecto";
                    request.setAttribute("errorMessage", errorMessage);
                    getServletContext().getRequestDispatcher("/modals.jsp").forward(request, response);
                }
            } else {
                errorMessage = "";
                request.setAttribute("errorMessage", errorMessage);
                getServletContext().getRequestDispatcher("main.jsp").forward(request, response);
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
