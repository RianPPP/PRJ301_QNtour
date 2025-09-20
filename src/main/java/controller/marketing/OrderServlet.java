package controller.marketing;

import dao.OrderDAO;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Nhận các tham số tìm kiếm từ request
        String status = request.getParameter("status") != null ? request.getParameter("status") : "";
        String fromDate = request.getParameter("from") != null ? request.getParameter("from") : "2000-01-01";
        String toDate = request.getParameter("to") != null ? request.getParameter("to") : "2099-12-31";
        int userId = Integer.parseInt(request.getParameter("userId"));
        int pageIndex = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        // Khởi tạo DAO để truy cập dữ liệu đơn hàng
        OrderDAO orderDAO = new OrderDAO();

        // Lấy danh sách đơn hàng dựa trên tiêu chí tìm kiếm
        ArrayList<Order> orders = orderDAO.getOrderByUser(status, fromDate, toDate, userId, pageIndex);

        // Đếm tổng số đơn hàng để phân trang
        int totalOrders = orderDAO.getTotalNumber(status, fromDate, toDate, userId);
        int totalPages = (int) Math.ceil(totalOrders / 4.0); // Giả sử 4 đơn hàng mỗi trang

        // Gửi dữ liệu đến trang JSP
        request.setAttribute("orders", orders);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", pageIndex);
        request.setAttribute("status", status);
        request.setAttribute("fromDate", fromDate);
        request.setAttribute("toDate", toDate);

        // Forward đến trang JSP để hiển thị kết quả
        request.getRequestDispatcher("orderList.jsp").forward(request, response);
    }
}
