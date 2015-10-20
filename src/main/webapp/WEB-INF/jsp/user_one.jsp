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
    <title>UserOne</title>
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
    <h2>用户查找</h2>
    <div></div>
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
        <tr>
          <td>${user.userNo}</td>
          <td>${user.userName}</td>
          <td>${user.joinDate}</td>
          <td>${user.pokeyMoney}</td>
          <td>${user.userMail}</td>
          <td><input type="button" value="充值" onclick="location.href='toTopup.from?userNo=${user.userNo}';"/></td>
          <td><input type="button" value="删除" onclick="deleteUser(${u.userNo});"/></td>
        </tr>
      <input type="button" value="返回" onclick="history.go(-1);"/>
    </table>
  </div>
</body>
</html>
