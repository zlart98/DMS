<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html;charset=cp1251" %>
<html>
<head>
    <title>Department</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
<%--<a href="${pageContext.request.contextPath}/department">--%>
<%--    Department--%>
<%--</a>--%>
<%--||--%>
<%--<a href="${pageContext.request.contextPath}/worker">--%>
<%--    Emploee--%>
<%--</a>--%>
<%--<sec:authorize access="isAuthenticated()">--%>
<%--||<a href="<c:url value="/logout" />">Logout</a>--%>


<%--&nbsp;--%>
<%--<span style="color:limegreen">[ <sec:authentication property="name"/> ]</span>--%>
<%--</sec:authorize>--%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand">Система управления департамента</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <sec:authorize access="hasAnyRole('ADMIN','USER')">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/department">Департаменты</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/worker">Работники</a>
                </li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link"><span style="color:limegreen">[ <sec:authentication
                            property="name"/> ]</span></a>
                </li>
            </sec:authorize>
        </ul>
        <sec:authorize access="hasRole('ROLE_SECURITY_OFFICER')">
            <div class="navbar-text"><a class="nav-link" href="/user">Упраление учетными записями</a></div>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div class="navbar-text"><a class="nav-link" href="/logout">Выход</a></div>
        </sec:authorize>
    </div>
</nav>

<sec:authorize access="isAnonymous()">
<div>
    <<h3 align="center">Дабро пожаловать</h3>
    <h3 align="center">Чтобы начать работу-<a href="/login">войдите в систему</a>
    </h3>
    <div>
        </sec:authorize>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
                crossorigin="anonymous"></script>
</body>
</html>