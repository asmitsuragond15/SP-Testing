<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Product Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <section>
        <div class="container card-sh" style="margin-top: 70px; margin-bottom: 100px">
            <div class="col-md-12 p-5">
                <div class="row">
                    <c:if test="${sessionScope.succMsg != null}">
                        <p class="text-success alert alert-success text-center" role="alert">${sessionScope.succMsg}</p>
                        <c:out value="${commnServiceImpl.removeSessionMessage()}"/>
                    </c:if>

                    <c:if test="${sessionScope.errorMsg != null}">
                        <p class="text-danger text-center alert alert-danger">${sessionScope.errorMsg}</p>
                        <c:out value="${commnServiceImpl.removeSessionMessage()}"/>
                    </c:if>

                    <div class="col-md-6 text-end">
                        <img alt="" src="${pageContext.request.contextPath}/img/product_img/${product.image}" width="300" height="250">
                    </div>

                    <div class="col-md-6">
                        <p class="fs-3">${product.title}</p>
                        <p>
                            <span class="fw-bold">Description :</span><br>${product.description}
                        </p>
                        <p>
                            <span class="fw-bold">Product Details:</span><br>
                            Status:
                            <c:choose>
                                <c:when test="${product.stock > 0}">
                                    <span class="badge bg-success">Available</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-warning">Out of Stock</span>
                                </c:otherwise>
                            </c:choose>
                            <br>Category: ${product.category}<br>
                            Policy: 7 Days Replacement & Return
                        </p>
                        <p class="fs-5 fw-bold">
                            Price: &nbsp; &nbsp; &nbsp; &nbsp;
                            <i class="fas fa-rupee-sign"></i> ${product.discountPrice} 
                            <span class="fs-6 text-decoration-line-through text-secondary">${product.price}</span>
                            <span class="fs-6 text-success">${product.discount}% off</span>
                        </p>

                        <div class="row">
                            <div class="col-md-4 text-success text-center p-2">
                                <i class="fas fa-money-bill-wave fa-2x"></i>
                                <p>Cash On Delivery</p>
                            </div>
                            <div class="col-md-4 text-danger text-center p-2">
                                <i class="fas fa-undo-alt fa-2x"></i>
                                <p>Return Available</p>
                            </div>
                            <div class="col-md-4 text-primary text-center p-2">
                                <i class="fas fa-truck-moving fa-2x"></i>
                                <p>Free Shipping</p>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${product.stock > 0}">
                                <c:choose>
                                    <c:when test="${user == null}">
                                        <a href="${pageContext.request.contextPath}/signin" class="btn btn-danger col-md-12">Add To Cart</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/user/addCart?pid=${product.id}&uid=${user.id}" class="btn btn-danger col-md-12">Add To Cart</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <a href="#" class="btn text-white btn-warning col-md-12">Out of Stock</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
  