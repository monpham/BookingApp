<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/26/2020
  Time: 7:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>AirBook</title>
    <jsp:include page="css.jsp"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        a.active{
            background-color: #f7f7f7;
            font-weight: bold;
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
        .city-input-label{
            font-size: 14px;
            line-height: 17px;
            font-weight: 700;
        }
        .airport-input{
            font-size: 12px;
            line-height: 14px;
            font-weight: 400;
        }
        input[type='text'],input[type='date'],input[type='number']{
            font-weight: 700;
            font-size: 14px;
            line-height: 17px;
            color: #59595b;
        }
        .card:hover{
            box-shadow: 0 4px 8px rgba(0,0,0,.18), 0 0 4px rgba(0,0,0,.15);
        }
    </style>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        $(function () {
            $('[data-toggle="popover"]').popover()
        })
        $(document).click( function(){
            $('.dropdown-menu').hide();
        });

    </script>
<%--    for flight search engine--%>
    <script>
        function changeTripTypeInput(tripType) {
            if (tripType == "roundTrip") {
                $('#tripType').val('roundTrip');
                $('#return-date-container').show();
            } else {
                $('#tripType').val('oneWay');
                $('#return-date-container').hide();
            }
        }
        function changeTravelClassType(travelClass) {
            if (travelClass == "all") {
                $('#travelClass').val("all");
            } else if (travelClass == "business") {
                $('#travelClass').val("business");
            } else {
                $('#travelClass').val("economy");
            }

        }
    </script>

    <script>
        let sessionId;

        function saveFlightJsonData() {
            let adults, children, infants;
            let origin, destination, departureDate, returnDate, tripType;
            origin = $('input#origin').val();
            /*console.log(origin);*/
            destination = $('input#destination').val();
            console.log(destination);
            departureDate = $('input#departureDate').val();
            /*console.log(departureDate);*/
            returnDate = $('input#returnDate').val();
            console.log(returnDate);
            adults = parseInt($('#quantity-adults').val());
            children = parseInt($('#quantity-children').val());
            infants = parseInt($('#quantity-infants').val());
            tripType = $('#tripType').val();

            flightPicker = {
                ticketInformation: {
                    origin: origin,
                    destination: destination,
                    tripType: tripType,
                    departureDate: departureDate,
                    returnDate: returnDate,
                    adults: adults,
                    children: children,
                    infants: infants
                },
                departureTrip: {},
                returnTrip: {},
                passengerInformation: [],
                totalPaymentAmount: 0,
                contactInformation: {}
            };
            sessionId = $('#sessionId').val();
            sessionStorage.setItem(sessionId, JSON.stringify(flightPicker));
            console.log(flightPicker);
            console.log(JSON.stringify(flightPicker));
        }
    </script>
</head>
<input type="hidden" id="sessionId" value="${sessionId}"/>
<body style="min-height: 1000px;font-family: 'Poppins', sans-serif;background-color: #ffffff">
<%--fixed navbar--%>
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
<%--end nav--%>
<%--slider--%>
<div class="container-fluid px-0 carousel-container">
    <div id="myCarousel" class="carousel slide" style="width: 50%;margin-left: 22.5%;padding: 5% 0 5% 0" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner shadow-sm">
            <div class="carousel-item active">
                <img src="https://cdn.airpaz.com/banner/find-cheap-flight-tickets-on-Airpaz.com-NL-3.jpg" class="img-fluid rounded-lg">
            </div>
            <div class="carousel-item">
                <img src="https://cdn.airpaz.com/banner/Bamboo-Airways-NL-8797.jpg" class="img-fluid rounded-lg">
            </div>
            <div class="carousel-item">
                <img src="https://cdn.airpaz.com/banner/Airpaz-booking-hotel-online-hdesktop1.jpg" class="img-fluid rounded-lg">
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
<%--end slider--%>
<%--Search flight--%>
<form:form action="ticketSearch" method="post" modelAttribute="ticketInformation">
<div class="container-fluid px-0 bg-white shadow-sm" style="height: 150px">
<%--    Choose flight style--%>
    <div class="row" style="height: 42%;margin: 0 9% 0 9%">
        <div class="custom-control custom-radio pl-0" style="margin: 1rem 0 0 0">
            <form:input path="tripType" id="tripType" name="type" value="roundTrip" type="hidden"/>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="customRadio2" name="example" value="customEx" checked onclick="changeTripTypeInput('roundTrip')">
                <label class="custom-control-label" for="customRadio2">Round Trip</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="customRadio" name="example" value="customEx"  onclick="changeTripTypeInput('OneWay')">
                <label class="custom-control-label" for="customRadio">One way</label>
            </div>
        </div>
    </div>
<%--    end--%>
<%--    Enter infor flight--%>
    <div class="row d-flex border rounded-lg" style="height: 47%;margin: 0 9% 0 9%">
        <div class="form-group col-sm-2 border-right h-100">
            <label><small class="form-text text-muted">From</small></label>
            <form:input path="origin" id="origin" type="text" class="form-control form-control-sm border-0 "  placeholder="Select Departure City"/>
            <div  style="width: 259%;height: 440%;overflow-y: auto;user-select: none;">

<%--                end departure--%>
            </div>
        </div>
        <div class="form-group col-sm-2 border-right h-100">
            <label><small class="form-text text-muted">To</small></label>
            <form:input path="destination" id="destination" type="text" class="form-control form-control-sm border-0 "  placeholder="Select Destination City"/>
            <div class="dropdown-menu keep-open p-0" style="width: 259%;height: 440%;overflow-y: auto;user-select: none;">
<%--                destination city--%>

<%--                end destination city--%>
            </div>
        </div>
<%--        Departure in One way--%>
<%--        end departure date one way--%>
        <%--        Date departure and return in Round Trip--%>
        <div class="form-group col-sm-2 border-right h-100">
            <label><small class="form-text text-muted">Departure Date</small></label>
            <form:input path="departureDate" id="departureDate" type="date" class="form-control form-control-sm border-0"/>
        </div>
        <div class="form-group col-sm-2 border-right h-100" id="return-date-container">
            <label><small class="form-text text-muted">Return Date</small></label>
            <form:input path="returnDate" id="returnDate" type="date" class="form-control form-control-sm border-0"/>
        </div>
        <%-- end departure and return--%>
        <%-- Travel Class--%>
        <div class="form-group col-sm-1 border-right h-100">
            <label><small class="form-text text-muted">Class</small></label>
            <form:input path="travelClass" value="all" type="text" id="travelClass" class="form-control form-control-sm border-0 bg-white dropdown-toggle" data-toggle="dropdown" placeholder="All" readonly="true"/>
            <div class="dropdown-menu keep-open p-0" style="width: 120px;user-select: none;">
                <div class="dropdown-item pt-2" style="background-color: #f7f7f7">
                    <div class="d-flex flex-column" style="width: 100%;height: 48px">
                        <label class="font-weight-bold" style="font-size: 18px;line-height: 22px;font-weight: 700;color: #59595b">Travel Class</label>
                    </div>
                </div>
                <a class="dropdown-item p-0" onclick="changeTravelClassType('all')">
                    <div class="d-flex flex-column align-items-center" id="travel-class-all" style="width: 100%;height: 48px">
                        <div class="p-2">All</div>
                    </div>
                </a>
                <a class="dropdown-item p-0" onclick="changeTravelClassType('economy')">
                    <div class="d-flex flex-column align-items-center" id="travel-class-economy" style="width: 100%;height: 48px">
                        <div class="p-2">Economy</div>
                    </div>
                </a>
                <a class="dropdown-item p-0" onclick="changeTravelClassType('business')">
                    <div class="d-flex flex-column align-items-center" id="travel-class-business" style="width: 100%;height: 48px">
                        <div class="p-2">Business</div>
                    </div>
                </a>
            </div>
        </div>
<%--                end travel class--%>
<%--                Passenger--%>
        <div class="form-group col-sm-2 border-right h-100">
            <label><small class="form-text text-muted">Passenger</small></label>
            <input type="text" id="quantity-passengers" class="form-control form-control-sm border-0 bg-white dropdown-toggle" data-toggle="dropdown" value="1 Passenger" readonly>
            <div class="dropdown-menu keep-open p-0" style="width: 400px;user-select: none;">
                <div class="list-group-item pt-2" style="background-color: #f7f7f7">
                    <div class="d-flex flex-column" style="width: 100%;height: 45px">
                        <label style="font-size: 18px;line-height: 22px;font-weight: 700;color: #59595b">Passengers</label>
                    </div>
                </div>
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center p-1 mt-2" style="width: 100%;height: 51px">
                        <div class="col-sm-7">
                            <label style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b" class="pt-2">Adults</label>
                            <p class="text-muted" style="font-size: 12px;line-height: 14px;font-weight: 400;">Age 12+</p>
                        </div>
                        <div class="col-sm-5">
                            <div class="d-flex flex-row">
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 minus-adults disabled" style="height: 28px"><i class="fa fa-minus"></i></button>
                                <form:input path="adults"  type="text" id="quantity-adults" class="form-control mx-1 text-center bg-white" style="height: 28px" value="1"/>
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 plus-adults" style="height: 28px"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-0">
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center p-1 mt-2" style="width: 100%;height: 51px">
                        <div class="col-sm-7">
                            <label style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b" class="pt-2">Children</label>
                            <p class="text-muted" style="font-size: 12px;line-height: 14px;font-weight: 400;">Age 2-11</p>
                        </div>
                        <div class="col-sm-5">
                            <div class="d-flex flex-row">
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 minus-children disabled" style="height: 28px"><i class="fa fa-minus"></i></button>
                                <form:input path="children" type="text" id="quantity-children" class="form-control mx-1 text-center bg-white" style="height: 28px;" value="0" readonly="true" />
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 plus-children" style="height: 28px"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-0">
                <div class="dropdown-item p-0">
                    <div class="d-flex flex-row align-items-center p-1 mt-2" style="width: 100%;height: 51px">
                        <div class="col-sm-7">
                            <label style="font-size: 14px;line-height: 17px;font-weight: 700;color: #59595b" class="pt-2">Infants</label>
                            <p class="text-muted" style="font-size: 12px;line-height: 14px;font-weight: 400;"><2 years</p>
                        </div>
                        <div class="col-sm-5">
                            <div class="d-flex flex-row">
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 minus-infants disabled" style="height: 28px"><i class="fa fa-minus"></i></button>
                                <form:input path="infant" type="text" id="quantity-infants" class="form-control mx-1 text-center bg-white" style="height: 28px" value="0"  readonly="true"/>
                                <button type="button" class="btn btn-sm btn-outline-danger py-0 plus-infants" style="height: 28px"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--        end passenger--%>
<%--        Button Search--%>
        <div class="form-group col-sm-1 rounded-right h-100 p-0">
            <button type="submit" class="btn btn-danger rounded-0 border-0 h-100 w-100" placeholder="Select Return City" onclick="saveFlightJsonData()">
                <i class="fa fa-search fa-2x"></i>
            </button>
        </div>
<%--        end button search--%>
    </div>
<%--    end enter infor flight--%>
</div>
</form:form>
<%--end search flight--%>
<br><br>
<div class="container mt-3">
    <div class="row">
        <h5 style="color: #59595b"><strong>Recommended for you</strong></h5>
    </div>
    <br>
    <div class="row">
        <c:forEach var="flight" items="${flightListRecommend}">
            <div class="col-sm-4 rounded-lg" style="margin-bottom: 50px">
                <div class="card">
                    <div class="card-body">
                        <div class="row px-3">
                            <div class="col">
                                <p>From <strong>${flight.flightRoute.originAirport.city.cityName}</strong><br>&#9992; <strong>${flight.flightRoute.destinationAirport.city.cityName}</strong></p>
                                <hr>
                                <small>Start from</small>
                                <h5><strong>$ ${flight.economyPrice}</strong></h5>
                            </div>
                        </div>
                        <div class="row px-3 pt-3">
                            <a href="#" class="btn btn-lg w-100 my-sm-0 shadow-sm login-btn">See more</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<br>
<div class="container flex-column">
    <div class="row">
        <div class="col">
            <h5 style="color: #59595b"><strong>Airbook Airline Partners</strong></h5>
        </div>
    </div>
    <br>
    <div class="row" style="height: 100px">
        <div class="col">
            <img src="https://cdn2.airpaz.com/rel-0292/themes/img/airlines_logo_vector/BL.png" height="100%" width="100px" alt="">
            <img src="https://cdn2.airpaz.com/rel-0292/themes/img/airlines_logo_vector/QH.png" height="100%" width="100px" alt="">
            <img src="https://cdn2.airpaz.com/rel-0292/themes/img/airlines_logo_vector/VJ.png" height="100%" width="100px" alt="">
            <img src="https://cdn2.airpaz.com/rel-0292/themes/img/airlines_logo_vector/VN.png" height="100%" width="100px" alt="">
        </div>
    </div>
</div>
<br><br>
<div class="container">
    <div class="row">
        <div class="col-sm-10">
            <p><strong style="color: #59595b">Cheap Popular Routes : </strong></p>
            <c:forEach begin="1" end="6">
                <small style="line-height: 17px"> Flights From Da Nang to Ha Noi ,</small>
            </c:forEach>
        </div>
    </div>
</div>
<br><br>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
<script src="/resources/js/home-page.js"></script>
<script>
    $('.dropdown-toggle').on('click', function (e) {
        $(this).next().toggle();
    });
    $('.dropdown-menu.keep-open').on('click', function (e) {
        e.stopPropagation();
    });
</script>

<script type="text/javascript">
    /*get trip type */

    $(document).ready(function () {

        sessionId = $('#sessionId').val();
        /*autocomplete for origin input*/
        let value;
        /*$("input#origin").on("keyup", function () {*/
        $('#origin').on("keyup", function () {
            value = $(this).val().toLowerCase();
            console.log(value);

            /*Force user to enter origin first!!!*/
            if ($('#destination').val() != '') {
                $('#destination').val('');
            }

            /*autocomplete*/
            $('#origin').autocomplete({
                width: 300,
                max: 10,
                delay: 0,
                minLength: 1,
                autoFocus: true,
                cacheLength: 1,
                scroll: true,
                highlight: false,
                source: function (request, response) {
                    $.ajax({
                        url: "originWithCityName",/*url: "origin",*/
                        dataType: "json",
                        data: request,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            let items = data;
                            let data_filter = items.filter(origin => origin.toLowerCase().indexOf(value) > -1);
                            response(data_filter);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                        }
                    });
                }

            });

        });
        /*Auto suggest for destination input*/
        $("input#destination").on("keyup", function () {
            let value2 = $(this).val().toLowerCase();
            console.log(value2);
            $("input#destination").autocomplete({
                width: 300,
                max: 10,
                delay: 0,
                minLength: 1,
                autoFocus: true,
                cacheLength: 1,
                scroll: true,
                highlight: false,
                source: function (request, response) {
                    $.ajax({
                        url: "destinationWithCityName/" + value.toString(),
                        dataType: "json",
                        data: request,
                        success: function (data, textStatus, jqXHR) {
                            let items2 = data;
                            console.log(items2);
                            let data_filter2 = items2.filter(origin => origin.toLowerCase().indexOf(value2) > -1);
                            response(data_filter2);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                        }
                    });
                }

            });
        });

    });
</script>
</body>
</html>
