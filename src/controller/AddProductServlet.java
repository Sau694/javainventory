package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("addProduct.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String quantityStr = request.getParameter("quantity");
        String priceStr = request.getParameter("price");
        
        try {
            int quantity = Integer.parseInt(quantityStr);
            double price = Double.parseDouble(priceStr);
            
            Product newProduct = new Product(name, quantity, price);
            boolean isAdded = productDAO.addProduct(newProduct);
            
            if (isAdded) {
                request.setAttribute("successMessage", "Product added successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to add product. Database error.");
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid input format for quantity or price.");
        }
        
        // Forward back to the form with messages
        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
    }
}
