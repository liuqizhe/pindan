<%--
  Created by IntelliJ IDEA.
  User: liuqizhe
  Date: 15/10/10
  Time: 下午4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>UserList</title>
    <script type="text/javascript">
      function deleteUser(userNo) {
        var r = window.confirm("确定删除"+userNo+"吗") ;
        if(r) {
          window.location="deleteUser.from?userNo="+userNo;
        }
      }
    </script>
</head>
<body>
  <div>
    <h2>用户列表</h2>
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
    <div><input type="button" value="添加" onclick="window.location='toAdd.from';"></div>
    <div>
      <form action="findUser.from" method="post">
        <div><span>查找编号：</span></div>
        <div><input type="text" name="userNo">
          <input type="submit" value="查找"><span style="color: #f00">${error}</span></div>
      </form>
    </div>
    <table border="1px">
      <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>加入日期</td>
        <td>钱包金额</td>
        <td>邮箱</td>
        <td>充值</td>
        <td>删除</td>
      </tr>
      <c:forEach items="${users}" var="u">
        <tr>
          <td>${u.userNo}</td>
          <td>${u.userName}</td>
          <td>${u.joinDate}</td>
          <td>${u.pokeyMoney}</td>
          <td>${u.userMail}</td>
          <td><input type="button" value="充值" onclick="location.href='toTopup.from?userNo=${u.userNo}';"/></td>
          <td><input type="button" value="删除" onclick="deleteUser(${u.userNo});"/></td>
        </tr>
      </c:forEach>
    </table>
  </div>
</body>
</html>
