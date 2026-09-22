package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

@WebServlet("/SearchProductServlet")
public class SearchProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String keyword = request.getParameter("keyword");
        
        if (keyword != null && !keyword.trim().isEmpty()) {
            List<Product> listProduct = productDAO.searchProduct(keyword.trim());
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("searchKeyword", keyword);
            request.getRequestDispatcher("searchProduct.jsp").forward(request, response);
        } else {
            response.sendRedirect("searchProduct.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
