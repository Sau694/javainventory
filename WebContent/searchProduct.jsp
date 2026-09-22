<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Inventory - Inventory System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    
    <script>
        function confirmDelete(id) {
            if(confirm("Are you sure you want to delete this product?")) {
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
                    <li class="nav-item"><a class="nav-link" href="ViewProductServlet">View Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="addProduct.jsp">Add Product</a></li>
                    <li class="nav-item"><a class="nav-link active" href="searchProduct.jsp">Search</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="table-container">
            <h2 class="page-header text-center"><i class="fas fa-search text-warning"></i> Search Products</h2>
            
            <!-- Search Form -->
            <div class="row justify-content-center mb-5">
                <div class="col-md-8">
                    <form action="SearchProductServlet" method="get" class="d-flex">
                        <input type="text" name="keyword" class="form-control form-control-lg me-2" 
                               placeholder="Enter Product ID or Name..." 
                               value="<%= request.getAttribute("searchKeyword") != null ? request.getAttribute("searchKeyword") : "" %>" required>
                        <button type="submit" class="btn btn-warning btn-lg"><i class="fas fa-search"></i> Search</button>
                    </form>
                </div>
            </div>

            <!-- Search Results -->
            <% 
                List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
                if (listProduct != null) {
            %>
                <h4 class="mb-3">Search Results for: "<%= request.getAttribute("searchKeyword") %>"</h4>
                
                <% if (!listProduct.isEmpty()) { %>
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered text-center align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Product p : listProduct) { %>
                                    <tr>
                                        <td><span class="badge bg-secondary">#<%= p.getId() %></span></td>
                                        <td class="text-start fw-bold"><%= p.getName() %></td>
                                        <td><%= p.getQuantity() %></td>
                                        <td>$<%= String.format("%.2f", p.getPrice()) %></td>
                                        <td>
                                            <a href="UpdateProductServlet?id=<%= p.getId() %>" class="btn btn-sm btn-primary action-btn">
                                                <i class="fas fa-edit"></i> Edit
                                            </a>
                                            <button onclick="confirmDelete(<%= p.getId() %>)" class="btn btn-sm btn-danger action-btn">
                                                <i class="fas fa-trash-alt"></i> Delete
                                            </button>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <% } else { %>
                    <div class="alert alert-info text-center py-4">
                        <i class="fas fa-search-minus fa-2x mb-2 d-block"></i>
                        No products found matching your search criteria.
                    </div>
                <% } %>
            <% } %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
