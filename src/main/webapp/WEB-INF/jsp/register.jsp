<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/9/2020
  Time: 7:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login-Airbook</title>
    <jsp:include page="css.jsp"/>
</head>

<body style="font-family: 'Poppins', sans-serif;background: linear-gradient(121.74deg, rgb(109, 20, 22) 0.97%, rgb(222, 46, 51) 54.61%, rgb(255, 157, 161) 99.48%);
}">
<br><br><br>
<div class="container">
    <div class="text-center">
        <p style="color: #ffffff; font-size: 36px;font-weight: 600">Airbook</p>
    </div>
    <div class="row justify-content-center">
        <div class="card col-sm-6">
            <div class="card-body" style="padding: 50px 35px 50px 35px">
                <form:form action="handlingRegisterAccount" modelAttribute="account">
                    <div class="card-title" style="margin-bottom: 26px;font-weight: 600;color: #59595b;font-size: 18px;line-height: 22px">Register</div>
                    <div class="card-text" style="color: #59595b;margin: 0 0 11px 0"><small>Username</small></div>
                    <form:input path="username" type="text" name="username" placeholder="username" class="form-control" style="margin: 0 0 23px 0" required="true"/>
                    <div class="card-text" style="color: #59595b;margin: 0 0 11px 0"><small>Password</small></div>
                    <form:input path="password" type="password" name="password" placeholder="password" class="form-control" style="margin: 0 0 23px 0" required="true"/>
                    <div class="card-text" style="color: #59595b;margin: 0 0 11px 0"><small>First name</small></div>
                    <form:input path="guest.firstName" type="text" name="password" placeholder="firstname" class="form-control" style="margin: 0 0 23px 0" required="true"/>
                    <div class="card-text" style="color: #59595b;margin: 0 0 11px 0"><small>Last name</small></div>
                    <form:input path="guest.lastName" type="text" name="password" placeholder="lastname" class="form-control" style="margin: 0 0 23px 0" required="true"/>
                    <div class="card-text" style="color: #59595b;margin: 0 0 11px 0"><small>Phone Number</small></div>
                    <form:input path="guest.phoneNumber" type="text" name="password" placeholder="Password" class="form-control" style="margin: 0 0 23px 0" required="true"/>
                    <div class="card-text" style="color: #59595b;margin: 0 0 11px 0"><small>Email</small></div>
                    <form:input path="guest.email" type="text" name="password" placeholder="email" class="form-control" style="margin: 0 0 23px 0" required="true"/>
                    <div class="card-text" style="color: #59595b;margin: 0 0 11px 0"><small>Address</small></div>
                    <form:input path="guest.address" type="text" name="password" placeholder="Password" class="form-control" style="margin: 0 0 50px 0" required="true"/>
                    <input type="submit" value="Register" class="btn btn-lg text-white w-100 py-3" style="font-size: 17px;line-height: 22px;font-weight: 600;background-color: #e31f25;margin: 0 0 30px 0"/>
                </form:form>
                <div class="card-text text-center">
                    <p class="lead" style="font-size: 14px;line-height: 17px;font-weight: 400;">Not member? <a href="#" style="color: #59595b"><strong>Resgister now</strong></a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br><br>

</body>

</html>
