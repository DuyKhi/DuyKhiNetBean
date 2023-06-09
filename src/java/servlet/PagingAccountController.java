/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package servlet;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author DELL
 */
@WebServlet(name="PagingAccountController", urlPatterns={"/pagingaccount"})
public class PagingAccountController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String indexPage = (request.getParameter("index"));
       
       if(indexPage == null){
           indexPage = "1";
       }
       int index = Integer.parseInt(indexPage);
        AccountDAO acc = new AccountDAO();
        int getTotalAccount = acc.getTotalAccount();
        int endPage = getTotalAccount / 5;
        if(getTotalAccount % 5 != 0){
            endPage ++;
        }
        
        ArrayList<Account> list = acc.pagingAccount(index);
        request.setAttribute("lista",list);
        request.setAttribute("endPage", endPage);
        request.getRequestDispatcher("adminviewacc.jsp").forward(request, response);
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
