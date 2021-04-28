<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 04/28/21
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insertCustomer</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/insertCustomerServlet" method = "POST" enctype="multipart/form-data>

        <input type="number" name="type" placeholder="type_id"><br>
        <input type="text" name="name" placeholder="name"><br>
        <input type="text" name="birthday" placeholder="birthday"><br>
        <select name="gender" id="">
            <option value="1">Male</option>
            <option value="0">Female</option>
        </select>
        <input type="text" name="phone" placeholder="phone"><br>
        <input type="number" name="card_id" placeholder="card_id"><br>
        <input type="text" name="email" placeholder="email"><br>
        <input type="text" name="address" placeholder="address"><br>

        <input type="submit" value="insert">

</form>
</body>
</html>
