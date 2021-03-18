<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: ADMIN--%>
<%--  Date: 12/23/20--%>
<%--  Time: 10:09 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <title>Title</title>--%>
<%--    <jsp:include page="administration/_head.jsp"/>--%>
<%--    <script>--%>

<%--        let totalPrice = 0;--%>
<%--        let flightData;--%>
<%--        $(document).ready(function () {--%>
<%--            //Get the previous Value--%>
<%--            flightData = JSON.parse(sessionStorage.getItem(sessionId.value));--%>
<%--            console.log(flightData);--%>
<%--            let numberOfColumns = $('#ticket-table-detail-container tbody td').length;--%>
<%--            console.log(numberOfColumns);--%>
<%--            let ticketTable = document.getElementById("ticket-table-detail-container");--%>
<%--            let ticketTr = ticketTable.getElementsByTagName("tr");--%>
<%--            let ticketTd;--%>
<%--            console.log(ticketTr.length);--%>
<%--            console.log(numberOfColumns / (ticketTr.length - 1));--%>

<%--            for (let i = 1; i < (ticketTr.length - 1); i++) {--%>
<%--                ticketTd = ticketTr[i].getElementsByTagName("td")[6].innerText;--%>
<%--                console.log(ticketTd);--%>
<%--                console.log(isNaN(parseInt(ticketTd)));--%>
<%--                totalPrice += parseInt(ticketTd);--%>
<%--            }--%>
<%--            console.log(totalPrice);--%>
<%--            $('#totalPrice').html(totalPrice);--%>
<%--        })--%>
<%--        function goToCreditCardPayment () {--%>
<%--            flightData.totalPaymentAmount = totalPrice;--%>
<%--            sessionStorage.setItem(sessionId.value, flightData);--%>
<%--            $.ajax({--%>
<%--                type: "POST",--%>
<%--                url: "flightPickerHandler",--%>
<%--                dataType: "json",--%>
<%--                contentType: "application/json",--%>
<%--                data: JSON.stringify(flightData),--%>
<%--                success: function (data, textStatus, jqXHR) {--%>
<%--                    console.log("send data to backend successfully: ");--%>
<%--                    console.log(data);--%>

<%--                    // move to a new page--%>
<%--                    location.href = "payment";--%>
<%--                },--%>
<%--                error: function (jqXHR, textStatus, errorThrown) {--%>
<%--                    console.log(textStatus);--%>
<%--                    console.log("fail");--%>
<%--                    alert("OOP!!! Something is wrong!!!");--%>
<%--                }--%>
<%--            });--%>

<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<input hidden type="text" value="${sessionId}" id="sessionId"/>--%>
<%--<div class="container">--%>
<%--    <table class="table" id="ticket-table-detail-container">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th scope="col">Origin</th>--%>
<%--            <th scope="col">Destination</th>--%>
<%--            <th scope="col">Passenger Name</th>--%>
<%--            <th scope="col">Travel Class</th>--%>
<%--            <th scope="col">Seat Code</th>--%>
<%--            <th scope="col">Title</th>--%>
<%--            <th scope="col">Price</th>--%>
<%--            <th scope="col">Unit</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach var="p" items="${paymentInformationList}">--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    ${p.flight.flightRoute.originAirport.airportName}--%>
<%--                    <br/>--%>
<%--                    ${p.flight._departureTime}--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    ${p.flight.flightRoute.destinationAirport.airportName}--%>
<%--                    <br/>--%>
<%--                    ${p.flight._arrivalTime}--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    ${p.passengerInformation.firstName}--%>
<%--                    &nbsp;--%>
<%--                    ${p.passengerInformation.lastName}--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    ${p.travelClass}--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    ${p.ticket.seatCode}--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    ${p.passengerInformation.title}--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${p.travelClass == 'economy'}">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${p.passengerInformation.title} == 'infant'">--%>
<%--                                ${p.flight.economyPrice * 0.1}--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${p.passengerInformation.title} == 'child'">--%>
<%--                                ${p.flight.economyPrice * 0.9}--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                ${p.flight.economyPrice}--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </c:when>--%>
<%--                    <c:when test="${p.travelClass == 'business'}">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${p.passengerInformation.title} == 'infant'">--%>
<%--                                ${p.flight.businessPrice * 0.1}--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${p.passengerInformation.title} == 'child'">--%>
<%--                                ${p.flight.businessPrice * 0.9}--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                ${p.flight.businessPrice}--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </c:when>--%>
<%--                </c:choose>--%>
<%--                </td>--%>
<%--                <td>$</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        </tbody>--%>
<%--        <thead class="thead-dark">--%>
<%--        <tr>--%>
<%--            <th scope="col">Total</th>--%>
<%--            <th scope="col"></th>--%>
<%--            <th scope="col"></th>--%>
<%--            <th scope="col"></th>--%>
<%--            <th scope="col"></th>--%>
<%--            <th scope="col"></th>--%>
<%--            <th scope="col" id="totalPrice"></th>--%>
<%--            <th scope="col">$</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--    </table>--%>
<%--</div>--%>
<%--<div class="container">--%>
<%--    <h1>Payment Page</h1>--%>
<%--    <h1>Pay through credit card</h1>--%>
<%--    <button  id="creditCardPayment" onclick="goToCreditCardPayment()">Credit Card</button>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/6/2021
  Time: 10:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Aircraft - Payment</title>
    <jsp:include page="administration/_head.jsp"/>
    <script>

        let totalPrice = 0;
        let flightData;
        $(document).ready(function () {
            //Get the previous Value
            flightData = JSON.parse(sessionStorage.getItem(sessionId.value));
            console.log(flightData);
            let numberOfColumns = $('#ticket-table-detail-container tbody td').length;
            console.log(numberOfColumns);
            let ticketTable = document.getElementById("ticket-table-detail-container");
            let ticketTr = ticketTable.getElementsByTagName("tr");
            let ticketTd;
            console.log(ticketTr.length);
            console.log(numberOfColumns / (ticketTr.length - 1));

            for (let i = 1; i < (ticketTr.length - 1); i++) {
                ticketTd = ticketTr[i].getElementsByTagName("td")[6].innerText;
                console.log(ticketTd);
                console.log(isNaN(parseInt(ticketTd)));
                totalPrice += parseInt(ticketTd);
            }
            console.log(totalPrice);
            $('#totalPrice').html(totalPrice);
        })
        function goToCreditCardPayment () {
            flightData.totalPaymentAmount = totalPrice;
            sessionStorage.setItem(sessionId.value, flightData);
            $.ajax({
                type: "POST",
                url: "flightPickerHandler",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(flightData),
                success: function (data, textStatus, jqXHR) {
                    console.log("send data to backend successfully: ");
                    console.log(data);

                    // move to a new page
                    location.href = "payment";
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                    console.log("fail");
                    alert("OOP!!! Something is wrong!!!");
                }
            });

        }
    </script>
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
<input hidden type="text" value="${sessionId}" id="sessionId"/>
<div class="container">
    <div class="card">
        <div class="card-body">
            <table class="table table-bordered" id="ticket-table-detail-container">
                <thead>
                <tr class="text-center">
                    <th>Origin</th>
                    <th>Destination</th>
                    <th>Passenger Name</th>
                    <th>Travel Class</th>
                    <th>Seat Code</th>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Unit</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="p" items="${paymentInformationList}">
                    <tr class="text-center">
                        <td>
                                ${p.flight.flightRoute.originAirport.airportName}
                            <br/>
                                ${p.flight._departureTime}
                        </td>
                        <td>
                                ${p.flight.flightRoute.destinationAirport.airportName}
                            <br/>
                                ${p.flight._arrivalTime}
                        </td>
                        <td>
                                ${p.passengerInformation.firstName}
                            &nbsp;
                                ${p.passengerInformation.lastName}
                        </td>
                        <td>
                                ${p.travelClass}
                        </td>
                        <td>
                                ${p.ticket.seatCode}
                        </td>
                        <td>
                                ${p.passengerInformation.title}
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${p.travelClass == 'economy'}">
                                    <c:choose>
                                        <c:when test="${p.passengerInformation.title} == 'infant'">
                                            ${p.flight.economyPrice * 0.1}
                                        </c:when>
                                        <c:when test="${p.passengerInformation.title} == 'child'">
                                            ${p.flight.economyPrice * 0.9}
                                        </c:when>
                                        <c:otherwise>
                                            ${p.flight.economyPrice}
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:when test="${p.travelClass == 'business'}">
                                    <c:choose>
                                        <c:when test="${p.passengerInformation.title} == 'infant'">
                                            ${p.flight.businessPrice * 0.1}
                                        </c:when>
                                        <c:when test="${p.passengerInformation.title} == 'child'">
                                            ${p.flight.businessPrice * 0.9}
                                        </c:when>
                                        <c:otherwise>
                                            ${p.flight.businessPrice}
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                            </c:choose>
                        </td>
                        <td>$</td>
                    </tr>
                </c:forEach>
                <tr class="text-center">
                    <td colspan="6" class="text-left">Total</td>
                    <td id="totalPrice"></td>
                    <td>$</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="container">
    <button  id="creditCardPayment" class="btn float-right mt-2" style="color: white;font-size: 16px;font-weight: 500;background-color: #e31f25" onclick="goToCreditCardPayment()">Credit Card</button>
</div>
<br><br>
<footer class="fixed-bottom">
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>

