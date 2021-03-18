<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/16/2020
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Promotion</small></h3>
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
                            <h5 style="color: #333;font-weight: 600">Promotion List&nbsp;&nbsp;&nbsp;
                                <a href="/admin/addPromotion" class="btn btn-sm mycolor">
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
                                    <th>ID</th>
                                    <th>Event Name</th>
                                    <th>Image</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Discount Quantity</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${promotionList}" var="promo">
                                    <tr align="center">
                                        <td>${promo.promotionId}</td>
                                        <td>${promo.eventName}</td>
                                        <td><img width="150" height="100" src="${promo.image}" alt="image"></td>
                                        <td>${promo._startDate}</td>
                                        <td>${promo._endDate}</td>
                                        <td>${promo.discounts.size()} Discounts</td>
                                        <td>
                                            <a href="/admin/editPromotion?id=${promo.promotionId}" class="btn btn-sm mycolor"><i class='fa fa-pencil'></i></a>
                                            <a href="/admin/deletePromotion?id=${promo.promotionId}" class="btn btn-sm mycolor"><i class="fa fa-trash-o"></i></a>
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
