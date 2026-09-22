<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
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
                    <li class="nav-item">
                        <a class="nav-link active" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewProductServlet">View Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addProduct.jsp">Add Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="searchProduct.jsp">Search</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="text-center mb-5">
            <h1 class="display-4 fw-bold text-primary mb-3">Welcome to InventoryPro</h1>
            <p class="lead text-muted">A complete Advanced Inventory Management System Web Application</p>
        </div>

        <div class="row g-4 mt-4 text-center">
            <!-- Add Product Card -->
            <div class="col-md-4">
                <a href="addProduct.jsp" class="text-decoration-none text-dark">
                    <div class="card dashboard-card h-100 py-4">
                        <div class="card-body">
                            <i class="fas fa-plus-circle card-icon text-success"></i>
                            <h4 class="card-title mt-3">Add Product</h4>
                            <p class="card-text text-muted">Register a new product to the warehouse database.</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- View Products Card -->
            <div class="col-md-4">
                <a href="ViewProductServlet" class="text-decoration-none text-dark">
                    <div class="card dashboard-card h-100 py-4">
                        <div class="card-body">
                            <i class="fas fa-list-ul card-icon text-primary"></i>
                            <h4 class="card-title mt-3">View Inventory</h4>
                            <p class="card-text text-muted">View all available products, update details or remove stock.</p>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Search Card -->
            <div class="col-md-4">
                <a href="searchProduct.jsp" class="text-decoration-none text-dark">
                    <div class="card dashboard-card h-100 py-4">
                        <div class="card-body">
                            <i class="fas fa-search card-icon text-warning"></i>
                            <h4 class="card-title mt-3">Search Products</h4>
                            <p class="card-text text-muted">Find specific items quickly by their ID or name.</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
