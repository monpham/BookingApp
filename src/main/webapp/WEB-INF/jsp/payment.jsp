<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01/01/21
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <jsp:include page="administration/_head.jsp" />--%>
<%--    <title>Title</title>--%>

<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <form:form action="payment" modelAttribute="creditCard" method="POST">--%>
<%--        <div class="form-group">--%>
<%--            <label for="cardNumber">Card Number: </label>--%>
<%--            <form:input path="cardNumber" type="text" class="form-control col-md-4" id="cardNumber" placeholder="" />--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="expiryDate">Expiry Date: </label>--%>
<%--            <input type="date" class="form-control col-md-4" id="expiryDate" placeholder="" >--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="otp">Enter OTP: </label>--%>
<%--            <form:input path="OTP" type="text" class="form-control col-md-4" id="otp" placeholder="" />--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Pay</button>--%>

<%--    </form:form>--%>
<%--    <h5>${totalPrice}</h5>--%>
<%--    <h5>${message}</h5>--%>

<%--</div>--%>

<%--</body>--%>
<%--</html>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01/01/21
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="administration/_head.jsp" />
    <title>Airbook - Payment</title>
    <style>
        a{
            text-decoration: none;
            color: #59595b;
        }
        a:hover{
            text-decoration: none;
            color: #59595b;
        }
        li.nav-item:hover{
            background-color: #f7f7f7;
        }
        li.nav-item a:hover{
            color: #f39c12;
        }
        li.nav-item a{
            font-size: 14px;
            font-weight: 400;
            color: #59595b;
            text-align: center;
        }
        .login-btn{
            background-color: #ffffff;
            font-weight: 600;
            color: #9a9a9d;
            min-width: 95px;
            font-size: 17px;
            line-height: 17px;
            padding: 15px 20px;
        }
        .login-btn:hover{
            background-color: #f2f2f2;
            border-color: transparent;
            color: #9a9a9d;
        }
    </style>
</head>
<body style="font-family: 'Poppins', sans-serif;background-color: #f7f7f7">
<nav class="navbar navbar-expand-md bg-white border-bottom" style="height: 75px;padding: 0 10vw 0 10vw;">
    <a class="navbar-brand" href="#" style="font-size: 40px;font-weight: 600;color: #f39c12">
        Airpaz
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item py-3 active">
                <a class="nav-link" href="/">Flight</a>
            </li>
            <li class="nav-item py-3">
                <a class="nav-link" href="/promo">Promo</a>
            </li>
            <li class="nav-item py-3">
                <a class="nav-link" href="bookingSearch">Check Booking</a>
            </li>
        </ul>
        <div class="mt-2 mt-md-0">
            <a href="/login" class="btn my-2 my-sm-0 shadow-sm login-btn">Login</a>
        </div>
    </div>
</nav>
<br><br>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body pb-0">
                    <form:form action="payment" modelAttribute="creditCard" method="POST">
                    <div class="form-group">
                        <label>Card Number: </label>
                        <form:input path="cardNumber" type="text" class="form-control" id="cardNumber" placeholder="" />
                    </div>
                    <div class="form-group">
                        <label>Enter OTP: </label>
                        <form:input path="OTP" type="text" class="form-control" id="otp" placeholder="" />
                    </div>
                    <button type="submit" class="btn w-100 mt-2" style="color: white;font-size: 16px;font-weight: 500;background-color: #e31f25">Pay</button>
                        </form:form>
                    <p class="text-muted">Total: $ ${totalPrice}</p>
                    <p>${message}</p>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br>
<footer class="fixed-bottom">
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
