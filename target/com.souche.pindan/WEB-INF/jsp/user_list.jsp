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
  <meta charset="utf-8">
  <meta name="viewpoint" content="width=device-width,initial-scal=1">
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
  <style type="text/css">
    .nav-center{
      margin:0 auto;		/* 居中 这个是必须的，，其它的属性非必须 */
      width:650px;		/* 给个宽度 顶到浏览器的两边就看不出居中效果了 */
      text-align:center; 	/* 文字等内容居中 */
    }
  </style>

</head>
<body>
<div class="container"><div class="jumbotron">
  <h1>拼单</h1>
  <p>一起来拼单！！！！</p>
</div></div>
  <div class="container">
    <div class="nav-center">
      <ul class="nav nav-pills">
        <li><a href="../index/index.from">主页</a> </li>
        <li class="active"><a href="../user/list.from">用户查询</a> </li>
        <li><a href="../consume/view.from">拼单消费</a> </li>
        <li><a href="../consume/list.from">消费查询</a> </li>
        <li><a href="../topup/list.from">充值查询</a> </li>
        <li><a href="../listPZ/list.from">账单查询</a> </li>
        <li><a href="../account/show.from">账户金额查询</a> </li>
      </ul>
    </div>
    <div class="nav-center"><h2>用户列表</h2></div>
    <div class="nav-center"><input type="button" value="添加" class="btn btn-default" onclick="window.location='toAdd.from';"></div>
    <div class="container">
      <form action="findUser.from" method="post" class="form-inline" role="form">
        <div class="form-group"><label>按编号查询</label></div>
        <div class="input-group">
          <input type="text" name="userNo" class="form-control" id="focusedInput" placeholder="请输入编号">
          <span class="input-group-btn"><input type="submit" value="查找" class="btn btn-default"></span>
          <span class="label label-warning">${error}</span></div>
      </form>
    </div>
    <div class="table-responsive container">
    <table class="table table-striped table-bordered table-hover table-condensed">
      <thead>
      <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>加入日期</td>
        <td>钱包金额</td>
        <td>邮箱</td>
        <td>充值</td>
        <td>删除</td>
      </tr>
      </thead>
      <c:forEach items="${users}" var="u">
        <tbody>
        <tr>
          <td>${u.userNo}</td>
          <td>${u.userName}</td>
          <td>${u.joinDate}</td>
          <td>${u.pokeyMoney}</td>
          <td>${u.userMail}</td>
          <td><input class="btn btn-primary" type="button" value="充值" onclick="location.href='toTopup.from?userNo=${u.userNo}';"/></td>
          <td><input class="btn btn-primary" type="button" value="删除" onclick="deleteUser(${u.userNo});"/></td>
        </tr>
        </tbody>
      </c:forEach>
    </table>
    </div>
  </div>

  <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>
