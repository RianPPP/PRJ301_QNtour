
package controller.common;

import dao.OrderDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class CancelOrder extends HttpServlet {

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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) //xử lý các yêu cầu GET từ client (trình duyệt)
            throws ServletException, IOException {
        //Hủy đơn hàng bằng ID.
         new OrderDAO().cancelOrder(Integer.parseInt(request.getParameter("oid"))); //Lấy ID đơn hàng từ URL./Chuyển đổi chuỗi ID thành số nguyên.
        response.sendRedirect("MyOrder");
    }

}



