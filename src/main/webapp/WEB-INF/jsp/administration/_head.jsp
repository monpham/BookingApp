<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/22/2020
  Time: 1:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,600;0,700;0,800;0,900;1,500&display=swap"
          rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<%--    <script src="<c:url value="/resources/js/adminHome.js"/>"></script>--%>
<%--    <link rel="stylesheet" href="<c:url value="/resources/css/adminHome.css"/>"/>--%>
    <style>
        html,body{
            min-height: 1000px;
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            line-height: 1.8;
            background-color: #fbfcff;
            color: #777d74;
            user-select: none;
        }
        .mycolor {
            background-color: #0dd6b8;
            border-color: #0dd6b8;
            color: white
        }
        /*pagnition style*/
        .page-item.active .page-link{
            background-color: #0dd6b8;
            border-color: #0dd6b8;
        }
        a.page-link{
            color: #0dd6b8;
        }
        /*end pagnition style*/
        /*style menu*/
        .list-group a:hover{
            background-color: #d592ff;
            text-decoration: none;
            color: white;
            font-weight: 700;
        }
        /*.card:hover{*/
        /*    box-shadow: 0 4px 8px rgba(0,0,0,.18), 0 0 4px rgba(0,0,0,.15);*/
        /*}*/
        .list-group a{
            text-decoration: none;
            color: #333333;
        }
        /*end style menu*/
    </style>
    <script>
        $(document).ready(function() {
            $('#example').DataTable();
        } );
    </script>
    <script src="/resources/js/tableToExcel.js"></script>
    <script src="/resources/js/tableToPDF.js"></script>
</head>
</html>
