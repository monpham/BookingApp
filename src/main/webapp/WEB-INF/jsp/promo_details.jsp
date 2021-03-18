<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/4/2021
  Time: 12:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AirBook</title>
    <jsp:include page="css.jsp"/>
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
        .card:hover{
            box-shadow: 0 4px 8px rgba(0,0,0,.18), 0 0 4px rgba(0,0,0,.15);
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
<div class="d-flex flex-column align-items-center" style="height: 43vh;background-color: white">
    <p style="color: #59595b;font-weight: 500; font-size: 24px;line-height: 29px" class="my-4">Flight Discount Up To <strong>${promotion.discount_amount_max} $</strong></p>
    <p style="color: #59595b;font-weight: 400;font-size: 14px;line-height: 17px" class="mt-3">Promo Period <strong>${promotion._startDate}</strong> to <strong>${promotion._endDate}</strong></p>
    <p style="color: #59595b;font-weight: 400;font-size: 14px;line-height: 17px" class="mt-2">Booking can be made through Airbook website</p>
    <p style="color: #59595b;font-weight: 400;font-size: 14px;line-height: 17px" class="mt-2">Promo is applicable to all payment method</p>
</div>
<div class="container d-flex justify-content-center mt-5">
    <div class="col-sm-8 align-items-center">
        <div class="row justify-content-center">
            <c:forEach items="${promotion.discounts}" var="discount">
                    <div class="col-sm-6 mb-5">
                        <div class="card">
                            <div class="card-body d-flex flex-column">
                                <div class="row">
                                    <div class="col text-center">
                                        <p style="font-weight: 700;font-size: 18px;color: #59595b">DISCOUNT RP ${discount.discountAmount} $</p>
                                        <p style="color: #59595b" class="text-muted">quantity: ${discount.discountQuantity}</p>
                                    </div>
                                </div>
                                <div class="row py-2 px-3">
                                    <div class="col-sm-8 py-2 text-center border">
                                        <p class="pt-2" style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">${discount.discountCode}</p>
                                    </div>
                                    <div class="col-sm-4 pl-0">
                                        <button type="button" class="h-100 w-100 btn btn-danger rounded-0"><i class="fa fa-copy"></i></button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>


<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
