<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 04/28/21
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>AdminPage</title>
</head>
<body>
<table>
    <table border = "1">
        <tr>
            <th>customer_id</th>
            <th>customer_type_id</th>
            <th>customer_name</th>
            <th>customer_birthday</th>
            <th>customer_gender</th>
            <th>customer_id_card</th>
            <th>customer_phone</th>
            <th>customer_email</th>
            <th>customer_address</th>
        </tr>

        <c:forEach	items="${books}" var="book" >
            <tr>

                <td>${customer.id }</td>
                <td>${customer.type}</td>
                <td>${customer.name}</td>
                <td>${customer.birthday}</td>
                <td>${customer.gender}</td>
                <td>${customer.phone}</td>
                <td>${customer.card_id}</td>
                <td>${customer.email}</td>
                <td>${customer.address}</td>
            </tr>
        </c:forEach>
    </table>
</table>
</body>
</html>
