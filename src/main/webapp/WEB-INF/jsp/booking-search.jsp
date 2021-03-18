<%--
Created by IntelliJ IDEA.
User: DELL
Date: 1/6/2021
Time: 3:59 PM
To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Airbook - Check Booking</title>
<%--    <jsp:include page="css.jsp"/>--%>
    <jsp:include page="administration/_head.jsp"/>
    <script src="/resources/js/tableToPDF.js"></script>
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
<body style="min-height: 1000px ;font-family: 'Poppins', sans-serif;background-color: #f7f7f7">
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
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">
            <div class="card">
                <div class="card-body">
                    <form:form modelAttribute="ticket" action="bookingDetails" method="get">
                    <h1 style="font-size: 18px;line-height: 22px;font-weight: 700;color: #59595b">Manage Booking</h1>
                    <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">In order to receive your booking code. So, we can easily check your booking.</p>
                    <label style="font-size: 14px;line-height: 20px;font-weight: 700;color: #59595b">Booking Code *</label>
                    <form:input path="booking.bookingId" type="text" class="form-control" id="bookingId" required="true"/>
                    <label style="font-size: 14px;line-height: 20px;font-weight: 700;color: #59595b;margin: 15px 0 7px 0">Last Name *</label>
                    <form:input path="passenger.lastName" type="text" class="form-control" id="lastName" required="true"/><br>
                    <input type="submit" class="btn btn-danger w-100 mb-3" value="Search" style="color: white;font-size: 18px;font-weight: 500;background-color: #e31f25"/>
                    </form:form>
                    <button onclick="tableToPDF('tablePDF')" class="btn w-100" style="color: white;font-size: 16px;font-weight: 500;background-color: #e67e22"><i class="fa fa-print"></i>Print</button>

                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <div class="card" id="notification-container">
                <div class="card-body">
                    <table class="table table-bordered" id="tablePDF" style="font-size: 13px">
                        <thead>
                        <tr>
                            <th class="text-center">#</th>
                            <th class="text-center">Ticket ID</th>
                            <th class="text-center">Flight</th>
                            <th class="text-center">Origin</th>
                            <th class="text-center">Destination</th>
                            <th class="text-center">Travel Class</th>
                            <th class="text-center">Ticket Type</th>
                            <th class="text-center">Seat Code</th>
                            <th class="text-center">Price $</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="t" items="${tickets}">
                            <tr>
                                <td>${t.booking.bookingId}</td>
                                <td>${t.ticketId}</td>
                                <td>
                                        ${t.flight.flightId}
                                    <br/>
                                        ${t.flight.aircraft.model}
                                </td>
                                <td style="width: 15%">
                                    ${t.flight.flightRoute.originAirport.city.cityName}
                                        <br>
                                        ${t.flight.flightRoute.originAirport.airportName}
                                    <br/>
                                        ${t.flight._departureTime}
                                </td>
                                <td style="width: 15%">
                                    ${t.flight.flightRoute.destinationAirport.city.cityName}
                                        <br>
                                        ${t.flight.flightRoute.destinationAirport.airportName}
                                    <br/>
                                        ${t.flight._arrivalTime}
                                </td>
                                <td style="width: 10%;">${t.travelClass.className}</td>
                                <td style="width: 10%">${t.ticketType.ticketTypeName}</td>
                                <td style="width: 10%">${t.seatCode}</td>
                                <td style="width: 10%">${t.price}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="fixed-bottom">
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
