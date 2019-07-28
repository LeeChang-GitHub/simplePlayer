<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="<%=basePath%>">

    <link rel="stylesheet" href="static/css/normalize.css">

    <link rel="stylesheet" href="static/css/style.css" media="screen" type="text/css"/>
    <style>
        /*没被访问过之前*/
        a:link{
            color: #FFF;
        }
        /*访问过后*/
        /*一般不设置visited*/
        a:visited{
            color: #1b6d85;
        }
    </style>
</head>
<body>
    <c:forEach items="${list}" var="item">
        <ul class="live type2">
            <li><a href="jojo?path=${item.name}"/>${item.name}</li>
        </ul>
    </c:forEach>
</body>
</html>