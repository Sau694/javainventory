<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product - Inventory System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
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
                    <li class="nav-item"><a class="nav-link" href="ViewProductServlet">View Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="addProduct.jsp">Add Product</a></li>
                    <li class="nav-item"><a class="nav-link" href="searchProduct.jsp">Search</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="form-container">
            <h2 class="page-header text-center"><i class="fas fa-edit text-primary"></i> Update Product</h2>
            
            <% if(request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("errorMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>

            <%
                Product product = (Product) request.getAttribute("product");
                if (product != null) {
            %>
            <form action="UpdateProductServlet" method="post">
                <!-- Hidden field for ID -->
                <input type="hidden" name="id" value="<%= product.getId() %>">
                
                <div class="mb-3">
                    <label class="form-label">Product ID</label>
                    <input type="text" class="form-control" value="<%= product.getId() %>" disabled>
                </div>
                
                <div class="mb-3">
                    <label for="name" class="form-label">Product Name <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= product.getName() %>" required>
                </div>
                
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity <span class="text-danger">*</span></label>
                    <input type="number" class="form-control" id="quantity" name="quantity" value="<%= product.getQuantity() %>" required min="0">
                </div>
                
                <div class="mb-4">
                    <label for="price" class="form-label">Unit Price ($) <span class="text-danger">*</span></label>
                    <input type="number" class="form-control" id="price" name="price" value="<%= product.getPrice() %>" required min="0" step="0.01">
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg"><i class="fas fa-save"></i> Update Changes</button>
                    <a href="ViewProductServlet" class="btn btn-outline-secondary"><i class="fas fa-times"></i> Cancel</a>
                </div>
            </form>
            <% } else { %>
                <div class="text-center py-5">
                    <i class="fas fa-exclamation-triangle fa-3x text-warning mb-3"></i>
                    <h4>Product Not Found</h4>
                    <p class="text-muted">The product you are trying to update does not exist or invalid ID was provided.</p>
                    <a href="ViewProductServlet" class="btn btn-primary mt-3">Back to Inventory</a>
                </div>
            <% } %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
