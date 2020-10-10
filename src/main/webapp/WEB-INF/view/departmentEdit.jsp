<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <link href="<c:url value="/css/style.css" />" rel="stylesheet">
    <title>EditDepartment</title>
</head>

<body>
<jsp:include page="menuIsLogin.jsp"></jsp:include>

<p class="font-weight-bold">Редактирование раздела ${editDepartment.departmentName}

    <form action="/department/saveOrUpdate" method="post" accept-charset="utf-8">
        <br><p><input type="text" value="${editDepartment.departmentName}" name="departmentName">
    <input type="hidden" value="${editDepartment.idDepartment}" name="idDepartment">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <br><p><button type="submit" class="btn btn-primary mb-0.8">Сохранить</button>
    </form>
</body>
</html>
