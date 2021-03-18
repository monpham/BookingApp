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
                <form:form action="j_spring_security_check" method="post" name="login">
                <div class="card-title" style="margin-bottom: 26px;font-weight: 600;color: #59595b;font-size: 18px;line-height: 22px">Login</div>
                <div class="card-text" style="color: #59595b;margin: 0 0 11px 0"><small>Username</small></div>
                <input type="text" name="username" placeholder="Username" class="form-control" style="margin: 0 0 23px 0" required/>
                <div class="card-text" style="color: #59595b;margin: 0 0 11px 0"><small>Password</small></div>
                <input type="password" name="password" placeholder="Password" class="form-control" style="margin: 0 0 50px 0" required/>
                <input type="submit" value="Login" class="btn btn-lg text-white w-100 py-3" style="font-size: 17px;line-height: 22px;font-weight: 600;background-color: #e31f25;margin: 0 0 30px 0"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form:form>
                <div class="card-text text-center">
                    <p class="lead" style="font-size: 14px;line-height: 17px;font-weight: 400;">Not member? <a href="/register" style="color: #59595b"><strong>Resgister now</strong></a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br><br>
<%--<div class="container-fluid">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-5 mx-auto ">--%>
<%--                <div class="myform form ">--%>
<%--                    <div class="logo mb-3 ">--%>
<%--                        <div class="col-md-12 text-center ">--%>
<%--                            <h1>Login</h1>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <form:form action="j_spring_security_check" method="post" name="login">--%>
<%--                        <div class="form-group ">--%>
<%--                            <label for="username">Username</label>--%>
<%--                            <input type="text" name="username" class="form-control " id="username"--%>
<%--                                   aria-describedby="emailHelp" placeholder="Enter username ">--%>
<%--                        </div>--%>
<%--                        <div class="form-group ">--%>
<%--                            <label for="password">Password</label>--%>
<%--                            <input type="password " name="password" id="password" class="form-control "--%>
<%--                                   aria-describedby="emailHelp" placeholder="Enter Password ">--%>
<%--                        </div>--%>
<%--                        <div class="form-group ">--%>
<%--                            <p class="text-center">By signing up you accept our <a href="# ">Terms Of Use</a></p>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12 text-center ">--%>
<%--                            <button type="submit" name="" class=" btn btn-block mybtn btn-primary tx-tfm ">Login--%>
<%--                            </button>--%>
<%--                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <div class="login-or ">--%>
<%--                                <hr class="hr-or ">--%>
<%--                                <span class="span-or"></span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12 mb-3 ">--%>
<%--                            <p class="text-center ">--%>
<%--                                <a href="javascript:void(); " class="google btn mybtn "><i--%>
<%--                                        class="fa fa-google-plus ">--%>
<%--                                </i> Signup using Google--%>
<%--                                </a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                        <div class="form-group ">--%>
<%--                            <p class="text-center ">Don't have account? <a href="# " id="signup ">Sign up here</a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </form:form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>

</html>
