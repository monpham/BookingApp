<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/31/20
  Time: 4:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="administration/_head.jsp"></jsp:include>
    <style>
        body {
            background: #282c34;
        }
        #notification-container {
        }
    </style>
</head>
<body>
<div class="container " id="notification-container">
    <div style="display: inline-block">
        <div class="" style="text-align: center">
            <h1>THANK YOU</h1>
            <img src="/resources/image/green-tick-icon.jpg" title="Succeed" alt="Succeed Icon" style="width: 50%; height: 40vh"/>
            <h5>You've Successfully booked tickets...</h5>
            <h5>Your booking Id: ${bookingId} </h5>
            <h5>Click here to review your tickets <a href="bookingDetails?booking.bookingId=${bookingId}&passenger.lastName=${lastName}">${bookingId}</a></h5>
            <%--<h5>Click here to review your tickets <a href="bookingDetails?booking.bookingId=${bookingId}">${bookingId}</a></h5>--%>

        </div>
    </div>
</div>
</div>
</body>
</html>
