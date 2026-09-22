package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
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
                Product existingProduct = productDAO.getProductById(id);
                
                if (existingProduct != null) {
                    request.setAttribute("product", existingProduct);
                    request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("ViewProductServlet");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String quantityStr = request.getParameter("quantity");
        String priceStr = request.getParameter("price");
        
        try {
            int id = Integer.parseInt(idStr);
            int quantity = Integer.parseInt(quantityStr);
            double price = Double.parseDouble(priceStr);
            
            Product product = new Product(id, name, quantity, price);
            boolean isUpdated = productDAO.updateProduct(product);
            
            if (isUpdated) {
                request.setAttribute("successMessage", "Product updated successfully!");
                response.sendRedirect("ViewProductServlet");
                return;
            } else {
                request.setAttribute("errorMessage", "Failed to update product. Database error.");
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid input format.");
        }
        
        // If error, forward back to form
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                Product existingProduct = productDAO.getProductById(id);
                request.setAttribute("product", existingProduct);
            } catch (NumberFormatException e) {}
        }
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
    }
}
