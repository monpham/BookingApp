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
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Account</small></h3>
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
                            <h5 style="color: #333;font-weight: 600">Account List&nbsp;&nbsp;&nbsp;
                                <a href="/admin/addAccount" class="btn btn-sm mycolor">
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
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>Enable</th>
                                    <th>Full Name</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>Phone Number</th>
                                    <th>Roles</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${accountList}" var="a">
                                    <tr align="center">
                                        <td style="vertical-align: middle">${a.username}</td>
                                        <td style="vertical-align: middle">${a.password}</td>
                                        <td style="vertical-align: middle">${a.enabled}</td>
                                        <td style="vertical-align: middle">${a.guest.firstName} ${a.guest.lastName}</td>
                                        <td style="vertical-align: middle">${a.guest.address}</td>
                                        <td style="vertical-align: middle">${a.guest.email}</td>
                                        <td style="vertical-align: middle">${a.guest.phoneNumber}</td>
                                        <td style="vertical-align: middle">
                                            <c:forEach var="role" items="${a.roles}">
                                                ${role.role}
                                            </c:forEach>
                                        </td>
                                        <td style="vertical-align: middle">
                                            <a href="/admin/editAccount?id=${a.accountId}" class="btn btn-sm mycolor"><i class='fa fa-pencil'></i></a>
                                            <a href="/admin/deleteAccount?id=${a.accountId}" class="btn btn-sm mycolor"><i class="fa fa-trash-o"></i></a>
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
