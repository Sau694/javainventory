<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product - Inventory System</title>
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
                    <li class="nav-item"><a class="nav-link active" href="addProduct.jsp">Add Product</a></li>
                    <li class="nav-item"><a class="nav-link" href="searchProduct.jsp">Search</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="form-container">
            <h2 class="page-header text-center"><i class="fas fa-plus-circle text-success"></i> Add New Product</h2>
            
            <%-- Display Messages --%>
            <% if(request.getAttribute("successMessage") != null) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fas fa-check-circle"></i> <%= request.getAttribute("successMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>
            
            <% if(request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("errorMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>

            <form action="AddProductServlet" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Product Name <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="name" name="name" required placeholder="Enter product name">
                </div>
                
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity <span class="text-danger">*</span></label>
                    <input type="number" class="form-control" id="quantity" name="quantity" required min="0" placeholder="Enter stock quantity">
                </div>
                
                <div class="mb-4">
                    <label for="price" class="form-label">Unit Price ($) <span class="text-danger">*</span></label>
                    <input type="number" class="form-control" id="price" name="price" required min="0" step="0.01" placeholder="Enter product price">
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg"><i class="fas fa-save"></i> Save Product</button>
                    <a href="ViewProductServlet" class="btn btn-outline-secondary"><i class="fas fa-arrow-left"></i> Back to Inventory</a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
