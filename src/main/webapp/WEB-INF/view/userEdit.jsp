<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <link href="<c:url value="/css/style.css" />" rel="stylesheet">
    <title>UserList</title>
</head>

<body>
<jsp:include page="menu.jsp"></jsp:include>

<p class="font-weight-bold">Редактирование записи ${userEdit.username}

<form action="/user" method="post" accept-charset="utf-8">
    <br><p><input type="text" value="${userEdit.username}" name="username">
        <c:forEach items="${roles}" var="roles">
    <br><p><input type="checkbox" name="${roles}">${roles}
        </c:forEach>
        <input type="hidden" value="${userEdit.idUser}" name="userId">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <br><p><button type="submit" class="btn btn-primary mb-0.8">Сохранить</button>

</form>
</body>
</html>
