<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/20/20
  Time: 12:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Airbook</title>
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
<%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>--%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <jsp:include page="css.jsp"/>

    <%--<script>
        let sessionId;
        $(document).ready(function () {
            sessionId = $('#sessionId').val();
            console.log(JSON.parse(sessionStorage.getItem(sessionId)));
            console.log(sessionStorage.getItem(sessionId));

            //Auto generate id for flights' ticket (Departure Table)
            //number of row
            let countRows1 = $('#departure-table tbody td').length;
            let table = document.getElementById("departure-table");
            let tr = table.getElementsByTagName("tr");

            console.log(tr.length);
            console.log(countRows1);

            let td;
            /*td = tr[1].getElementsByTagName("td")[4];
            let radioClicked = td.getElementsByTagName("input").namedItem("departureTime").value;
            console.log(radioClicked);*/

            for (let i = 1; i < tr.length; i++) {
                for (let j = 4; j < (countRows1 / (tr.length - 1)); j++) {
                    td = tr[i].getElementsByTagName("td")[j];
                    let radioClicked = td.getElementsByTagName("input").namedItem("departPrice");
                    if (j == 4) {
                        td.setAttribute("id", "departure-economy-" + i);
                        radioClicked.setAttribute("onclick", "sendDepartureFlightValues(" + "'departure-economy-" + i + "')");
                    } else {
                        td.setAttribute("id", "departure-business-" + i);
                        radioClicked.setAttribute("onclick", "sendDepartureFlightValues(" + "'departure-business-" + i + "')");
                    }
                    /*console.log(td);*/
                }
            }

            tripType = $('div#flightInformation div input#tripType').val();
            //Auto generate id for flights' ticket (Return Table)
            if (tripType == "roundTrip") {
                let countRows2 = $('#return-table tbody td').length;
                let table2 = document.getElementById("return-table");
                let tr2 = table2.getElementsByTagName("tr");
                console.log(tr2.length);
                console.log(countRows2);
                let td2;

                for (let i = 1; i < tr2.length; i++) {
                    for (let j = 4; j < (countRows2 / (tr2.length - 1)); j++) {
                        td2 = tr2[i].getElementsByTagName("td")[j];
                        let radioClicked2 = td2.getElementsByTagName("input").namedItem("returnPrice");
                        if (j == 4) {
                            td2.setAttribute("id", "return-economy-" + i);
                            radioClicked2.setAttribute("onclick", "sendReturnFlightValues(" + "'return-economy-" + i + "')");
                        } else {
                            td2.setAttribute("id", "return-business-" + i);
                            radioClicked2.setAttribute("onclick", "sendReturnFlightValues(" + "'return-business-" + i + "')");
                        }
                    }
                }
            }

            //////////
            adults = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("adults").value);
            children = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("children").value);
            infants = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("infants").value);

            console.log("adults, children, infants: " + adults + children + infants);
            console.log("Ready is here !!!" + flightPicker);


        })
        let origin, destination, departureDate, returnDate;
        ///////////
        let adults, children, infants;
        let departurePrice, departureFlightId, departureTravelClass;
        let returnPrice, returnFlightId, returnTravelClass;
        let flightPicker;
        let tripType;

        let departureFlightValClicked, returnFlightValClicked;

        function sendDepartureFlightValues(tableDataId) {
            tripType = $('div#flightInformation div input#tripType').val();
            departureFlightValClicked = true;
            /*document.getElementById("departure-flight-information").innerHTML = "Hello World";*/
            let record = document.getElementById(tableDataId);
            departurePrice = parseFloat(record.getElementsByTagName("input").namedItem("departPrice").value);
            departureFlightId = parseInt(record.getElementsByTagName("input").namedItem("flightId").value);
            departureTravelClass = record.getElementsByTagName("input").namedItem("travelClass").value;

            document.getElementById("departure-flight-information").getElementsByTagName("p").namedItem("departurePrice").innerHTML = "Total:" + departurePrice + "$";

            console.log(departurePrice);
            console.log(departureFlightId);
            console.log(departureTravelClass);

            flightPicker = {
                departureTrip: {
                    departureFlightId: departureFlightId,
                    travelClass: departureTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants,
                    departureSeatPossessions:[]
                },
                returnTrip: {
                    returnFlightId: returnFlightId,
                    travelClass: returnTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants,
                    returnSeatPossessions: []
                }
            };
            /*let previousFlightPickerData = sessionStorage.getItem(sessionId);*/
            console.log(flightPicker);

            if (tripType == "oneWay") {
                if (departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hi!");
                    $('#continue a').attr("href", "passengerDetails");
                }
            } else if (tripType == "roundTrip") {
                if (returnFlightValClicked && departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hello!");
                    $('#continue a').attr("href", "passengerDetails");
                }
            }

            //Send Json object
            sendJson();
        }

        /*let departureObject = '{ "departureTrip": [{"flightId": ""}, {"travelClass": ""}, {"adults": ""}, {"children": ""},{"infant": ""}]}';*/

        function sendReturnFlightValues(tableDataId) {
            tripType = $('div#flightInformation div input#tripType').val();
            returnFlightValClicked = true;
            let record2 = document.getElementById(tableDataId);
            returnPrice = parseFloat(record2.getElementsByTagName("input").namedItem("returnPrice").value);
            returnFlightId = parseInt(record2.getElementsByTagName("input").namedItem("flightId").value);
            returnTravelClass = record2.getElementsByTagName("input").namedItem("travelClass").value;

            document.getElementById("return-flight-information").getElementsByTagName("p").namedItem("returnPrice").innerHTML = "Total:" + returnPrice + "$";
            flightPicker = {
                departureTrip: {
                    departureFlightId: departureFlightId,
                    travelClass: departureTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants,
                    departureSeatPossessions:[]
                },
                returnTrip: {
                    returnFlightId: returnFlightId,
                    travelClass: returnTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants,
                    returnSeatPossessions: []
                }
            };

            if (tripType == "oneWay") {
                if (departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hi!");
                    $('#continue a').attr("href", "passengerDetails");
                }
            } else if (tripType == "roundTrip") {
                if (returnFlightValClicked && departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hello!");
                    $('#continue a').attr("href", "passengerDetails");
                }
            }
            //Send Json object
            sendJson();
        }

        function sendJson() {
            /////////////////////////////////////////////////////////////////////
            let previousFlightPickerData = JSON.parse(sessionStorage.getItem(sessionId));
            previousFlightPickerData.departureTrip = flightPicker.departureTrip;
            previousFlightPickerData.returnTrip = flightPicker.returnTrip;
            console.log("Clicked!!!");
            console.log(previousFlightPickerData);
            sessionStorage.setItem(sessionId, JSON.stringify(previousFlightPickerData));

            $.ajax({
                type: "POST",
                url: "flightPickerHandler",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(flightPicker),
                success: function (data, textStatus, jqXHR) {
                    console.log("send data to backend successfully: ");
                    console.log(data);
                    /*alert(data);*/

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                    console.log("fail");
                }
            });
        }
    </script>--%>
    <script>
        let sessionId;
        $(document).ready(function () {
            sessionId = $('#sessionId').val();
            console.log(JSON.parse(sessionStorage.getItem(sessionId)));
            console.log(sessionStorage.getItem(sessionId));

            //Auto generate id for flights' ticket (Departure Table)
            //number of row
            let countRows1 = $('#departure-table tbody td').length;
            let table = document.getElementById("departure-table");
            let tr = table.getElementsByTagName("tr");

            console.log(tr.length);
            console.log(countRows1);

            let td;

            for (let i = 0; i < tr.length; i++) {
                for (let j = 3; j < (countRows1 / (tr.length)); j++) {
                    td = tr[i].getElementsByTagName("td")[j];
                    let radioClicked = td.getElementsByTagName("input").namedItem("departPrice");
                    if (j == 3) {
                        td.setAttribute("id", "departure-economy-" + (i + 1));
                        radioClicked.setAttribute("onclick", "sendDepartureFlightValues(" + "'departure-economy-" + (i + 1) + "')");
                    } else {
                        td.setAttribute("id", "departure-business-" + (i +1));
                        radioClicked.setAttribute("onclick", "sendDepartureFlightValues(" + "'departure-business-" + (i + 1) + "')");
                    }
                    /*console.log(td);*/
                }
            }

            tripType = $('div#flightInformation div input#tripType').val();
            //Auto generate id for flights' ticket (Return Table)
            if (tripType == "roundTrip") {
                let countRows2 = $('#return-table tbody td').length;
                let table2 = document.getElementById("return-table");
                let tr2 = table2.getElementsByTagName("tr");
                console.log(tr2.length);
                console.log(countRows2);
                let td2;

                for (let i = 0; i < tr2.length; i++) {
                    for (let j = 3; j < (countRows2 / (tr2.length)); j++) {
                        td2 = tr2[i].getElementsByTagName("td")[j];
                        let radioClicked2 = td2.getElementsByTagName("input").namedItem("returnPrice");
                        if (j == 3) {
                            td2.setAttribute("id", "return-economy-" + (i + 1));
                            radioClicked2.setAttribute("onclick", "sendReturnFlightValues(" + "'return-economy-" + (i + 1) + "')");
                        } else {
                            td2.setAttribute("id", "return-business-" + (i + 1));
                            radioClicked2.setAttribute("onclick", "sendReturnFlightValues(" + "'return-business-" + (i + 1) + "')");
                        }
                    }
                }
            }

            //////////
            adults = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("adults").value);
            children = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("children").value);
            infants = parseInt(document.getElementById("passengerNumbers").getElementsByTagName("input").namedItem("infants").value);

            console.log("adults, children, infants: " + adults + children + infants);
            console.log("Ready is here !!!" + flightPicker);
        })
        let origin, destination, departureDate, returnDate;
        ///////////
        let adults, children, infants;
        let departurePrice, departureFlightId, departureTravelClass;
        let returnPrice, returnFlightId, returnTravelClass;
        let flightPicker;
        let tripType;

        let departureFlightValClicked, returnFlightValClicked;

        function sendDepartureFlightValues(tableDataId) {
            tripType = $('div#flightInformation div input#tripType').val();
            console.log(tripType);
            departureFlightValClicked = true;
            /*document.getElementById("departure-flight-information").innerHTML = "Hello World";*/
            let record = document.getElementById(tableDataId);
            departurePrice = parseFloat(record.getElementsByTagName("input").namedItem("departPrice").value);
            departureFlightId = parseInt(record.getElementsByTagName("input").namedItem("flightId").value);
            departureTravelClass = record.getElementsByTagName("input").namedItem("travelClass").value;

            /*document.getElementById("departure-flight-information").getElementsByTagName("p").namedItem("departurePrice").innerHTML = "Total:" + departurePrice + "$";*/
            $('#departure-price-display-item').text("Total: " + departurePrice + "$");

            console.log(departurePrice);
            console.log(departureFlightId);
            console.log(departureTravelClass);

            flightPicker = {
                departureTrip: {
                    departureFlightId: departureFlightId,
                    travelClass: departureTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants,
                    departureSeatPossessions:[]
                },
                returnTrip: {
                    returnFlightId: returnFlightId,
                    travelClass: returnTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants,
                    returnSeatPossessions: []
                }
            };
            /*let previousFlightPickerData = sessionStorage.getItem(sessionId);*/
            console.log(flightPicker);

            if (tripType == "oneWay") {
                if (departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hi!");
                    /*$('#continue a').attr("href", "passengerDetails");*/
                }
            } else if (tripType == "roundTrip") {
                if (returnFlightValClicked && departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hello!");
                    /*$('#continue a').attr("href", "");*/
                }
            }

            //Send Json object
            /*sendJson();*/
        }

        /*let departureObject = '{ "departureTrip": [{"flightId": ""}, {"travelClass": ""}, {"adults": ""}, {"children": ""},{"infant": ""}]}';*/
        function sendReturnFlightValues(tableDataId) {
            tripType = $('div#flightInformation div input#tripType').val();
            returnFlightValClicked = true;
            let record2 = document.getElementById(tableDataId);
            returnPrice = parseFloat(record2.getElementsByTagName("input").namedItem("returnPrice").value);
            returnFlightId = parseInt(record2.getElementsByTagName("input").namedItem("flightId").value);
            returnTravelClass = record2.getElementsByTagName("input").namedItem("travelClass").value;

            /*document.getElementById("return-flight-information").getElementsByTagName("p").namedItem("returnPrice").innerHTML = "Total:" + returnPrice + "$";*/
            $('#return-price-display-item').text("Total: " + returnPrice + "$");
            flightPicker = {
                departureTrip: {
                    departureFlightId: departureFlightId,
                    travelClass: departureTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants,
                    departureSeatPossessions:[]
                },
                returnTrip: {
                    returnFlightId: returnFlightId,
                    travelClass: returnTravelClass,
                    adults: adults,
                    children: children,
                    infant: infants,
                    returnSeatPossessions: []
                }
            };

            if (tripType == "oneWay") {
                if (departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hi!");
                    /*$('#continue a').attr("href", "passengerDetails");*/
                }
            } else if (tripType == "roundTrip") {
                if (returnFlightValClicked && departureFlightValClicked) {
                    $('#continue').removeAttr("disabled");
                    console.log("hello!");
                    /*$('#continue a').attr("href", "passengerDetails");*/
                }
            }
            //Send Json object
            /*sendJson();*/
        }

        function sendJson() {
            /////////////////////////////////////////////////////////////////////
            let previousFlightPickerData = JSON.parse(sessionStorage.getItem(sessionId));
            previousFlightPickerData.departureTrip = flightPicker.departureTrip;
            previousFlightPickerData.returnTrip = flightPicker.returnTrip;
            console.log("Clicked!!!");
            console.log(previousFlightPickerData);
            sessionStorage.setItem(sessionId, JSON.stringify(previousFlightPickerData));

            $.ajax({
                type: "POST",
                url: "flightPickerHandler",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(flightPicker),
                success: function (data, textStatus, jqXHR) {
                    console.log("send data to backend successfully: ");
                    console.log(data);
                    /*alert(data);*/
                    location.href = "passengerDetails";
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                    console.log("fail");
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
<body style="min-height: 1000px ;font-family: 'Poppins', sans-serif;background-color: #f7f7f7">
<input hidden type="text" value="${sessionId}" id="sessionId"/>
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

<%--End Navigation Bar--%>
<br><br>
<div class="container">
    <div class="row">
        <div class="col-sm-8">
            <div class="card">
                <div class="card-body px-0">
                    <div class="col">
                        <div class="row border-bottom">
                            <div class="col pb-3">
                                <p style="font-size: 14px;line-height: 17px;font-weight: 400;">Selected Departure Flight</p>
                                <strong>${ticketInformation.origin}</strong>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                                </svg>
                                <strong>${ticketInformation.destination}</strong>
                            </div>

                        </div>

                        <div class="row">
                            <table class="table table-borderless" id="departure-table">
                                <tbody>
                                <c:forEach var="f" items="${departFlights}">
                                    <tr class="border-top">
                                        <td style="padding: 0 0 0 30px">
                                            <img src="${f.aircraft.logo_airline}" alt="" height="75px" width="75px">
                                            <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.aircraft.model}</p>
                                            <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.aircraft.brand.brandName}</p>
                                        </td>
                                        <td>
                                            <strong>${f.departureTime.toLocalTime()}</strong>
                                            <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.departureTime.toLocalDate()}</p>
                                            <br>
                                            <strong>${f.arrivalTime.toLocalTime()}</strong>
                                            <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.arrivalTime.toLocalDate()}</p>
                                        </td>
                                        <td>
                                            <strong>${f.flightRoute.originAirport.city.cityName}</strong>
                                            <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.flightRoute.originAirport.airportName}</p>
                                            <br>
                                            <strong>${f.flightRoute.destinationAirport.city.cityName}</strong>
                                            <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${f.flightRoute.destinationAirport.airportName}</p>
                                        </td>
                                        <c:if test="${ticketInformation.travelClass == 'all' || ticketInformation.travelClass == 'economy'}">
                                        <td align="center">
                                            <strong>Economy</strong><br><br>
                                            <input type="radio" value=" ${f.economyPrice}" id="departPrice" name="departPrice"/>
                                            <input type="hidden" value="${f.flightId}" id="flightId" name="flightId"/>
                                            <input type="hidden" value="economy" id="travelClass" name="travelClass"/>
                                            <input type="hidden" value="${f.departureTime.toLocalTime()}" id="departureTime" name="departureTime"/>
                                            <input type="hidden" value="${ticketInformation.adults}" id="adults" name="adults"/>
                                            <input type="hidden" value="${ticketInformation.children}" id="children" name="children"/>
                                            <input type="hidden" value="${ticketInformation.infant}" id="infants" name="infants"/>
                                            <br/>
                                                ${f.economyPrice} <span class="unit">$</span>
                                        </td>
                                        </c:if>
                                        <c:if test="${ticketInformation.travelClass == 'all' || ticketInformation.travelClass == 'business'}">
                                        <td align="center">
                                            <strong>Business</strong><br><br>
                                            <input type="radio" name="departPrice" value="${f.businessPrice}" id="departPrice"/>
                                            <input type="hidden" value="${f.flightId}" id="flightId" name="flightId"/>
                                            <input type="hidden" value="business" id="travelClass" name="travelClass"/>
                                            <input type="hidden" value="${f.departureTime.toLocalTime()}" id="departureTime"/>
                                            <input type="hidden" value="${ticketInformation.adults}" id="adults" name="adults"/>
                                            <input type="hidden" value="${ticketInformation.children}" id="children" name="children"/>
                                            <input type="hidden" value="${ticketInformation.infant}" id="infants" name="infants"/>
                                            <br/>
                                                ${f.businessPrice} <span class="unit">$</span>
                                        </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
            <br><br>
            <c:if test="${returnStatus == 'true'}">
                <div class="card">
                    <div class="card-body px-0">
                        <div class="col">
                            <div class="row border-bottom">
                                <div class="col pb-3">
                                    <p style="font-size: 14px;line-height: 17px;font-weight: 400;">Selected Return Flight</p>
                                    <strong>${ticketInformation.destination}</strong>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                                    </svg>
                                    <strong>${ticketInformation.origin}</strong>
                                </div>
                            </div>

                            <div class="row" id="return-container">
                                <table class="table table-borderless" id="return-table">
                                    <tbody>
                                    <c:forEach var="rf" items="${returnFlights}">
                                        <tr>
                                            <td style="padding: 0 0 0 30px">
                                                <img src="${rf.aircraft.logo_airline}" alt="" height="75px" width="75px">
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.aircraft.model}</p>
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.aircraft.brand.brandName}</p>
                                            </td>
                                            <td>
                                                <strong>${rf.departureTime.toLocalTime()}</strong>
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.departureTime.toLocalDate()}</p>
                                                <br>
                                                <strong>${rf.arrivalTime.toLocalTime()}</strong>
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.arrivalTime.toLocalDate()}</p>
                                            </td>
                                            <td>
                                                <strong> ${rf.flightRoute.originAirport.city.cityName}</strong>
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.flightRoute.originAirport.airportName}</p>
                                                <br>
                                                <strong>${rf.flightRoute.destinationAirport.city.cityName}</strong>
                                                <p style="font-size: 12px;line-height: 14px;font-weight: 400;color: #9a9a9d">${rf.flightRoute.destinationAirport.airportName}</p>
                                            </td>
                                            <c:if test="${ticketInformation.travelClass == 'all' || ticketInformation.travelClass == 'economy'}">
                                            <td align="center">
                                                <strong>Economy</strong><br><br>
                                                <input type="radio" value=" ${rf.economyPrice}" name="returnPrice"/>
                                                <input type="hidden" value="${rf.flightId}" id="flightId" name="flightId"/>
                                                <input type="hidden" value="economy" id="travelClass" name="travelClass"/>
                                                <input type="hidden" value="${rf.departureTime.toLocalTime()}" id="departureTime" name="departureTime"/>
                                                <input type="hidden" value="${ticketInformation.adults}" id="adults" name="adults"/>
                                                <input type="hidden" value="${ticketInformation.children}" id="children" name="children"/>
                                                <input type="hidden" value="${ticketInformation.infant}" id="infants" name="infants"/>
                                                <br/>
                                                    ${rf.economyPrice} <span class="unit">$</span>
                                            </td>
                                            </c:if>
                                            <c:if test="${ticketInformation.travelClass == 'all' || ticketInformation.travelClass == 'business'}">
                                            <td align="center">
                                                <strong>Business</strong><br><br>
                                                <input type="radio" value=" ${rf.businessPrice}" name="returnPrice"/>
                                                <input type="hidden" value="${rf.flightId}" id="flightId" name="flightId"/>
                                                <input type="hidden" value="business" id="travelClass" name="travelClass"/>
                                                <input type="hidden" value="${rf.departureTime.toLocalTime()}" id="departureTime"  name="departureTime"/>
                                                <input type="hidden" value="${ticketInformation.adults}" id="adults" name="adults"/>
                                                <input type="hidden" value="${ticketInformation.children}" id="children" name="children"/>
                                                <input type="hidden" value="${ticketInformation.infant}" id="infants" name="infants"/>
                                                <br/>
                                                    ${rf.businessPrice} <span class="unit">$</span>
                                            </td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="col-sm-4 " id="flightInformation">
            <div class="card">
                <div class="card-body px-0">
                    <div class="col">
                        <div class="row border-bottom" style="padding: 0 0 0 20px">
                            <strong class="mb-1">Flight Information</strong>
                            <p style="font-size: 14px;line-height: 17px;font-weight: 500;color: #9a9a9d">Price is showed in dollar unit.</p>
                        </div>
                        <div class="row border-bottom" style="padding: 20px 0 0 5px">
                            <div class="col">
                                <input type="hidden" id="tripType" name="tripType" value="${ticketInformation.tripType}">
                                <div id="departure-flight-information">
                                    <p><strong>Departure Trip</strong></p>
                                    <p><small>Departure : </small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">${ticketInformation.destination}</strong></p>
                                    <p><small>Arrival : </small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">${ticketInformation.origin}</strong></p>
                                    <p><small>(Per An Adult)</small></p>
                                    <p><small></small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b" name="departurePrice" id="departure-price-display-item"></strong></p>
                                </div>
                            </div>
                            <c:if test="${ticketInformation.tripType == 'roundTrip'}">
                                <div class="col">
                                    <p><strong>Return Trip</strong></p>
                                    <p><small>Departure : </small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">${ticketInformation.destination}</strong></p>
                                    <p><small>Arrival : </small><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">${ticketInformation.origin}</strong></p>
                                    <p><small>(Per An Adult)</small></p>
                                    <p><strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b" name="returnPrice" id="return-price-display-item"></strong></p>
                                </div>
                            </c:if>
                        </div>
                        <div class="row" style="padding: 20px 0px 0 5px" id="passengerNumbers">
                            <div class="col">
                                <strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">Adults: </strong>
                                <small>${ticketInformation.adults}</small>
                                <input type="hidden" value="${ticketInformation.adults}" name="adults"/>
                            </div>
                            <div class="col">
                                <strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">Children: </strong>
                                <small>${ticketInformation.children}</small>
                                <input type="hidden" value="${ticketInformation.children}" name="children"/>
                            </div>
                            <div class="col">
                                <strong style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b">Infants: </strong>
                                <small>${ticketInformation.infant}</small>
                                <input type="hidden" value="${ticketInformation.infant}" name="infants"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <button id="continue" class="btn btn-danger w-100 py-2" onclick="sendJson()" disabled>Continue</button>
        </div>
    </div>
</div>
<br><br>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
