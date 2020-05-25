<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <link href="<c:url value="/css/style.css" />" rel="stylesheet">
    <title>EditWorker</title>
</head>

<body>
<jsp:include page="menu.jsp"></jsp:include>

<p class="font-weight-bold">Редактирование записи работника ${editWorker.name}

    <form class="form-inline" action="/worker/saveOrUpdate" method="post" accept-charset="utf-8">
        <div class="form-row align-items-center">
            <div class="col-auto">
<p><input type="text" name="name" placeholder="Имя" value="${editWorker.name}" class="form-control"/></p>
</div>
<div class="col-auto">
    <p><input type="text" name="position" placeholder="Должность" value="${editWorker.position}" class="form-control"/></p>
</div>
<div class="col-auto">
    <p><input type="text" name="workposition" placeholder="Рабочее место" value="${editWorker.workposition}" class="form-control"/></p>
</div>
<div class="col-auto">
    <p><input type="text" name="idDepartment" aria-describedby="inputGroup-sizing-sm" placeholder="Номер департамента"
              class="form-control"/></p>
</div>
<input type="hidden" value="${editWorker.idWorker}" name="idWorker">

<input type="hidden" value="${_csrf.token}" name="_csrf">
</div>
<div class="col-auto">
    <p>
        <button type="submit" class="btn btn-primary">Редактировать</button>
    </p>
</div>
</form>
</body>
</html>
