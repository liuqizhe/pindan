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
    <title>ConsumeList</title>
</head>
<body>
  <div></div>
  <h2>消费查询</h2>
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
      <div>按日期查询消费(YYYY-MM-DD)：
          <input type="date" name="consTime"/>
          <input type="submit" value="查询"/>
      </div>
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
        <c:forEach items="${consumeList}" var="c">
          <tr>
            <td>${c.consNo}</td>
            <td>${c.restrant}</td>
            <td>${c.consPrice}</td>
            <td>${c.consTime}</td>
            <td>${c.user}</td>
          </tr>
        </c:forEach>
      </table>
      </div>
    </form>
  </div>
</body>
</html>
