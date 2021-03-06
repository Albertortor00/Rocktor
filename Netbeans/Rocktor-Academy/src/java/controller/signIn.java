package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.DAOAdmin;
import model.DAO.DAOUser;
import model.User;

/**
 *
 * @author alber
 */
@WebServlet(name = "signIn", urlPatterns = {"/signIn"})
public class signIn extends HttpServlet {

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
            String errorMessage, user, password;
            User usuario = null;

            if (request.getParameter("submitSignIn") != null) {
                if (request.getParameter("userName") != null && request.getParameter("pass") != null) {

                    user = request.getParameter("userName");
                    password = request.getParameter("pass");

                    usuario = new DAOUser().search(user);

                    if (new DAOUser().signIn(user, password)) {
                        sesion.setAttribute("actualUser", usuario);

                        if (usuario.getRole().equals("Administrador")) {
                            int messagesNum = new DAOAdmin().getMessagesNum();
                            sesion.setAttribute("messagesNum", messagesNum);
                            response.sendRedirect("admin/index.jsp");
                        } else {
                            response.sendRedirect("index.jsp");
                        }

                    } else {
                        errorMessage = "El usuario o contrase??a es incorrecto";
                        request.setAttribute("errorMessage", errorMessage);
                        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                    }
                }

            } else {
                errorMessage = "";
                request.setAttribute("errorMessage", errorMessage);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
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
