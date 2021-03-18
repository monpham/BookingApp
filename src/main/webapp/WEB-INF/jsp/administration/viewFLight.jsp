<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/16/2020
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/16/20
  Time: 7:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="_head.jsp"/>

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
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Flight</small></h3>
                </div>
            </div>
        </div>
    </div>
    <hr class="mb-4">
    <div class="row">
        <div class="col-sm-2">
            <ul class="list-group">
                <jsp:include page="sidebar.jsp"/>
            </ul>
        </div>
        <div class="col-sm-10">
            <div class="card shadow">
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-sm-5">
                            <h5 style="color: #333;font-weight: 600">Flight List&nbsp;&nbsp;&nbsp;
                                <a href="/admin/addFlight" class="btn btn-sm mycolor">
                                    <i class="fa fa-plus"></i></a>
                            </h5>
                        </div>
                        <div class="col-sm-7">
                            <c:if test="${message=='Delete successed.'}">
                                <div class="alert" style="background-color:#b7eb8f;color: #333">${message}</div>
                            </c:if>
                            <c:if test="${message=='Delete failed.'}">
                                <div class="alert" style="background-color:#ffccc7;color: #333">${message}</div>
                            </c:if>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12 ">
                            <table class="table table-bordered table-hover" id="example">
                                <thead>
                                <tr align="center">
                                    <th>Departure time</th>
                                    <th>Arrival time</th>
                                    <th style="width: 14%">Origin Airport</th>
                                    <th style="width: 14%">Destination Airport</th>
                                    <th>Flight Status</th>
                                    <th style="width: 14%">Aircraft</th>
                                    <th>Economy Price</th>
                                    <th>Business Price</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${flightList}" var="f">
                                    <tr align="center" style="height: 100px">
                                        <td style="vertical-align: middle; width: 11.6%">${f._departureTime}</td>
                                        <td style="vertical-align: middle; width: 11.6%">${f._arrivalTime}</td>
                                        <td style="vertical-align: middle">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"/>
                                            <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"/>
                                            </svg>
                                                ${f.flightRoute.originAirport.city.cityName}
                                        </td>
                                        <td style="vertical-align: middle">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"/>
                                                <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"/>
                                            </svg>
                                                ${f.flightRoute.destinationAirport.city.cityName}
                                        </td>
                                        <td style="vertical-align: middle">${f.flightStatus}</td>
                                        <td style="vertical-align: middle">${f.aircraft.model}<br> <small>${f.aircraft.brand.brandName}</small></td>
                                        <td style="vertical-align: middle">${f.economyPrice}</td>
                                        <td style="vertical-align: middle">${f.businessPrice}</td>
                                        <!-- Đây là các icon thao tác -->
                                        <td style="vertical-align: middle">
                                            <a href="editFlight?id=${f.flightId}" class="btn btn-sm mycolor" title="chỉnh sửa" style="margin: 1px;"><i class='fa fa-pencil' ></i></a>
                                            <a href="deleteFlight?id=${f.flightId}" class="btn btn-sm mycolor" title="xóa" style="margin: 1px;"><i class="fa fa-trash-o" ></i></a>
                                        </td>
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

