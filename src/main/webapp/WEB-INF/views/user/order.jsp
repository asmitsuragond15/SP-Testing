<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Order Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
    <section>
        <div class="container mt-5 p-5">
            <form action="${pageContext.request.contextPath}/user/save-order" method="post" id="orders" novalidate>
                <div class="row">

                    <div class="col-md-6">
                        <div class="mb-3 row">
                            <p class="text-center fs-4">Billing Address</p>
                            <hr>
                            <div class="col p-1">
                                <label>First Name</label> 
                                <input type="text" name="firstName" required class="form-control mt-1">
                            </div>
                            <div class="col p-1">
                                <label>Last Name</label> 
                                <input type="text" name="lastName" required class="form-control mt-1">
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <div class="col p-1">
                                <label>Email</label> 
                                <input type="email" name="email" required class="form-control col">
                            </div>
                            <div class="col p-1">
                                <label>Mobile Number</label> 
                                <input type="text" name="mobileNo" required class="form-control col ms-2">
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <div class="col p-1">
                                <label>Address</label> 
                                <input type="text" name="address" required class="form-control col">
                            </div>
                            <div class="col p-1">
                                <label>City</label> 
                                <input type="text" name="city" required class="form-control col ms-2">
                            </div>
                        </div>
                        
                        <div class="mb-3 row">
                            <div class="col p-1">
                                <label>State</label> 
                                <input type="text" name="state" required class="form-control col">
                            </div>
                            <div class="col p-1">
                                <label>Pincode</label> 
                                <input type="number" name="pincode" required class="form-control col ms-2">
                            </div>
                        </div>

                    </div>
                    
                    <div class="col-md-6">
                        <p class="text-center fs-4">Payment Type</p>
                        <hr>
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td>Price</td>
                                            <td>:</td>
                                            <td>&#8377; ${orderPrice}</td>
                                        </tr>
                                        <tr>
                                            <td>Delivery Fee</td>
                                            <td>:</td>
                                            <td>&#8377; 50</td>
                                        </tr>
                                        <tr>
                                            <td>Tax</td>
                                            <td>:</td>
                                            <td>&#8377; 10</td>
                                        </tr>
                                        <tr class="border-top">
                                            <td>Total Price</td>
                                            <td>:</td>
                                            <td>&#8377; ${totalOrderPrice}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="card shadow p-3 mb-5 mt-2 bg-body-tertiary rounded">
                            <div class="card-body">
                                <div class="mb-3">
                                    <label class="form-label">Select Payment Type</label> 
                                    <select required id="paymentType" name="paymentType" class="form-control">
                                        <option value="">--select--</option>
                                        <option value="COD">Cash On Delivery</option>
                                        <option value="ONLINE">Online Payment</option>
                                    </select>
                                </div>
                                <button type="button" id="razorpay-button" class="btn bg-primary text-white col-md-12" style="display:none;">Pay with Razorpay</button>
                                <button type="submit" id="place-order" class="btn bg-primary text-white col-md-12">Place Order</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    
    <script type="text/javascript">
    // Show or hide Razorpay button based on payment type selection
    document.getElementById('paymentType').addEventListener('change', function () {
        const paymentType = this.value;
        const razorpayButton = document.getElementById('razorpay-button');
        const placeOrderButton = document.getElementById('place-order');

        if (paymentType === 'ONLINE') {
            razorpayButton.style.display = 'block';
            placeOrderButton.style.display = 'none';
        } else {
            razorpayButton.style.display = 'none';
            placeOrderButton.style.display = 'block';
        }
    });

    // Trigger Razorpay Checkout
    document.getElementById('razorpay-button').addEventListener('click', function (e) {
        e.preventDefault();

        const totalOrderPrice = ${totalOrderPrice};  // Ensure this is a valid number
        const options = {
            "key": "rzp_test_zT6nDcxOnaNc2W",  // Replace with your Razorpay Key ID
            "amount": totalOrderPrice * 100,  // Razorpay accepts amount in paise (multiply by 100)
            "currency": "INR",
            "name": "E-Commerce Website",
            "description": "Order Payment",
            "handler": function (response) {
                // After payment is successful
                // Submit form with Razorpay response ID
                const form = document.getElementById('orders');
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'razorpayPaymentId';
                input.value = response.razorpay_payment_id;
                form.appendChild(input);
                form.submit();  // Submit form after successful payment
            },
            "prefill": {
                "name": document.getElementsByName('firstName')[0].value + ' ' + document.getElementsByName('lastName')[0].value,
                "email": document.getElementsByName('email')[0].value,
                "contact": document.getElementsByName('mobileNo')[0].value
            },
            "theme": {
                "color": "#3399cc"
            }
        };

        const rzp1 = new Razorpay(options);
        rzp1.open();
    });
    </script>
</body>
</html>
