<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/16/20
  Time: 9:08 PM
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
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Aircraft</small></h3>
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
                            <h5 style="color: #333;font-weight: 600">Aircraft List&nbsp;&nbsp;&nbsp;
                                <a href="/admin/addAircraft" class="btn btn-sm mycolor">
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
                            <table id="example" class="table table-hover table-bordered w-100">
                                <thead>
                                <tr align="center">
                                    <th scope="col">Id</th>
                                    <th scope="col">Model</th>
                                    <th scope="col">Logo Airline</th>
                                    <th scope="col">Total Economy Seats</th>
                                    <th scope="col">Total Business Seats</th>
                                    <th scope="col">Brand</th>
                                    <th scope="col">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="a" items="${aircraft}">
                                    <tr align="center">
                                        <td scope="row" style="vertical-align: middle">${a.aircraftId}</td>
                                        <td style="vertical-align: middle">${a.model}</td>
                                        <td style="vertical-align: middle"><img src="${a.logo_airline}" alt="logo" width="100px" height="100px"></td>
                                        <td style="vertical-align: middle">${a.total_economy}</td>
                                        <td style="vertical-align: middle">${a.total_business}</td>
                                        <td style="vertical-align: middle">${a.brand.brandName}</td>
                                        <td style="vertical-align: middle">
                                            <a href="/admin/editAircraft?aircraftId=${a.aircraftId}" class="btn btn-sm mt-1 mycolor" title="Edit"><i class='fa fa-pencil'></i></a>
                                            <a href="/admin/deleteAircraft?aircraftId=${a.aircraftId}" class="btn btn-sm mycolor mt-1" title="Delete"><i class="fa fa-trash-o"></i></a>
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
