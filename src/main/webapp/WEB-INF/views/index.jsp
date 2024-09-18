<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Carousel image settings */
        .carousel-inner img {
            height: 350px; /* Ensure images are consistent in height */
            object-fit: cover; /* Cover the area without distortion */
        }

        /* Card styles */
        .card {
            border: none;
            border-radius: 10px;
            overflow: hidden; /* Ensure content does not overflow */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow for better appearance */
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .card-body {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 1rem;
        }

        .card-body img {
            width: 100%;
            height: 200px; /* Fixed height for images */
            object-fit: cover; /* Ensure images cover the area without distortion */
            border-radius: 10px;
        }

        .card-body a {
            color: #333;
            text-decoration: none;
            font-size: 1rem;
            display: block;
            margin-top: 0.5rem;
        }

        .card-body a:hover {
            text-decoration: underline;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .card-item {
            flex: 1 1 calc(25% - 1rem); /* Adjust card width */
            box-sizing: border-box;
        }

        .bg-light {
            background-color: #f8f9fa !important;
        }

        @media (max-width: 768px) {
            .card-item {
                flex: 1 1 calc(50% - 1rem); /* Adjust for smaller screens */
            }

            .card-body img {
                height: 150px; /* Adjust image height for smaller screens */
            }
        }

        @media (max-width: 576px) {
            .card-item {
                flex: 1 1 100%; /* Full width for mobile screens */
            }
        }
    </style>
</head>
<body>
    <section>
        <!-- Start Slider -->
        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/img/ecom1.png" class="d-block w-100" alt="Slide 1">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/img/ecom3.jpg" class="d-block w-100" alt="Slide 2">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/img/ecom2.jpg" class="d-block w-100" alt="Slide 3">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- End Slider -->

        <!-- Start Category Module -->
        <div class="container my-5">
            <div class="row">
                <p class="text-center fs-4 mb-4">Category</p>

                <c:forEach var="category" items="${categories}">
                    <div class="col-md-2 col-sm-4 mb-4">
                        <div class="card rounded-circle shadow-sm">
                            <div class="card-body text-center">
                                <img src="${pageContext.request.contextPath}/img/category_img/${category.imageName}" class="img-fluid" alt="${category.name}">
                                <a href="${pageContext.request.contextPath}/products?category=${category.name}" class="d-block mt-2">${category.name}</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- End Category Module -->

        <!-- Start Latest Product Module -->
        <div class="container-fluid bg-light p-3">
            <div class="row">
                <p class="text-center fs-4 mb-4">Latest Products</p>

                <div class="card-container">
                    <c:forEach var="product" items="${products}">
                        <div class="card-item">
                            <div class="card shadow-sm">
                                <div class="card-body text-center">
                                    <img src="${pageContext.request.contextPath}/img/product_img/${product.image}" class="img-fluid" alt="${product.title}">
                                    <p class="mt-2">
                                        <a href="${pageContext.request.contextPath}/product/${product.id}" class="d-block">${product.title}</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- End Latest Product Module -->
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
