<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Product Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <!-- Internal CSS -->
    <style>
        body {
            background-color: #f8f9fa; /* Light background for the page */
        }

        .bg-primary {
            background-color: #000 !important; /* Black background for the header section */
        }

        .text-dark {
            color: #000 !important; /* Black text color for buttons */
        }

        .btn-light {
            background-color: #fff; /* White background for buttons */
            border-color: #ddd;
        }

        .btn-light:hover {
            background-color: #f8f9fa; /* Slightly gray for hover */
        }

        .card {
            border: none; /* Remove border for a cleaner look */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px); /* Slight lift effect on hover */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow effect on hover */
        }

        .card-body {
            background-color: #fff; /* White background for card bodies */
            padding: 1.5rem; /* Increased padding */
        }

        .card img {
            border-radius: 8px; /* Rounded corners for images */
            transition: transform 0.3s ease;
        }

        .card img:hover {
            transform: scale(1.05); /* Slight zoom effect on hover */
        }

        .list-group-item {
            color: #000; /* Black text color for list items */
            background-color: #fff; /* White background for list items */
            border: 1px solid #ddd; /* Light border for list items */
            border-radius: 5px; /* Rounded corners for list items */
        }

        .list-group-item.active {
            background-color: #000; /* Black background for active list item */
            color: #fff; /* White text color for active list item */
        }

        .fs-3, .fs-5, .fs-6 {
            color: #000; /* Black text color for various headings */
        }

        .text-danger {
            color: #dc3545; /* Bootstrap's danger color */
        }

        .pagination .page-item .page-link {
            color: #000; /* Black color for pagination links */
        }

        .pagination .page-item.active .page-link {
            background-color: #000; /* Black background for active pagination link */
            color: #fff; /* White text color for active pagination link */
        }

        .product-title {
            font-size: 1.2rem;
            font-weight: bold;
        }

        .product-price {
            font-size: 1.1rem;
            font-weight: bold;
        }

        .product-discount {
            font-size: 1rem;
            color: #28a745; /* Bootstrap success color */
        }

        .product-original-price {
            font-size: 1rem;
            text-decoration: line-through;
            color: #6c757d; /* Bootstrap secondary color */
        }

        /* Improved Search Form Styles */
        .search-container {
            margin-top: 2rem; /* Add some top margin */
        }

        .search-box {
            display: flex;
            align-items: center;
            border-radius: 50px; /* Rounded corners for the search box */
            overflow: hidden;
        }

        .search-box input {
            border: none;
            border-radius: 50px; /* Match the container's rounded corners */
            padding: 10px 20px;
            font-size: 1rem;
        }

        .search-box button {
            border-radius: 0; /* Remove rounded corners for the button */
            background-color: #343a40; /* Dark background for the button */
            color: #fff; /* White text color for the button */
            border: none;
            padding: 8px 16px; /* Reduced padding */
            font-size: 0.9rem; /* Slightly smaller font size */
            transition: background-color 0.3s ease;
            max-width: 150px; /* Set a max width */
        }

        .search-box button:hover {
            background-color: #495057; /* Slightly lighter color on hover */
        }

        /* Center align pagination controls */
        .pagination-container {
            display: flex;
            justify-content: center; /* Center the pagination controls */
            margin-top: 1rem; /* Add some top margin */
        }
    </style>
</head>
<body>
    <section>
        <div class="container-fluid mt-5">
            <div class="row search-container">
                <div class="col-md-8 offset-md-2">
                    <form action="/products" method="get">
                        <div class="search-box">
                            <input type="text" class="form-control" name="ch" placeholder="Search products...">
                            <button class="btn btn-light text-dark">
                                <i class="fa-solid fa-magnifying-glass"></i> Search
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="container-fluid mt-1">
            <div class="row">
                <div class="col-md-2 p-0">
                    <div class="card shadow-sm p-0 mb-5 bg-body-tertiary rounded">
                        <div class="card-body">
                            <div class="list-group">
                                <p class="fs-5">Category</p>
                                <a href="/products" class="list-group-item list-group-item-action 
                                    ${paramValue == '' ? 'active' : ''}" aria-current="true">All</a>
                                <c:forEach var="c" items="${categories}">
                                    <a href="/products?category=${c.name}" 
                                       class="list-group-item list-group-item-action
                                       ${paramValue == c.name ? 'active' : ''}">
                                       ${c.name}
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Products</p>
                            <div class="row">
                                <c:if test="${productsSize > 0}">
                                    <c:forEach var="p" items="${products}">
                                        <div class="col-md-3 mt-2">
                                            <div class="card card-sh">
                                                <div class="card-body text-center">
                                                    <img alt="" src="/img/product_img/${p.image}"
                                                         width="150px" height="150px">
                                                    <p class="product-title text-center mt-2">${p.title}</p>
                                                    <div class="row text-center mt-2">
                                                        <p class="product-price">
                                                            <span>&#8377; ${p.discountPrice}</span>
                                                        </p>
                                                        <p class="product-original-price">
                                                            <span>&#8377; ${p.price}</span>
                                                        </p>
                                                        <p class="product-discount">
                                                            ${p.discount}% off
                                                        </p>
                                                        <a href="/product/${p.id}"
                                                           class="btn btn-dark col-md-6 offset-md-3 mt-2">
                                                           View Details
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${productsSize <= 0}">
                                    <p class="fs-4 text-center mt-4 text-danger">Product not available</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- Start Pagination -->
                    <div class="pagination-container">
                        <div class="col-md-4">Total Products : ${totalElements}</div>
                        <div class="col-md-6">
                            <c:if test="${productsSize > 0}">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item ${isFirst ? 'disabled' : ''}">
                                            <a class="page-link" href="/products?pageNo=${pageNo - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <li class="page-item ${pageNo == i ? 'active' : ''}">
                                                <a class="page-link" href="/products?pageNo=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item ${isLast ? 'disabled' : ''}">
                                            <a class="page-link" href="/products?pageNo=${pageNo + 1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:if>
                        </div>
                    </div>
                    <!-- End Pagination -->
                </div>
            </div>
        </div>
    </section>
</body>
</html>
