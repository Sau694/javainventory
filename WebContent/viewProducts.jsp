<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inventory List - Inventory System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    
    <script>
        function confirmDelete(id) {
            if(confirm("Are you sure you want to delete this product? This action cannot be undone.")) {
                window.location.href = "DeleteProductServlet?id=" + id;
            }
        }
    </script>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="index.jsp"><i class="fas fa-boxes"></i> InventoryPro</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="ViewProductServlet">View Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="addProduct.jsp">Add Product</a></li>
                    <li class="nav-item"><a class="nav-link" href="searchProduct.jsp">Search</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="table-container">
            <div class="d-flex justify-content-between align-items-center page-header">
                <h2><i class="fas fa-list-ul text-primary"></i> Product Inventory</h2>
                <a href="addProduct.jsp" class="btn btn-success"><i class="fas fa-plus"></i> Add New</a>
            </div>
            
            <%-- Session messages for Delete operations --%>
            <% if(request.getSession().getAttribute("message") != null) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fas fa-check-circle"></i> <%= request.getSession().getAttribute("message") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <% request.getSession().removeAttribute("message"); %>
            <% } %>
            
            <% if(request.getSession().getAttribute("error") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle"></i> <%= request.getSession().getAttribute("error") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <% request.getSession().removeAttribute("error"); %>
            <% } %>
            
            <div class="table-responsive">
                <table class="table table-hover table-bordered text-center align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Product Name</th>
                            <th>Stock Quantity</th>
                            <th>Unit Price ()</th>
                            <th>Total Value</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
                            if (listProduct != null && !listProduct.isEmpty()) {
                                for(Product p : listProduct) {
                        %>
                            <tr>
                                <td><span class="badge bg-secondary">#<%= p.getId() %></span></td>
                                <td class="text-start fw-bold"><%= p.getName() %></td>
                                <td>
                                    <% if(p.getQuantity() < 10) { %>
                                        <span class="badge bg-danger"><%= p.getQuantity() %> Low Stock</span>
                                    <% } else { %>
                                        <%= p.getQuantity() %>
                                    <% } %>
                                </td>
                                <td>$<%= String.format("%.2f", p.getPrice()) %></td>
                                <td>$<%= String.format("%.2f", p.getQuantity() * p.getPrice()) %></td>
                                <td>
                                    <a href="UpdateProductServlet?id=<%= p.getId() %>" class="btn btn-sm btn-primary action-btn" title="Edit">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <button onclick="confirmDelete(<%= p.getId() %>)" class="btn btn-sm btn-danger action-btn" title="Delete">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </button>
                                </td>
                            </tr>
                        <% 
                                }
                            } else { 
                        %>
                            <tr>
                                <td colspan="6" class="text-center py-4 text-muted">
                                    <i class="fas fa-box-open fa-3x mb-3 d-block"></i>
                                    No products found in the inventory.
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
