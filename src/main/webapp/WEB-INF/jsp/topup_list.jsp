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
    <title>TopupList</title>
</head>
<body>
  <div></div>
  <h2>充值查询</h2>
  <div id="index_navi">
    <ul id="menu">
      <li><a href="">主页</a> </li>
      <li><a href="../user/list.from">用户查询</a> </li>
      <li><a href="../consume/view.from">拼单消费</a> </li>
      <li><a href="../consume/list.from">消费查询</a> </li>
      <li><a href="../topup/list.from">充值查询</a> </li>
      <li><a href="../listPZ/list.from">账单查询</a> </li>
      <li><a href="../account/show.from">账户金额查询</a> </li>
    </ul>
  </div>
  <div>
    <form action="toTime.from" method="post">
      <div>按日期查询充值(YYYY-MM-DD)：
          <input type="date" name="topupTime"/>
          <input type="submit" value="查询">
      </div>
      <div>
      <table border="1px">
        <tr>
        <td>充值编号</td>
        <td>充值用户</td>
        <td>金额</td>
        <td>充值时间</td>
        <td></td>
        </tr>
        <c:forEach items="${topupList}" var="t">
          <tr>
            <td>${t.topupNo}</td>
            <td>${t.userNo}</td>
            <td>${t.topupMoney}</td>
            <td>${t.topupTime}</td>
          </tr>
        </c:forEach>
      </table>
      </div>
    </form>
  </div>
</body>
</html>
