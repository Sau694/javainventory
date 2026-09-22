package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import model.Product;

public class ProductDAO {

    // 1. Add new product
    public boolean addProduct(Product product) {
        String sql = "INSERT INTO products (name, quantity, price) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, product.getName());
            stmt.setInt(2, product.getQuantity());
            stmt.setDouble(3, product.getPrice());
            
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 2. View all products
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY id DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Product product = new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getInt("quantity"),
                    rs.getDouble("price")
                );
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    // 3. Update existing product
    public boolean updateProduct(Product product) {
        String sql = "UPDATE products SET name = ?, quantity = ?, price = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, product.getName());
            stmt.setInt(2, product.getQuantity());
            stmt.setDouble(3, product.getPrice());
            stmt.setInt(4, product.getId());
            
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 4. Delete product
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 5. Search product by ID or name
    public List<Product> searchProduct(String keyword) {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE id = ? OR name LIKE ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            try {
                // Check if keyword is an integer (for ID search)
                int id = Integer.parseInt(keyword);
                stmt.setInt(1, id);
            } catch (NumberFormatException e) {
                // If not an integer, assign an impossible ID like -1
                stmt.setInt(1, -1);
            }
            
            stmt.setString(2, "%" + keyword + "%");
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                    );
                    productList.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
    
    // Get product by ID (helper for update form)
    public Product getProductById(int id) {
        Product product = null;
        String sql = "SELECT * FROM products WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
}
