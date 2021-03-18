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
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Flight / ${type}</small></h3>
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
            <div class="container col-sm-8">
                <div class="card border">
                    <div class="card-body ">
                        <form:form action="handlingFLightAddition" modelAttribute="flight">
                            <div class="row">
                                <c:if test="${message=='Save successed.'}">
                                    <div class="alert col-sm-12" style="background-color:#b7eb8f;color: #333">${message}</div>
                                </c:if>
                                <c:if test="${message=='Invalid value OR Data is existed.'||message=='Save failed.'}">
                                    <div class="alert col-sm-12" style="background-color:#ffccc7;color: #333">${message}</div>
                                </c:if>
                            </div>
                            <table class="table table-borderless border-0">
                                <c:if test="${type=='Edit'}">
                                    <tr>
                                        <td>Id</td>
                                        <td>
                                            <form:input path="flightId" cssClass="form-control" readonly="true"/>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th>Flight Route</th>
                                    <td>
<%--                                        <form:select id="flightRouteId" path="flightRoute"  cssClass="form-control" items="${flightRouteList}" required="true"/>--%>
                                        <select name="flightRoute" id="flightRouteId" class="form-control" required>
                                            <c:forEach var="route" items="${flightRouteList}">
                                                <c:if test="${flight!=null&&flight.flightRoute.routeId==route.routeId}">
                                                    <option value="${route.routeId}" selected>${route.originAirport.city.cityName} &#9992; ${route.destinationAirport.city.cityName}</option>
                                                </c:if>
                                                <c:if test="${flight.flightRoute.routeId!=route.routeId}">
                                                    <option value="${route.routeId}">${route.originAirport.city.cityName} &#9992; ${route.destinationAirport.city.cityName}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Departure Time</th>
                                    <td>
                                        <form:input path="departureTime" type="datetime-local" cssClass="form-control" required="true"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Arrival Time</th>
                                    <td>
                                        <form:input path="arrivalTime" type="datetime-local" cssClass="form-control" required="true"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Aircraft</th>
                                    <td>
                                        <form:select path="aircraft" cssClass="form-control" items="${aircraft}" itemLabel="model" required="true"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Economy Price</th>
                                    <td>
                                        <form:input type="text" path="economyPrice" cssClass="form-control" required="true"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Business Price</th>
                                    <td>
                                        <form:input type="text" path="businessPrice" cssClass="form-control" required="true"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Status</th>
                                    <td class="d-flex flex-row">
                                    <span class="border pl-2 pt-2 rounded mr-2 mb-1">
                                        <label class="form-check form-check-inline">
                                        <span class="form-check-label mr-5" style="font-size: 18px"> Delay </span>
                                        <form:radiobutton path="flightStatus" cssClass="form-check-input" value="Delay"/>
                                        </label>
                                    </span>
                                        <span class="border pl-2 pt-2 rounded mr-2 mb-1">
                                        <label class="form-check form-check-inline">
                                        <span class="form-check-label mr-5" style="font-size: 18px"> On time </span>
                                        <form:radiobutton path="flightStatus" cssClass="form-check-input" value="On time"/>
                                        </label>
                                    </span>
                                        <span class="border pl-2 pt-2 rounded mr-2 mb-1">
                                        <label class="form-check form-check-inline">
                                        <span class="form-check-label mr-5" style="font-size: 18px"> Cancel </span>
                                        <form:radiobutton path="flightStatus" cssClass="form-check-input" value="Cancel" onclick="doGetJSON()"/>
                                        </label>
                                    </span>

                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td>
                                        <div class="button mt-2 d-flex flex-row align-items-center">
                                            <input type="submit" class="btn btn-sm btn-outline-primary w-100" value="Save"/>
                                            <a href="/admin/viewFlight"class="btn btn-sm btn-outline-danger w-100 ml-2">Cancel</a>
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
