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
            <ul class="list-group">
                <jsp:include page="sidebar.jsp"/>
            </ul>
        </div>
        <div class="col-sm-10">
            <div class="card shadow">
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-sm-3">
                            <h5 style="color: #333;font-weight: 600">Booking List&nbsp;&nbsp;&nbsp;
                                <a href="/admin/addBrand" title="Add a new Ticket" class="btn btn-sm mycolor">
                                    <i class="fa fa-plus"></i></a>
                            </h5>
                        </div>
                        <div class="card col-sm-6">
                            <form:form modelAttribute="reportRange" action="bookingReport" method="get">
                                <div class="card-body pb-0">
                                    <div class="row">
                                        <div class="col">
                                            <label>Date from</label>
                                            <form:input path="startDate" type="date" alt="date-from" cssClass="form-control mr-2"/>
                                        </div>
                                        <div class="col">
                                            <label>Date to</label>
                                            <form:input path="endDate" type="date" alt="date-to" cssClass="form-control mr-2"/>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-sm-3"></div>
                                        <div class="col-sm-6">
                                            <button type="submit" class="btn mycolor w-100">Search</button>
                                        </div>
                                        <div class="col-sm-3"></div>
                                    </div>
                                </div>
                            </form:form>
                        </div>

                        <div class="col-sm-3">
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
                            <table id="example" class="table table-hover table-bordered w-100">
                                <thead>
                                <tr align="center">
                                    <th>
                                        Booking <br/> ID
                                    </th>
                                    <th>Payment <br/> Status</th>
                                    <th>Payment <br/> Method</th>
                                    <th>Email</th>
                                    <th>Name</th>
                                    <th>Payment <br/> Id</th>
                                    <th>Total <br/> Payment</th>
                                    <th>Edit</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${bookingList}" var="b">
                                    <tr align="center">
                                        <td>${b.bookingId}</td>
                                        <td>${b.payment.status}</td>
                                        <td>${b.payment.paymentMethod}</td>
                                        <td>${b.guest.email}</td>
                                        <td>${b.guest.firstName}  ${b.guest.lastName}</td>
                                        <td>${b.payment.paymentId}</td>
                                        <c:if test="${b.payment.totalPayment!=null}">
                                            <td>${b.payment.totalPayment} <pan id="unit">$</pan></td>
                                        </c:if>
                                        <td>
                                            <a href="/admin/viewABookingDetails?bookingId=${b.bookingId}" class="btn btn-sm mycolor"><i
                                                    class="fa fa-pencil"></i></a>
                                            <a href="/admin/deleteBooking?bookingId=${b.bookingId}" class="btn btn-sm mycolor"><i
                                                    class="fa fa-trash-o"></i></a>
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
