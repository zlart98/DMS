<%--
  Created by IntelliJ IDEA.
  User: ostzna3
  Date: 06.09.2019
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags"%>
<html>
<head>
    <title>Worker</title>
    <link href="<c:url value="/css/style.css" />" rel="stylesheet">

</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<span style="color:red"><p><strong>${inputFormatException}</strong></p></span>

<div>
    <sec:authorize access="hasRole('ADMIN')">
    <div>
        <p><strong>Создание записи "Работник"</strong></p>
    </div>
    <form class="form-inline" action="/worker/saveOrUpdate" method="post" accept-charset="utf-8">
        <div class="form-row align-items-center">
        <div class="col-auto">
            <p><input type="text" name="name" placeholder="Имя" class="form-control" /></p>
        </div>
        <div class="col-auto">
            <p><input type="text" name="position" placeholder="Должность" class="form-control" /></p>
        </div>
        <div class="col-auto">
            <p><input type="text" name="workposition" placeholder="Рабочее место" class="form-control" /></p>
        </div>
        <div class="col-auto">
            <p><input type="text" name="idDepartment" aria-describedby="inputGroup-sizing-sm" placeholder="Номер департамента" class="form-control" /></p>
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        </div>
        <div class="col-auto">
            <p><button type="submit" class="btn btn-primary">Создать</button></p>
        </div>
    </form>
    </sec:authorize>
</div>
<div>
    <table class="table table-striped">
        <tr>
            <th scope="col">Имя</th>
            <th scope="col">Должность</th>
            <th scope="col">Рабочее место</th>
            <th scope="col">Номер департамента</th>
        </tr>
        <c:forEach var="worker" items="${workerList}">
            <tr>
                <td>${worker.name}</td>
                <td>${worker.position}</td>
                <td>${worker.workposition}</td>
                <td>${worker.departmentByIdDepartment.idDepartment}</td>
                <sec:authorize access="hasRole('ADMIN')">
                    <td><form action="/worker/removeWorker?idWorker=${worker.idWorker}" method="post" accept-charset="utf-8">
                        <button class="btn btn-primary" type="submit">Удалить</button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form></td>
<%--                <td><p><a href="/worker/removeWorker?idWorker=${worker.idWorker}">Убрать</a><p></td>--%>
<%--                <td><form action="/worker/saveOrUpdate?idWorker=${worker.idWorker}" method="post" accept-charset="utf-8">--%>
<%--                    <input type="text" name="name" placeholder="Имя" />--%>
<%--                    <input type="text" name="position" placeholder="Должность" />--%>
<%--                    <input type="text" name="workposition" placeholder="Место" />--%>
<%--                  <select name="idDepartment">--%>
<%--                         <c:forEach var="department" items="${departmentList}">--%>
<%--                         <option>${department.idDepartment}</option>--%>
<%--                         </c:forEach>--%>
<%--                     </select>--%>
<%--                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
<%--                    <button type="submit">Edit</button>--%>
<%--                </form></td>--%>

                <td><form class="form-inline" action="/worker/editWorker/${worker.idWorker}" method="get" accept-charset="utf-8">
                        <div class="col-auto">
                            <p><button type="submit" class="btn btn-primary">Редактировать</button></p>
                        </div>
                    </form></td>
                </sec:authorize>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
