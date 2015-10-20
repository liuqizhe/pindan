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
    <title>ConsumeTime</title>
</head>
<body>
  <div></div>
  <h2>消费日期查询</h2>
  <div id="index_navi">

  </div>
  <div>

      <div>
      <table border="1px">
        <tr>
        <td>消费编号</td>
        <td>消费餐厅</td>
        <td>消费金额</td>
        <td>消费时间</td>
          <td>参与用户</td>
        <td></td>
        </tr>
        <c:forEach items="${consumeTime}" var="c">
          <tr>
            <td>${c.consNo}</td>
            <td>${c.restrant}</td>
            <td>${c.consPrice}</td>
            <td>${c.consTime}</td>
            <td>${userNo}</td>
          </tr>
        </c:forEach>
      </table>
      </div>
    <input type="button" value="返回" onclick="history.go(-1);"/>
  </div>
</body>
</html>
