/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CurseOrder;
import model.DAO.DAOCurse;
import model.DAO.DAOMerchandising;
import model.MerchandisingOrder;
import model.User;

/**
 *
 * @author albertortor00
 */
@WebServlet(name = "buyWindow", urlPatterns = {"/buyWindow"})
public class buyWindow extends HttpServlet {

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

            String errorMessage = "";
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            User actualUser = (User) request.getSession().getAttribute("actualUser");

            if (request.getParameter("submit") != null) {

                if (request.getParameter("curseId") != null) {
                    int curseId = Integer.parseInt(request.getParameter("curseId"));
                    request.getSession().setAttribute("curseId", curseId);
                    request.getSession().setAttribute("merchandisingId", null);
                    response.sendRedirect("buyWindow.jsp");
                }
                if (request.getParameter("merchandisingId") != null) {
                    String merchandisingId = request.getParameter("merchandisingId");
                    request.getSession().setAttribute("merchandisingId", merchandisingId);
                    request.getSession().setAttribute("curseId", null);
                    response.sendRedirect("buyWindow.jsp");
                }

            }

            if (request.getParameter("submitCancel") != null) {
                request.getSession().setAttribute("curseId", null);
                request.getSession().setAttribute("merchandisingId", null);
                response.sendRedirect("index.jsp");
            }

            if (request.getParameter("submitOrder") != null) {
                if (request.getSession().getAttribute("curseId") != null) {
                    if (!request.getParameter("completeName").equals("")
                            && !request.getParameter("targetNum").equals("")
                            && !request.getParameter("targetCVV").equals("")
                            && !request.getParameter("expiration").equals("")) {

                        CurseOrder co = new CurseOrder((int) request.getSession().getAttribute("curseId"),
                                actualUser.getUser(),
                                dtf.format(LocalDateTime.now()));

                        if (new DAOCurse().order(co)) {
                            errorMessage = "Has adquirido el curso satisfactoriamente!</br>"
                                    + "Puedes visualizarlo en tus cursos.</br>"
                                    + "Muchas gracias por confiar en Rocktor!";
                            request.setAttribute("message", errorMessage);
                            request.getSession().setAttribute("curseId", null);
                            getServletContext().getRequestDispatcher("/confirmBuyWindow.jsp").forward(request, response);

                        } else {
                            errorMessage = "Ha ocurrido un error al adquirir el curso";
                            request.setAttribute("errorMessage", errorMessage);
                            getServletContext().getRequestDispatcher("/orderWindow.jsp").forward(request, response);
                        }

                    } else {
                        errorMessage = "Todos los campos son obligatorios";
                        request.setAttribute("errorMessage", errorMessage);
                        getServletContext().getRequestDispatcher("/orderWindow.jsp").forward(request, response);
                    }
                } else {
                    if (request.getSession().getAttribute("merchandisingId") != null) {
                        if (!request.getParameter("completeName").equals("")
                                && !request.getParameter("targetNum").equals("")
                                && !request.getParameter("targetCVV").equals("")
                                && !request.getParameter("expiration").equals("")) {

                            MerchandisingOrder mo = new MerchandisingOrder(actualUser.getUser(),
                                    (String) request.getSession().getAttribute("merchandisingId"),
                                    dtf.format(LocalDateTime.now()));

                            if (new DAOMerchandising().order(mo)) {
                                errorMessage = "Has adquirido el producto de merchandising satisfactoriamente!</br>"
                                        + "Recibirás el producto en las próximas 24/48 horas.</br>"
                                        + "Muchas gracias por confiar en Rocktor!";
                                request.setAttribute("message", errorMessage);
                                request.getSession().setAttribute("merchandisingId", null);
                                getServletContext().getRequestDispatcher("/confirmBuyWindow.jsp").forward(request, response);

                            } else {
                                errorMessage = "Ha ocurrido un error al adquirir el producto de merchandising";
                                request.setAttribute("errorMessage", errorMessage);
                                getServletContext().getRequestDispatcher("/buyWindow.jsp").forward(request, response);
                            }

                        } else {
                            errorMessage = "Todos los campos son obligatorios";
                            request.setAttribute("errorMessage", errorMessage);
                            getServletContext().getRequestDispatcher("/buyWindow.jsp").forward(request, response);
                        }
                    }

                }
            }

            if (request.getParameter("submitConfirmOrder") != null) {
                response.sendRedirect("curses.jsp");
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
