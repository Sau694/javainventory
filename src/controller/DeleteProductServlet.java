package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                boolean isDeleted = productDAO.deleteProduct(id);
                
                if (isDeleted) {
                    request.getSession().setAttribute("message", "Product deleted successfully!");
                } else {
                    request.getSession().setAttribute("error", "Failed to delete product.");
                }
            } catch (NumberFormatException e) {
                request.getSession().setAttribute("error", "Invalid product ID format.");
            }
        }
        
        response.sendRedirect("ViewProductServlet");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
