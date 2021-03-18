
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/16/2020
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Flight Route / ${type}</small></h3>
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
            <div class="container col-sm-6">
                <div class="card border">
                    <div class="card-body ">
                        <form:form action="handlingSaveFlightRoute" modelAttribute="flightRoute">
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
                                            <form:input path="routeId" cssClass="form-control" readonly="true"/>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th>Origin Airport</th>
                                    <td>
                                        <select name="originAirport" id="originAirport" class="form-control" required>
                                            <option disabled selected >Select Origin City</option>
                                            <c:forEach var="origin" items="${originAirport}">
                                                <option value="${origin.airportId}">${origin.city.cityName}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Destination Airport</th>
                                    <td>
                                        <select name="destinationAirport" id="destinationAirport" class="form-control">
                                            <option disabled selected >Select Destination City</option>
                                            <c:forEach var="destination" items="${destinationAirport}">
                                                <option value="${destination.airportId}">${destination.city.cityName}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td>
                                        <div class="button mt-2 d-flex flex-row align-items-center">
                                            <input type="submit" class="btn btn-sm btn-outline-primary w-100" value="Save"/>
                                            <a href="/admin/viewFlightRoute"class="btn btn-sm btn-outline-danger w-100 ml-2">Cancel</a>
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
