<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01/05/21
  Time: 5:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01/05/21
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking Data</title>
    <jsp:include page="_head.jsp"/>
</head>
<body>
<div class="container-fluid">
    <div class="row mt-2">
        <div class="col-sm-2">
            <div class="card">
                <div class="card-body d-flex justify-content-center">
                    <h1 style="color: #d592ff;font-weight: 900">ADMIN</h1>
                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <div class="card">
                <div class="card-body">
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Brand</small></h3>
                </div>
            </div>
        </div>
    </div>
    <hr class="mb-4">
    <div class="row">
        <div class="col-sm-2">
            < class="list-group">
            <jsp:include page="sidebar.jsp"/>
            </ul>
        </div>
        <div class="col-sm-10">
            <div class="card shadow">
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-sm-5">
                            <h5 style="color: #333;font-weight: 600">Booking List&nbsp;&nbsp;&nbsp;
                                <a href="/admin/addBrand" title="Add a new Ticket" class="btn btn-sm mycolor">
                                    <i class="fa fa-plus"></i></a>
                                <span>

                                </span>
                            </h5>
                        </div>
                        <div class="col-sm-7">
                            <c:if test="${message=='Delete successfully.'}">
                                <div class="alert" style="background-color:#b7eb8f;color: #333">${message}</div>
                            </c:if>
                            <c:if test="${message=='Delete failed.'}">
                                <div class="alert" style="background-color:#ffccc7;color: #333">${message}</div>
                            </c:if>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12 ">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">
                                        Booking Id
                                    </th>
                                    <th scope="col">Ticket Id</th>
                                    <th scope="col">Flight</th>
                                    <th scope="col">Origin</th>
                                    <th scope="col">Destination</th>
                                    <th scope="col">Travel Class</th>
                                    <th scope="col">Ticket Type</th>
                                    <th scope="col">Seat Code</th>
                                    <th scope="col">Price <span>($)</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="t" items="${bookingDetails.tickets}">
                                    <tr>
                                        <td>${t.booking.bookingId}</td>
                                        <td>${t.ticketId}</td>
                                        <td>
                                                ${t.flight.flightId}
                                            <br/>
                                                ${t.flight.aircraft.model}
                                        </td>
                                        <td>
                                                ${t.flight.flightRoute.originAirport.airportName}
                                            <br/>
                                                ${t.flight.departureTime}
                                        </td>
                                        <td>
                                                ${t.flight.flightRoute.destinationAirport.airportName}
                                            <br/>
                                                ${t.flight.arrivalTime}
                                        </td>
                                        <td>${t.travelClass.className}</td>
                                        <td>${t.ticketType.ticketTypeName}</td>
                                        <td>${t.seatCode}</td>
                                        <td>${t.price}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br><br>
</body>
</html>

</body>
</html>
