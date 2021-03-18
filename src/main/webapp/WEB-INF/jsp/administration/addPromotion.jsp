
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
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Promotion / ${type}</small></h3>
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
            <div class="row">
                <div class="container col-sm-6">
                    <div class="card border">
                        <div class="card-body ">
                            <form:form action="handlingSavePromotion" modelAttribute="promotion">
                                <div class="row">
                                    <c:if test="${message=='Save successed.'}">
                                        <div class="alert col-sm-12" style="background-color:#b7eb8f;color: #333">${message}</div>
                                    </c:if>
                                    <c:if test="${message=='Invalid value.'||message=='Save failed.'}">
                                        <div class="alert col-sm-12" style="background-color:#ffccc7;color: #333">${message}</div>
                                    </c:if>
                                </div>
                                <table class="table table-borderless">
                                    <h4>Promotion</h4>
                                    <c:if test="${type=='Edit'}">
                                        <tr>
                                            <th>ID</th>
                                            <td>
                                                <form:input path="promotionId" cssClass="form-control" readonly="true"/>
                                            </td>
                                        </tr>
                                    </c:if>
                                    <tr>
                                        <th>Event Name</th>
                                        <td>
                                            <form:input path="eventName" cssClass="form-control" required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Start Date</th>
                                        <td>
                                            <form:input path="startDate" type="date" cssClass="form-control" required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>End Date</th>
                                        <td>
                                            <form:input path="endDate" type="date" cssClass="form-control" required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Image</th>
                                        <td>
                                            <form:input path="image" cssClass="form-control" required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Quantity Discounts</th>
                                        <td style="font-weight: 700; text-align: center">${promotion.discounts.size()}</td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td>
                                            <div class="button mt-2 d-flex flex-row align-items-center">
                                                <input type="submit" class="btn btn-sm btn-outline-primary w-100" value="Save"/>
                                                <a href="/admin/viewPromotion"class="btn btn-sm btn-outline-danger w-100 ml-2">Cancel</a>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form:form>
                        </div>
                    </div>
                </div>

                <c:if test="${type=='Edit'}">
                    <div class="col-sm-4">
                    <div class="card border">
                        <div class="card-body">
                                <form:form action="handlingSaveDiscount" modelAttribute="discount">
                                    <table class="table table-borderless">
                                        <h4>Discount</h4>
                                        <tbody>
                                        <tr>
                                            <th>Amount</th>
                                            <td><form:input path="discountAmount" cssClass="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <th>Code</th>
                                            <td><form:input path="discountCode" cssClass="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <th>Quantity</th>
                                            <td><form:input path="discountQuantity" cssClass="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <th>Promotion</th>
                                            <td><form:input path="promotion" readonly="true" cssClass="form-control" value="${promotion.promotionId}"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input type="submit" class="btn btn-outline-primary btn-sm w-100" value="Save"/></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
            <br><br>
            <div class="row">
                <table class="table table-bordered col-sm-8">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Code</th>
                        <th>Amount</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="discount" items="${discountList}">
                        <tr>
                            <td>${discount.discountId}</td>
                            <td>${discount.discountCode}</td>
                            <td>${discount.discountAmount}</td>
                            <td>${discount.discountAmount}</td>
                            <td style="vertical-align: middle">
                                <a href="/admin/deleteDiscount?id=${discount.promotion.promotionId}" class="btn btn-sm mycolor"><i class="fa fa-trash-o"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
