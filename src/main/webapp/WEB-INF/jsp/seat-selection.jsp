<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Seat Charts</title>
    <%--Javascript External Link is placed here--%>
    <%--<jsp:include page="administration/_head.jsp"/>--%>
    <jsp:include page="css.jsp"/>
    <style>
        .list-group a:hover{
            text-decoration: none;
            font-weight: 700;
        }
        .list-group a{
            text-decoration: none;
            color: #333333;
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
            font-size: 15px;
            line-height: 17px;
            padding: 10px 15px;
        }
        .login-btn:hover{
            background-color: #f2f2f2;
            border-color: transparent;
            color: #9a9a9d;
        }
        .carousel-indicators li {
            width: 20px;
            height: 20px;
            border-radius: 100%;
        }
        .carousel-container{
            background: linear-gradient(180deg,transparent 79.81%,rgba(0,0,0,.3)),linear-gradient(256.23deg,#cf3c3f -1.09%,#f48c83 46.25%,#d82f33 101.02%);
        }
        .navbar-toggler-icon {
            color: rgba(0,0,0,.5);
            border-color: rgba(0,0,0,.1);
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255,102,203, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 8h24M4 16h24M4 24h24'/%3E%3C/svg%3E");
        }
    </style>
    <script>
        let flightData;
        let currentPassengerSelected;
        let departureSeatPossession = new Array();
        let returnSeatPossession = new Array();
        $(document).ready(function ()
        {
            let previousObject = sessionStorage.getItem(sessionId.value);
            flightData = JSON.parse(previousObject);
            console.log(flightData);
            //Auto fill id and value for departure seats
            //Number of Rows and number of columns per row
            let numberOfColumns = $('#departure-table .departure-seat-container td').length;
            console.log(numberOfColumns);
            let table = document.getElementById("departure-table");
            let tr = table.getElementsByTagName("tr");
            let td;
            console.log(tr.length);
            console.log(numberOfColumns / (tr.length - 1));

            let alphabet = new Array("A", "B", "C", "", "D", "E", "F");
            /*console.log(alphabet[1]);*/
            //Get Seats' Status for departure Trip
            $.ajax({
                url: "seatStatus/" + flightData.departureTrip.departureFlightId + "/" + flightData.departureTrip.travelClass,
                dataType: "json",
                success: function (result) {
                    console.log(result);
                    /*console.log(result["A1"]);*/
                    for (let i = 1; i < tr.length; i++) {
                        for (let j = 0; j < (numberOfColumns / (tr.length - 1)); j++) {
                            td = tr[i].getElementsByTagName("td")[j];
                            td.setAttribute("id", "departure-seatCode-" + alphabet[j] + i);
                            if (j != 3) {
                                /*td.getElementsByTagName("span").namedItem("departure-seat-item").setAttribute("onclick", "getDepartureSeatCode('" + "departure-seatCode-" + alphabet[j] + i + "')");*/
                                $('#departure-seatCode-' + alphabet[j] + i + ' span button').attr("onclick", "getDepartureSeatCode('" + "departure-seatCode-" + alphabet[j] + i + "')");
                                //Check the seat state
                                let currentSeat = alphabet[j] + i;
                                /*console.log("Current Seat Code : " + currentSeat);*/
                                let seatState = result[currentSeat];
                                /*console.log(seatState);*/
                                if (seatState == false) {
                                    $('#departure-seatCode-' + alphabet[j] + i + ' span button').attr("disabled", "true");
                                } else if (seatState == undefined) {
                                    /*$('#departure-seatCode-' + alphabet[j] + i).attr("hidden","true");*/
                                    $('#departure-seatCode-' + alphabet[j] + i + ' span button').attr("disabled", "true");
                                }
                                //Print text here
                                if (seatState != undefined) {
                                    td.append("" + alphabet[j] + i);
                                }
                                let key = "departure-seatCode-" + alphabet[j] + i;
                                seatBookedData.push({key: key, value: true});
                            }
                            if (j == 3) {
                                td.innerHTML = "" + i;
                            }
                        }
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                }
            })

            /*td.getElementsByTagName("button").namedItem("seat-item").setAttribute("onclick", "getSeatCode('" + "seatCode-" + alphabet[j] + i + "')");*/

            console.log(seatBookedData);


            if (flightData.ticketInformation.tripType == "roundTrip") {
                //Auto fill id and value for return seats
                //Number of Rows and number of columns per row
                let numberOfColumns2 = $('#return-table .return-seat-container td').length;
                console.log(numberOfColumns2);
                let table2 = document.getElementById("return-table");
                let tr2 = table2.getElementsByTagName("tr");
                let td2;
                console.log(tr2.length);
                console.log(numberOfColumns2 / (tr2.length - 1));

                //Get Seats' Status for return Trip
                $.ajax({
                    url: "seatStatus/" + flightData.returnTrip.returnFlightId+ "/" + flightData.returnTrip.travelClass,
                    dataType: "json",
                    success: function (result) {
                        console.log(result);
                        for (let i = 1; i < tr2.length; i++) {
                            for (let j = 0; j < (numberOfColumns2 / (tr2.length - 1)); j++) {
                                td2 = tr2[i].getElementsByTagName("td")[j];
                                td2.setAttribute("id", "return-seatCode-" + alphabet[j] + i);
                                if (j != 3) {
                                    /*td2.getElementsByTagName("span").namedItem("return-seat-item").setAttribute("onclick", "getReturnSeatCode('" + "return-seatCode-" + alphabet[j] + i + "')");
                                    td2.append("" + alphabet[j] + i);
                                    let key = "return-seatCode-" + alphabet[j] + i;
                                    seatBookedData.push({key: key, value: true});*/

                                    /*td.getElementsByTagName("span").namedItem("departure-seat-item").setAttribute("onclick", "getDepartureSeatCode('" + "departure-seatCode-" + alphabet[j] + i + "')");*/
                                    $('#return-seatCode-' + alphabet[j] + i + ' span button').attr("onclick", "getReturnSeatCode('" + "return-seatCode-" + alphabet[j] + i + "')");
                                    //Check the seat state
                                    let currentSeat = alphabet[j] + i;
                                    /*console.log("Current Seat Code : " + currentSeat);*/
                                    let seatState = result[currentSeat];
                                    /*console.log(seatState);*/
                                    if (seatState == false) {
                                        $('#return-seatCode-' + alphabet[j] + i + ' span button').attr("disabled", "true");
                                    } else if (seatState == undefined) {
                                        /*$('#return-seatCode-' + alphabet[j] + i).attr("hidden","true");*/
                                        $('#return-seatCode-' + alphabet[j] + i + ' span button').attr("disabled", "true");
                                        /*$('#return-seatCode-' + alphabet[j] + i).attr("disabled","true");*/
                                    }
                                    //Print text here
                                    if (seatState != undefined) {
                                        td2.append("" + alphabet[j] + i);
                                    }
                                    let key = "return-seatCode-" + alphabet[j] + i;
                                    seatBookedData.push({key: key, value: true});
                                }
                                if (j == 3) {
                                    td2.innerHTML = "" + i;
                                }
                            }
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                })

                let returnNames = document.getElementById("returnNames").getElementsByTagName("li");
                console.log(returnNames.length);
                for (let i = 1; i <= returnNames.length; i++) {
                    $('#returnNames li').eq(i - 1).attr("id", "returnPassenger-" + i);
                    $('#returnNames li').eq(i - 1).attr("onclick", "getSeatSelectionTurn('returnPassenger-" + i + "')");
                }


            }

            /*console.log(seatBookedData);*/
            //Generate Id for passenger Turn

            let departureNames = document.getElementById("departureNames").getElementsByTagName("li");
            console.log(departureNames.length);
            for (let i = 1; i <= departureNames.length; i++) {
                $('#departureNames li').eq(i - 1).attr("id", "departurePassenger-" + i);
                $('#departureNames li').eq(i - 1).attr("onclick", "getSeatSelectionTurn('departurePassenger-" + i + "')");
            }

        })
        let seatBookedData = [];

        function getDepartureSeatCode(seatCode) {
            if (currentPassengerSelected != null ) {
                if (!(currentPassengerSelected.indexOf("return") > -1)){
                    console.log("clicked!!: " + seatCode);

                    console.log(currentPassengerSelected);
                    let previousSeat = $('#' + currentPassengerSelected + ' input[name=departureSeatCode]').val();
                    console.log(previousSeat);

                    $('#' + currentPassengerSelected + ' input[name=departureSeatCode]').val(seatCode);
                    if (previousSeat != "") {
                        $('#' + currentPassengerSelected + ' input[name=departureSeatCode]').attr("disabled", "true");
                        $('#' + currentPassengerSelected + ' input[name=departureSeatCode]').removeAttr("disabled");
                    }

                    let seatPossession = {
                        seatCode: "",
                        passengerName: ""
                    };
                    let count = 0;
                    for (let m = 0; m < departureSeatPossession.length; m++) {
                        if (departureSeatPossession[m].passengerName == $('#' + currentPassengerSelected + ' input[name=departurePassengerName]').val()) {
                            count++;
                        }
                    }

                    if (count == 0) {
                        departureSeatPossession.push({
                            seatCode: $('#' + currentPassengerSelected + ' input[name=departureSeatCode]').val(),
                            passengerName: $('#' + currentPassengerSelected + ' input[name=departurePassengerName]').val()
                        });
                    } else {
                        for (let m = 0; m < departureSeatPossession.length; m++) {
                            if (departureSeatPossession[m].passengerName == $('#' + currentPassengerSelected + ' input[name=departurePassengerName]').val()) {
                                departureSeatPossession[m].passengerName = $('#' + currentPassengerSelected + ' input[name=departurePassengerName]').val();
                            }
                        }

                    }
                }
            }
        }
        function getReturnSeatCode(seatCode) {
            if (currentPassengerSelected != null ) {
                if (!(currentPassengerSelected.indexOf("depart") > -1)){
                    console.log("return !!! clicked!!: " + seatCode);
                    console.log(currentPassengerSelected);
                    let x = $('#' + currentPassengerSelected + ' input[name=returnSeatCode]').val();
                    console.log(x);

                    $('#' + currentPassengerSelected + ' input[name=returnSeatCode]').val(seatCode);
                    /*let returnSeatPossession = {
                        seatCode: "",
                        passengerName: ""
                    };*/
                    let count = 0;
                    for (let m = 0; m < returnSeatPossession.length; m++) {
                        if (returnSeatPossession[m].passengerName == $('#' + currentPassengerSelected + ' input[name=returnPassengerName]').val()) {
                            count++;
                        }
                    }

                    if (count == 0) {
                        returnSeatPossession.push({
                            seatCode: $('#' + currentPassengerSelected + ' input[name=returnSeatCode]').val(),
                            passengerName: $('#' + currentPassengerSelected + ' input[name=returnPassengerName]').val()
                        });
                    } else {
                        for (let m = 0; m < returnSeatPossession.length; m++) {
                            if (returnSeatPossession[m].passengerName == $('#' + currentPassengerSelected + ' input[name=returnPassengerName]').val()) {
                                returnSeatPossession[m].passengerName = $('#' + currentPassengerSelected + ' input[name=returnPassengerName]').val();
                            }
                        }
                    }
                }
            }
        }

        function getSeatSelectionTurn(passengerId) {
            currentPassengerSelected = passengerId;
        }
    </script>
    <script>
        function sendPassengerDataWithSeatCodes() {
            /*let isFilledDeparture, isFilledReturn, isFilled;
            for (let i = 0; i < departureSeatPossession; i++) {
                if (departureSeatPossession[i].seatCode == null) {
                    isFilledDeparture = false;
                    break;
                } else {
                    isFilledDeparture = true;
                }
            }
            if (flightData.ticketInformation.tripType == "roundTrip") {
                for (let i = 0; i < returnSeatPossession; i++) {
                    if (returnSeatPossession[i].seatCode == null) {
                        isFilledReturn = false;
                        break;
                    } else {
                        isFilledReturn = true;
                    }
                }
            }
            if (flightData.ticketInformation.tripType == "roundTrip") {
                if (isFilledDeparture == true && isFilledReturn == true) {
                    isFilled = true;
                } else {
                    isFilled = false;
                }
            } else {
                if (isFilledDeparture == true) {
                    isFilled = true;
                } else {
                    isFilled = false;
                }
            }*/

            /*if (isFilled == true) {*/
                flightData.departureTrip.departureSeatPossessions = departureSeatPossession;
                flightData.returnTrip.returnSeatPossessions = returnSeatPossession;
                console.log("Clicked!!!");
                console.log(flightData);
                sessionStorage.setItem(sessionId.value, JSON.stringify(flightData));

                $.ajax({
                    type: "POST",
                    url: "flightPickerHandler",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify(flightData),
                    success: function (data, textStatus, jqXHR) {
                        console.log("send data to backend successfully: ");
                        console.log(data);
                        location.href ="paymentMethod";
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                        console.log("fail");
                    }
                });
            /*}*/

        }
    </script>
</head>
<body style="font-family: 'Poppins', sans-serif;background-color: #f7f7f7">
<nav class="navbar navbar-expand-md bg-white border-bottom" style="height: 75px;padding: 0 10vw 0 10vw;">
    <a class="navbar-brand" href="#" style="font-size: 40px;font-weight: 600;color: #f39c12">
        Airbook
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
<input type="hidden" id="sessionId" value="${sessionId}"><br><br>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <ul class="nav nav-pills list-group" role="tablist">
                <div class="list-group">
                    <a href="#departure" data-toggle="pill" class="list-group-item">Departure Trip</a>
                    <c:if test="${flightReturn != null}">
                        <a href="#return" data-toggle="pill" class="list-group-item">Return Trip</a>
                    </c:if>
                </div>
            </ul>
            <br>
            <button id="continue" class="btn btn-danger w-100" onclick="sendPassengerDataWithSeatCodes()">Continue</button>
        </div>

        <div class="col-sm-9">
            <div class="tab-content">
                <div id="departure" class="container tab-pane active">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <%--Passenger's Seat Record:--%>
                                <div class="col-sm-5">
                                    <h5 style="color: #59595b">Click your name to start selecting a seat.</h5>
                                    <ul style="list-style: none" id="departureNames">
                                        <c:forEach var="name" items="${passengerNames}">
                                            <li class="b-1 my-1">
                                                <button class="mb-1 btn btn-outline-danger" >${name}</button>
                                                <input type="hidden" value="${name}" name="departurePassengerName"/>
                                                <input type="text" class="form-control" readonly value="" name="departureSeatCode"/>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="col-sm-7">
                                    <h1 style="font-weight: 600;font-size: 35px;color: #f39c12" class="text-center">
                                        Departure Trip</h1>
                                    <div class="table-responsive" style="height: 80vh ;overflow-y: scroll">
                                        <table class="table table-borderless" id="departure-table">
                                            <thead>
                                            <tr>
                                                <th class="text-center px-0">A</th>
                                                <th class="text-center px-0">B</th>
                                                <th class="text-center px-0">C</th>
                                                <th class="text-center px-0"></th>
                                                <th class="text-center px-0">D</th>
                                                <th class="text-center px-0">E</th>
                                                <th class="text-center px-0">F</th>
                                            </tr>
                                            </thead>
                                            <tbody class="departure-seat-container">
                                            <c:choose>
                                                <c:when test="${flightPicker.departureTrip.travelClass == 'economy'}">
                                                    <c:forEach begin="1" end="${flightDeparture.aircraft.total_economy/6+1}">
                                                        <tr class="seat-row">
                                                            <c:forEach begin="1" end="3">
                                                                <td align="center" style="padding: 0.0%">
                                                                    <span class="btn btn-sm btn-outline departure-seat-item" name="departure-seat-item">
                                                                        <button class="btn btn-info" style="padding: 0; border: none; background: none;" name="departure-seat-button">
                                                                            <img src="/resources/image/logo/s-couch.png" width="100%"/>
                                                                        </button>
                                                                    </span>
                                                                </td>
                                                            </c:forEach>
                                                            <td width="12%" style="text-align: center"></td>
                                                            <c:forEach begin="1" end="3">
                                                                <td align="center" style="padding: 0.0%">
                                                                    <span class="btn btn-sm btn-outline departure-seat-item" name="departure-seat-item">
                                                                        <button class="btn btn-info" style="padding: 0; border: none; background: none; ">
                                                                            <img src="/resources/image/logo/s-couch.png" width="100%">
                                                                        </button>
                                                                    </span>
                                                                </td>
                                                            </c:forEach>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${flightPicker.departureTrip.travelClass == 'business'}">
                                                    <c:forEach begin="1" end="${flightDeparture.aircraft.total_business/6+1}">
                                                        <tr class="seat-row">
                                                            <c:forEach begin="1" end="3">
                                                                <td align="center" style="padding: 0.0%">
                                                                    <span class="btn btn-sm btn-outline departure-seat-item" name="departure-seat-item">
                                                                        <button class="btn btn-info" style="padding: 0; border: none; background: none;" name="departure-seat-button">
                                                                            <img src="/resources/image/logo/s-couch.png" width="100%"/>
                                                                        </button>
                                                                     </span>
                                                                </td>
                                                            </c:forEach>
                                                            <td width="12%" style="text-align: center"></td>
                                                            <c:forEach begin="1" end="3">
                                                                <td align="center" style="padding: 0.0%">
                                                                    <span class="btn btn-sm btn-outline departure-seat-item" name="departure-seat-item">
                                                                        <button class="btn btn-info" style="padding: 0; border: none; background: none; ">
                                                                            <img src="/resources/image/logo/s-couch.png" width="100%">
                                                                        </button>
                                                                    </span>
                                                                </td>
                                                            </c:forEach>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <c:if test="${flightReturn != null}">

                    <div id="return" class="container tab-pane fade">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <%--Passenger's Seat Record:--%>
                                    <div class="col-sm-5">
                                        <h5 style="color: #59595b">Click your name to start selecting a seat.</h5>
                                        <ul style="list-style: none" id="returnNames">
                                            <c:forEach var="name" items="${passengerNames}">
                                                <li class="b-1 my-1">
                                                    <button class="mb-1 btn btn-outline-danger">${name}</button>
                                                    <input type="hidden" value="${name}" name="returnPassengerName"/>
                                                    <br/>
                                                    <input type="text" class="form-control" readonly value="" name="returnSeatCode"/>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="col-sm-7">
                                        <h1 style="font-weight: 600;font-size: 35px;color: #f39c12" class="text-center">
                                            Return Trip</h1>
                                        <div class="table-responsive" style="height: 80vh;overflow-y: scroll">
                                            <table class="table table-borderless" id="return-table">
                                                <thead>
                                                <tr>
                                                    <th class="text-center px-0">A</th>
                                                    <th class="text-center px-0">B</th>
                                                    <th class="text-center px-0">C</th>
                                                    <th class="text-center px-0"></th>
                                                    <th class="text-center px-0">D</th>
                                                    <th class="text-center px-0">E</th>
                                                    <th class="text-center px-0">F</th>
                                                </tr>
                                                </thead>
                                                <tbody class="return-seat-container">
                                                <c:choose>
                                                    <c:when test="${flightPicker.departureTrip.travelClass == 'economy'}">
                                                        <c:forEach begin="1" end="${flightReturn.aircraft.total_economy/6+1}">
                                                            <tr class="seat-row">
                                                                <c:forEach begin="1" end="3">
                                                                    <td align="center" style="padding: 0.0%">
                                                                <span class="btn btn-sm btn-outline return-seat-item" name="return-seat-item">
                                                                    <button class="btn btn-info" style="padding: 0; border: none; background: none; " name="return-seat-button">
                                                                        <img src="/resources/image/logo/s-couch.png" width="100%"/>
                                                                    </button>
                                                                </span>
                                                                    </td>
                                                                </c:forEach>
                                                                <td width="12%" style="text-align: center"></td>
                                                                <c:forEach begin="1" end="3">
                                                                    <td align="center" style="padding: 0.0%">
                                                                        <span class="btn btn-sm btn-outline return-seat-item" name="return-seat-item">
                                                                            <button class="btn btn-info"  style="padding: 0; border: none; background: none;">
                                                                                <img src="/resources/image/logo/s-couch.png" width="100%"/>
                                                                            </button>
                                                                        </span>
                                                                    </td>
                                                                </c:forEach>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:when test="${flightPicker.departureTrip.travelClass == 'business'}">
                                                        <c:forEach begin="1" end="${flightReturn.aircraft.total_business/6+1}">
                                                            <tr class="seat-row">
                                                                <c:forEach begin="1" end="3">
                                                                    <td align="center" style="padding: 0.0%">
                                                                        <span class="btn btn-sm btn-outline return-seat-item" name="return-seat-item">
                                                                            <button class="btn btn-info" style="padding: 0; border: none; background: none; " name="return-seat-button">
                                                                                <img src="/resources/image/logo/s-couch.png" width="100%"/>
                                                                            </button>
                                                                        </span>
                                                                    </td>
                                                                </c:forEach>
                                                                <td width="12%" style="text-align: center"></td>
                                                                <c:forEach begin="1" end="3">
                                                                    <td align="center" style="padding: 0.0%">
                                                                        <span class="btn btn-sm btn-outline return-seat-item" name="return-seat-item">
                                                                            <button class="btn btn-info"  style="padding: 0; border: none; background: none;">
                                                                                <img src="/resources/image/logo/s-couch.png" width="100%"/>
                                                                            </button>
                                                                        </span>
                                                                    </td>
                                                                </c:forEach>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
<%--        <div class="container">--%>
<%--            <button>Back</button>--%>
<%--            <button id="continue" onclick="sendPassengerDataWithSeatCodes()">Continue</button>--%>
<%--        <button id="continue"><a onclick="sendPassengerDataWithSeatCodes()" href="paymentMethod">Continue</a></button>--%>
<%--        </div>--%>
    </div>
</div>

<br><br><br>
</body>
</html>


