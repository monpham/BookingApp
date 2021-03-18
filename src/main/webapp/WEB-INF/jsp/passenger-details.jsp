<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/6/2021
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Airbook-List Flight</title>
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
    </style>
    <script>
        let origin, destination, departureDate, returnDate;
        let adults, children, infants;
        let departurePrice, departureFlightId, departureTravelClass;
        let returnPrice, returnFlightId, returnTravelClass;
        let flightData;
        let tripType;

        let contactInformation;
        $(document).ready(function () {
            console.log("HI am ready to go!!");
            console.log(sessionId.value);
            let previousSessionValue = sessionStorage.getItem(sessionId.value);
            console.log(previousSessionValue);

            contactInformation = {
                firstName: "",
                lastName: "",
                email: "",
                phoneNumber: ""
            }

            if (previousSessionValue != null) {
                flightData = JSON.parse(previousSessionValue);

                adults = parseInt(flightData.ticketInformation.adults);
                children = parseInt(flightData.ticketInformation.children);
                infants = parseInt(flightData.ticketInformation.infants);

                console.log(flightData);
                console.log(adults);
                console.log(children);
                console.log(infants);


                for (let i = 1; i <= (adults + children + infants); i++) {
                    if (i <= adults) {
                        $('#passenger-data-container').find("div.passenger-data-item").eq(i - 1).attr("id", "passenger-" + i);
                        document.getElementById("passenger-" + i).getElementsByTagName("input").namedItem("sendInformationCheckbox").setAttribute("onclick", "sendDataToEmail('passenger-" + i + "')");
                    } else if (i <= (adults + children)) {
                        $('#passenger-data-container').find("div.passenger-data-item").eq(i - 1).attr("id", "passenger-" + i);
                    } else {
                        $('#passenger-data-container').find("div.passenger-data-item").eq(i - 1).attr("id", "passenger-" + i);
                    }
                }
                /* let title = $('#passenger-2 #title').val();
                 console.log(title);*/
            }
        })
        let isDataSentChecked;

        //Get Email/ Phones Fields for the later utilization
        function sendDataToEmail(passengerDataItem) {
            let inputTag = document.getElementById(passengerDataItem).getElementsByTagName("input");
            if (inputTag.namedItem("sendInformationCheckbox").checked) {
                inputTag.namedItem("email").removeAttribute("disabled");
                inputTag.namedItem("phoneNumber").removeAttribute("disabled");
                isDataSentChecked = true;
            } else {
                inputTag.namedItem("email").setAttribute("disabled", "true");
                inputTag.namedItem("phoneNumber").setAttribute("disabled", "true");
                ;
            }
        }

        let passengerInformation = new Array();

        //Send Data back to Server --> Using Ajax


    </script>
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
<br><br>
<form id="passenger-information-container" <%--action="seatSelection"--%>>
<div class="container">
    <div class="row">
        <div class="col-sm-8">
            <div class="card">
                <div class="card-body px-0">
                    <div class="col">
                        <div class="row border-bottom">
                            <div class="col-sm-9 pb-3">
                                <strong style="font-size: 18px;line-height: 22px;font-weight: 600;color: #59595b">Contact Information</strong>
                            </div>
                            <div class="col-sm-3">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col" style="padding: 20px 0 0 20px">
                                <div id="contact-information-container">
                                    <div class="form-row">
                                        <div class="form-group" style="margin: 0 50px 0 0">
                                            <label><strong style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">First Name</strong></label>
                                            <input type="text" class="form-control required" id="firstName" placeholder="Type without tones..." required>
                                        </div>

                                        <div class="form-group">
                                            <label><strong style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Last Name</strong></label>
                                            <input type="text" class="form-control required" id="lastName" placeholder="Type without tones..." required>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group" style="margin: 0 50px 0 0">
                                            <label><strong style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Email</strong></label>
                                            <input type="text" class="form-control required" id="email" required>
                                        </div>
                                        <div class="form-group">
                                            <label><strong style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Phone</strong></label>
                                            <input type="text" class="form-control required" id="phoneNumber" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <br><br>
            <div class="card">
                <div class="card-body px-0">
                    <div class="col">
                        <div class="row border-bottom">
                            <div class="col-sm-9 pb-3">
                                <strong style="font-size: 18px;line-height: 22px;font-weight: 600;color: #59595b">Passenger Information</strong>
                            </div>
                            <div class="col-sm-3">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col" style="padding: 20px 20px 0 20px">
                                <div id="passenger-data-container">
                                    <c:forEach var="p" items="${passengerList}">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="col passenger-data-item">
                                                    <div class="row border-bottom">
                                                        <div class="col-sm-9 " style="padding: 20px 20px 20px 20px">
                                                            <p style="font-size: 18px;line-height: 22px;font-weight: 600;color: #59595b">
                                                                <i class="fa fa-user"></i>&nbsp;Passenger ${passengerList.indexOf(p)+1} |
                                                                <c:choose>
                                                                    <c:when test="${p.title == 'adult'}">
                                                                        Adult
                                                                    </c:when>
                                                                    <c:when test="${p.title == 'child'}">
                                                                        Child
                                                                    </c:when>
                                                                    <c:when test="${p.title == 'infant'}">
                                                                        Infant
                                                                    </c:when>
                                                                </c:choose>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col" style="padding: 20px 20px 20px 20px">
                                                            <div class="form-row">
                                                                <div class="form-group">
                                                                    <label style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Title</label>
                                                                    <select class="form-control" name="title">
                                                                        <c:choose>
                                                                            <c:when test="${p.title == 'adult'}">
                                                                                <option value="Mr">Mr</option>
                                                                                <option value="Mrs">Mrs</option>
                                                                                <option value="Mrs">Ms</option>
                                                                                <option value="Mrs">Miss</option>
                                                                            </c:when>
                                                                            <c:when test="${p.title == 'infant'}">
                                                                                <option value="infant">Infant</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option value="child">Child</option>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group" style="margin: 0 40px 0 0;">
                                                                    <label style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">First Name:</label>
                                                                    <input class="form-control required" name="firstName" placeholder="First Name" required/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Last Name</label>
                                                                    <input class="form-control required" name="lastName" placeholder="Last Name" required/>
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group" style="margin: 0 40px 0 0">
                                                                    <label style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Date Of Birth</label>
                                                                    <input type="date" class="form-control required" name="dateOfBirth" required/>
                                                                </div>
                                                                <div class="form-group" style="margin: 0 40px 0 0">
                                                                    <label style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Gender</label>
                                                                    <select class="form-control required" name="gender" required>
                                                                        <option value="male">Male</option>
                                                                        <option value="female">Female</option>
                                                                        <option value="homosexuality">Homosexuality</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Nationality</label>
                                                                    <select class="form-control required" name="nationality" required>
                                                                        <c:forEach var="c" items="${countryNames}">
                                                                            <option value="${c}">${c}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <c:if test="${p.title == 'adult' || p.title == 'child'}">
                                                                <div class="form-row">
                                                                    <div class="form-group" style="margin: 0 40px 0 0">
                                                                        <label style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Passport Number:</label>
                                                                        <input path="passportNumber" class="form-control" name="passportNumber" required/>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Expiry Date:</label>
                                                                        <input type="date" class="form-control" name="expiryDate" required/>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${p.title == 'adult'}">
                                                                <div class="form-row">
                                                                    <div class="form-group" style="margin: 0 40px 0 0">
                                                                        <label style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Email *</label>
                                                                        <input path="passportNumber" class="form-control " name="email" disabled/>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label style="font-size: 14px;line-height: 22px;font-weight: 600;color: #59595b">Phone Number *</label>
                                                                        <input type="text" class="form-control " name="phoneNumber" disabled/>
                                                                    </div>
                                                                    <div class="form-group">
                                                                       <label>Send Booking Data to this email</label>
                                                                       <input type="checkbox" name="sendInformationCheckbox" class="form-control  col-md-2 "/>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br/>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-4 " id="flightInformation">
            <br>
            <button type="submit" id="continue" class="btn btn-danger w-100 py-2" onclick="sendPassengerData()">Continue</button>
        </div>
    </div>
