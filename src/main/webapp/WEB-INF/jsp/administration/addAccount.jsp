
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
                    <h3 style="color: #333333">Home <small style="color: #72849a">/ Account / ${type}</small></h3>
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
                            <form:form action="handlingSaveAccount" modelAttribute="account">
                                <div class="row">
                                    <c:if test="${message=='Save successed.'}">
                                        <div class="alert col-sm-12" style="background-color:#b7eb8f;color: #333">${message}</div>
                                    </c:if>
                                    <c:if test="${message=='Data is existed.'||message=='Save failed.'}">
                                        <div class="alert col-sm-12" style="background-color:#ffccc7;color: #333">${message}</div>
                                    </c:if>
                                </div>
                                <table class="table table-borderless">
                                    <c:if test="${type=='Edit'}">
                                        <tr>
                                            <th>ID</th>
                                            <td>
                                                <form:input path="accountId" cssClass="form-control" readonly="true"/>
                                            </td>
                                        </tr>
                                    </c:if>
                                    <tr>
                                        <th>Username</th>
                                        <td>
                                            <form:input path="username" cssClass="form-control" required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Password</th>
                                        <td>
                                            <form:input path="password" cssClass="form-control" required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Enabled</th>
                                        <td>
                                                <%--                                        <form:input path="enabled" cssClass="form-control" required="true"/>--%>
                                            <select name="enabled" id="enabled" class="form-control" required>
                                                <option value="true">Active</option>
                                                <option value="true">Inactive</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Role</th>
                                        <td>
                                                <%--                                        <form:input path="roles" cssClass="form-control" required="true"/>--%>
                                            <select name="roles" id="roles" class="form-control" required>
                                                <c:forEach var="role" items="${roles}">
                                                    <option value="${role.roleId}">${role.role}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td>
                                            <div class="button mt-2 d-flex flex-row align-items-center">
                                                <input type="submit" class="btn btn-sm btn-outline-primary w-100" value="Save"/>
                                                <a href="/admin/viewAccount"class="btn btn-sm btn-outline-danger w-100 ml-2">Cancel</a>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form:form>
                        </div>
                    </div>
                </div>

                <c:if test="${type=='Edit'}">
                    <div class="col-sm-5">
                        <div class="card border">
                            <div class="card-body">
                                <form:form action="handlingSaveGuest" modelAttribute="guest">
                                    <table class="table table-borderless">
                                        <h4>Guest</h4>
                                        <tbody>
                                        <c:if test="${guest.guestId!=0}">
                                            <tr>
                                                <td>Id</td>
                                                <td><form:input path="guestId" readonly="true" cssClass="form-control"/></td>
                                            </tr>
                                        </c:if>
                                        <tr>
                                            <td>First name</td>
                                            <td><form:input path="firstName" cssClass="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <td>Last name</td>
                                            <td><form:input path="lastName" cssClass="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <td>Phone number</td>
                                            <td><form:input path="phoneNumber" cssClass="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td><form:input path="email" cssClass="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td><form:input path="address" cssClass="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <td>Account</td>
                                            <td><form:input path="account" readonly="true" cssClass="form-control" value="${account.accountId}"/></td>
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
        </div>
    </div>
</div>
</body>
</html>
