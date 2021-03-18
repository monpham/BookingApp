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

<div class="container-fluid px-0 carousel-container">
    <div id="myCarousel" class="carousel slide" style="width: 100%" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://cdn.airpaz.com/banner/Cheap-Flight-Ticket-Promo-to-All-Destinations-for-January-Airpaz-LP-4992.jpg" class="img-fluid" >
            </div>
            <div class="carousel-item">
                <img src="https://cdn.airpaz.com/banner/Cheap-Flights-Ticket-Booking-Promotion-to-All-Destinations-in-January-using-Airpaz-LP-7999.jpg" class="img-fluid" >
            </div>
            <div class="carousel-item">
                <img src="https://cdn.airpaz.com/banner/Cheap-Christmas-New-Year-flight-deals-sale-Airpaz-LP-6138.jpg" class="img-fluid">
            </div>
            <div class="carousel-item">
                <img src="https://cdn.airpaz.com/banner/Cheap-Flights-Booking-and-Airlines-Promo-to-All-Destinations-in-January-Airpaz-LP-2136.jpg" class="img-fluid" >
            </div>
            <div class="carousel-item">
                <img src="https://cdn.airpaz.com/banner/15102020_5f880792e513b.jpg" class="img-fluid"/>
            </div>
        </div>
        <!-- Controls -->
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<div class="row bg-white mx-0" style="height: 75px; width: 100%">

</div>
<div class="container mt-3">
    <div class="row">
        <c:forEach var="promo" items="${promotionList}">
            <div class="col-sm-4 rounded-lg" style="margin-bottom: 50px">
                <div class="card">
                    <img class="card-img-top mb-2" src="${promo.image}"/>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col">
                                <p class="text-dark font-weight-bold" style="font-size: 20px;line-height: 17px;font-weight: 700;">${promo.eventName}</p>
                            </div>
                        </div>
                        <div class="row px-3">
                            <div class="col px-2 py-2 border border-left-0 text-center">
                                <p class="text-muted mt-2" style="font-weight: 400;font-size: 17px;line-height: 14px">Start Date</p>
                                <h6 class="text-dark mb-4" style="font-weight: 600;">${promo._startDate}</h6>
                            </div>
                            <div class="col px-2 py-2 border border-right-0 border-left-0 text-center">
                                <p class="text-muted mt-2" style="font-weight: 400;font-size: 17px;line-height: 14px">End Date</p>
                                <h6 class="text-dark mb-4" style="font-weight: 600">${promo._endDate}</h6>
                            </div>
                        </div>
                        <div class="row px-3 pt-3">
                            <a href="/promo_details?id=${promo.promotionId}" class="btn w-100 my-sm-0 shadow-sm login-btn">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