</div>
</form>
<br><br>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
<script>
    let blankExistence;
    function sendPassengerData() {
        //Save contact Information
        flightData.contactInformation.firstName = $('#firstName').val();
        flightData.contactInformation.lastName = $('#lastName').val();
        flightData.contactInformation.phoneNumber = $('#phoneNumber').val();
        flightData.contactInformation.email = $('#email').val();

        for (let i = 1; i <= (adults + children + infants); i++) {
            let passengerData = document.getElementById("passenger-" + i);
            let title, firstName, lastName, gender, dateOfBirth, nationality, passportNumber, expiryDate, email,
                phoneNumber;

            title = passengerData.getElementsByTagName("select").namedItem("title").value;

            gender = passengerData.getElementsByTagName("select").namedItem("gender").value;
            nationality = passengerData.getElementsByTagName("select").namedItem("nationality").value;

            firstName = passengerData.getElementsByTagName("input").namedItem("firstName").value;
            lastName = passengerData.getElementsByTagName("input").namedItem("lastName").value;
            dateOfBirth = passengerData.getElementsByTagName("input").namedItem("dateOfBirth").value;
            if (title != "infant") {
                passportNumber = passengerData.getElementsByTagName("input").namedItem("passportNumber").value;
                expiryDate = passengerData.getElementsByTagName("input").namedItem("expiryDate").value;
            }

            if (title != "infant" && title != "child" && isDataSentChecked) {
                email = passengerData.getElementsByTagName("input").namedItem("email").value;
                phoneNumber = passengerData.getElementsByTagName("input").namedItem("phoneNumber").value;
            }

            let person = {
                title: title,
                firstName: firstName,
                lastName: lastName,
                dateOfBirth: dateOfBirth,
                gender: gender,
                nationality: nationality,
                passportNumber: passportNumber,
                expiryDate: expiryDate,
                email: email,
                phoneNumber: phoneNumber
            };

            console.log(person);
            passengerInformation.push(person);
        }
        console.log((passengerInformation));

        /*for (let k = 0; k < passengerInformation.length; k++) {
            if (!passengerInformation[k].lastName.localeCompare("") || !passengerInformation[k].firstName.localeCompare("") || !passengerInformation[k].dateOfBirth.localeCompare("") || !passengerInformation[k].passportNumber.localeCompare("") || !passengerInformation[k].expiryDate.localeCompare("")) {
                blankExistence = false;
                console.log("Here i go : " + blankExistence);
                break;
            } else {
                console.log("Here i go : " + blankExistence);
                blankExistence = true;
            }
        }*/
        console.log("Before adding passengers' Information");
        console.log(flightData);
        flightData.passengerInformation = passengerInformation;
        console.log(flightData);

        //Send Data to Server here !! Ha ha!!
        sessionStorage.setItem(sessionId.value, JSON.stringify(flightData));
        /*console.log(sessionStorage.getItem(sessionId));*/
        /*alert(blankExistence);*/
        /*if (blankExistence == true) {*/
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

                    /*alert("Succeed!!!");*/
                    location.href = "seatSelection";
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                    console.log("fail");
                    alert("OOP!!! Something is wrong!!!");
                }
            });
        /*}*/

    }
</script>
</body>
</html>
