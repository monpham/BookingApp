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
                <h3 style="color: #333333">Home <small style="color: #72849a">/ Aircraft / ${type}</small></h3>
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
        <div class="container col-sm-7">
            <div class="card border">
                <div class="card-body ">
                    <form:form action="handlingAircraftAddition" modelAttribute="aircraft">
                        <div class="row">
                            <c:if test="${message=='Save successed.'}">
                                <div class="alert col-sm-12" style="background-color:#b7eb8f;color: #333">${message}</div>
                            </c:if>
                            <c:if test="${message=='Data is existed.'||message=='Invalid value.'||message=='Save failed.'}">
                                <div class="alert col-sm-12" style="background-color:#ffccc7;color: #333">${message}</div>
                            </c:if>
                        </div>
                        <table class="table table-borderless">
                            <c:if test="${type=='Edit'}">
                                <tr>
                                    <th>ID</th>
                                    <td>
                                        <form:input path="aircraftId" readonly="true" class="form-control" />
                                    </td>
                                </tr>
                            </c:if>
                            <tr>
                                <th>Model</th>
                                <td>
                                    <form:input path="model"  class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Logo</th>
                                <td>
                                    <form:input path="logo_airline"  class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Total Economy</th>
                                <td>
                                    <form:input path="total_economy" class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <th>Total business</th>
                                <td>
                                    <form:input path="total_business" class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <th>Brand</th>
                                <td>
                                    <select name="brand.brandId" id="brandId" class="form-control">
                                        <c:forEach items="${brands}" var="brand">
                                            <c:if test="${aircraft.brand==brand}">
                                                <option value="${brand.brandId}" selected>${brand.brandName}</option>
                                            </c:if>
                                            <c:if test="${aircraft.brand!=brand}">
                                                <option value="${brand.brandId}">${brand.brandName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="button mt-2 d-flex flex-row align-items-center">
                                        <input type="submit" class="btn btn-sm btn-outline-primary w-100" value="Save"/>
                                        <a href="/admin/viewAircraft"class="btn btn-sm btn-outline-danger w-100 ml-2">Cancel</a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>
