
package controller.common;

import dao.FeedbackDAO;
import dao.ProductDAO;
import dao.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;
import model.Feedback;
import model.Product;
import model.Setting;
import model.User;

/**
 *
 * @author Admin
 */
public class ProductDetail extends HttpServlet {

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
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("account");
	    
	    // Nếu là POST request, xử lý việc thêm phản hồi
	    if (request.getMethod().equalsIgnoreCase("POST")) {
	        if (user == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }
	        try {
	            // Lấy ID sản phẩm từ request và kiểm tra xem có tồn tại không
	        	String pidParam = request.getParameter("pid");
	        	if (pidParam == null || pidParam.isEmpty()) {
	        	    response.getWriter().println("ID sản phẩm không hợp lệ.");
	        	    return; // Ngừng xử lý nếu pid không hợp lệ
	        	}

	        	int pid = Integer.parseInt(pidParam);  // Nếu đã kiểm tra, parse sẽ an toàn

	            ProductDAO productDao = new ProductDAO();
	            Product product = productDao.getProductByID(pid);

	            if (product == null) {
	                response.getWriter().println("Sản phẩm không tồn tại.");
	                return;
	            }

	            // Lấy các thông tin phản hồi từ request
	            String content = request.getParameter("content");
	            String rate = request.getParameter("rate");
	            
	            String img = request.getParameter("img");
	            
	          

	            FeedbackDAO feedbackDAO = new FeedbackDAO();
	            feedbackDAO.insertFeedback(pid, user.getUser_id(), content, rate, img);
	            request.getSession().setAttribute("url", "ProductDetail?pid=" + pid);
	            response.sendRedirect("ProductDetail?pid=" + pid);
	            return;  // Dừng tại đây nếu là POST request để tránh chạy phần GET bên dưới
	        } catch (Exception e) {
	            response.getWriter().println("Lỗi khi thêm phản hồi: " + e.getMessage());
	            return;
	        }
	    }

	    // Phần xử lý GET request (hiển thị chi tiết sản phẩm)
	    try {
	        int pid = Integer.parseInt(request.getParameter("pid"));
	        ProductDAO productDao = new ProductDAO();
	        FeedbackDAO feedbackDAO = new FeedbackDAO();
	        SettingDAO settingDao = new SettingDAO();

	        Product product = productDao.getProductByID(pid);
	        ArrayList<Setting> categoryList = settingDao.getAllProCategory();
	        ArrayList<Setting> brandList = settingDao.getAllProBrand();
	        ArrayList<Product> fearturedProduct = productDao.getFearturedProduct();
	        ArrayList<Product> recommend1 = productDao.getRecommendPro(product.getCategory(), 0);
	        ArrayList<Product> recommend2 = productDao.getRecommendPro(product.getCategory(), 3);
	        ArrayList<Feedback> FeedbackList = feedbackDAO.getFeedbackBypid(pid);
	        String numberFb = feedbackDAO.getNumberFeedbackByProId(pid);

	        int quantityincart = 0;
	        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
	        if (cart != null && cart.containsKey(pid)) {
	            quantityincart = cart.get(pid).getQuantity();
	        }

	        request.setAttribute("product", product);
	        request.setAttribute("quantityincart", quantityincart);
	        request.setAttribute("prolist5", fearturedProduct);
	        request.setAttribute("recommend1", recommend1);
	        request.setAttribute("recommend2", recommend2);
	        request.setAttribute("cate", categoryList);
	        request.setAttribute("brand", brandList);
	        request.setAttribute("fblist", FeedbackList);
	        request.setAttribute("numberFb", numberFb);
	        request.getSession().setAttribute("url", "ProductDetail?pid=" + pid);

	        request.getRequestDispatcher("productdetails.jsp").forward(request, response);
	    } catch (Exception e) {
	        response.getWriter().println("Lỗi: " + e.getMessage());
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
