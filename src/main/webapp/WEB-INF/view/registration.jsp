<%--<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<head>--%>
<%--    <title>Spring Security Example </title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div c:if="${param.error}">--%>
<%--    Invalid username and password.--%>
<%--</div>--%>
<%--Add new User--%>
<%--<span style="color:red"><p><strong>${message}</strong></p></span>--%>

<%--<form action="/registration" method="post">--%>
<%--    <div><label> Имя : <input type="text" name="username"/> </label></div>--%>
<%--    <div><label> Пароль: <input type="password" name="password"/> </label></div>--%>
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
<%--    <div><input type="submit" value="Войти"/></div>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Please sign in</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous"/>
</head>
<body>
<div class="container">
    <form class="form-signin" method="post" action="/registration">
        <h2 class="form-signin-heading">Регистрация</h2>
        <p>
        <label for="username" class="sr-only">Логин</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="Логин" required autofocus>
    </p>
        <p>
            <label for="password" class="sr-only">Пароль</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Пароль" required>
        </p>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button class="btn btn-lg btn-primary btn-block" type="submit">Регистрация</button>
    </form>
</div>
</body></html>