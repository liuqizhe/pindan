<%--
  Created by IntelliJ IDEA.
  User: liuqizhe
  Date: 15/10/13
  Time: 下午4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>ListPZType</title>
</head>
<body>
  <div></div>
  <h2>账单查询</h2>
  <div>
    <div><span style="color: #f00">${error}</span></div>
    <form action="findListPZType.from" method="post">
      <div>
      <table border="1px">
        <tr>
        <td>账单编号</td>
        <td>账单类型</td>
        <td>金额</td>
        <td>账户余额</td>
        <td></td>
        </tr>
        <c:forEach items="${listPZ}" var="l">
          <tr>
            <td>${l.listNo}</td>
            <td>${l.listType}</td>
            <td>
              <c:choose>
                <c:when test="${l.listType=='t'}">
                  <font color="#080">${l.listMoney}</font>
                </c:when>
                <c:otherwise>
                  <font color="#f00">${l.listMoney}</font>
                </c:otherwise>
              </c:choose>
            </td>
            <td>${l.lastMoney}</td>
          </tr>
        </c:forEach>
      </table>
      </div>
      <div><input type="button" value="返回" onclick="history.go(-1);"/></div>
    </form>
  </div>
</body>
</html>
