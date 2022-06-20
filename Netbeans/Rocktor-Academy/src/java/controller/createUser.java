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
 * @author albertortor00
 */
@WebServlet(name = "createUser", urlPatterns = {"/createUser"})
public class createUser extends HttpServlet {

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

            String errorMessage;
            HttpSession sesion = request.getSession();

            if (request.getParameter("submitCreate") != null) {
                if (!request.getParameter("name").equals("")
                        && !request.getParameter("surnames").equals("")
                        && !request.getParameter("email").equals("")
                        && !request.getParameter("birthday").equals("")
                        && !request.getParameter("userName").equals("")
                        && !request.getParameter("pass").equals("")
                        && !request.getParameter("confirmPass").equals("")
                        && request.getParameter("role") != null) {

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

                        if (new DAOUser().exist(usuario.getUser())) {
                            emptyErrorMessages(sesion);
                            sesion.setAttribute("errorUserExist", "error");
                            response.sendRedirect("admin/createUser.jsp");
                        } else {
                            if (new DAOUser().signUp(usuario)) {
                                emptyErrorMessages(sesion);
                                response.sendRedirect("adminUser");
                            } else {
                                emptyErrorMessages(sesion);
                                sesion.setAttribute("errorSQLProblem", "error");
                                response.sendRedirect("admin/createUser.jsp");
                            }
                        }

                    } else {
                        emptyErrorMessages(sesion);
                        sesion.setAttribute("errorPass", "error");
                        response.sendRedirect("admin/createUser.jsp");
                    }

                } else {
                    emptyErrorMessages(sesion);
                    sesion.setAttribute("errorEmptyInputs", "error");
                    response.sendRedirect("admin/createUser.jsp");
                }
            }

            if (request.getParameter("submitCreateUser") != null) {
                emptyErrorMessages(sesion);
                response.sendRedirect("admin/createUser.jsp");
            }

            if (request.getParameter("submitUpdateUser") != null) {
                emptyErrorMessages(sesion);
                sesion.setAttribute("manageUser", new DAOUser().search(request.getParameter("userName")));
                response.sendRedirect("admin/updateUser.jsp");
            }

            if (request.getParameter("submitUpdate") != null) {
                if (!request.getParameter("name").equals("")
                        && !request.getParameter("surnames").equals("")
                        && !request.getParameter("email").equals("")
                        && !request.getParameter("birthday").equals("")
                        && !request.getParameter("userName").equals("")
                        && !request.getParameter("pass").equals("")
                        && !request.getParameter("confirmPass").equals("")
                        && request.getParameter("role") != null) {

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
                            emptyErrorMessages(sesion);
                            response.sendRedirect("adminUser");
                        } else {
                            emptyErrorMessages(sesion);
                            sesion.setAttribute("errorSQLProblem", "error");
                            response.sendRedirect("admin/updateUser.jsp");
                        }

                    } else {
                        emptyErrorMessages(sesion);
                        sesion.setAttribute("errorPass", "error");
                        response.sendRedirect("admin/updateUser.jsp");
                    }

                } else {
                    emptyErrorMessages(sesion);
                    sesion.setAttribute("errorEmptyInputs", "error");
                    response.sendRedirect("admin/updateUser.jsp");
                }
            }

        }
    }

    private void emptyErrorMessages(HttpSession sesion) {
        sesion.setAttribute("errorEmptyInputs", null);
        sesion.setAttribute("errorPass", null);
        sesion.setAttribute("errorSQLProblem", null);
        sesion.setAttribute("errorUserExist", null);
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
