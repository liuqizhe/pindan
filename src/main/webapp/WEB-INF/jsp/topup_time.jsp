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
    <title>TopupTime</title>
</head>
<body>
  <div></div>
  <h2>充值日期查询</h2>
  <div id="index_navi">

  </div>
  <div>

      <div>
      <table border="1px">
        <tr>
        <td>充值编号</td>
        <td>充值用户</td>
        <td>金额</td>
        <td>充值时间</td>
        <td></td>
        </tr>
        <c:forEach items="${topupTime}" var="t">
          <tr>
            <td>${t.topupNo}</td>
            <td>${t.userNo}</td>
            <td>${t.topupMoney}</td>
            <td>${t.topupTime}</td>
          </tr>
        </c:forEach>
      </table>
      </div>
    <input type="button" value="返回" onclick="history.go(-1);"/>
  </div>
</body>
</html>
