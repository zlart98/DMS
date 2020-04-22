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
<div>
    <p class="font-weight-bold">list Users</p>
</div>

<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Role</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="users" items="${userList}">
        <tr>
            <td><p>${users.username}<p></td>

            <td><c:forEach items="${users.roles}" var="roles">
                <c:out value="${roles}"/>
            </c:forEach></td>
            <td><p><a href="/user/${users.idUser}">edit</a><p></td>

        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
