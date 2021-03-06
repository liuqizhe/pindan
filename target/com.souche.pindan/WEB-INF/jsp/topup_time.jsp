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
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
  <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <style type="text/css">
    .align-center{
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
<div class="align-center">
  <ul class="nav nav-pills">
    <li><a href="../index/index.from">主页</a> </li>
    <li><a href="../user/list.from">用户查询</a> </li>
    <li><a href="../consume/view.from">拼单消费</a> </li>
    <li><a href="../consume/list.from">消费查询</a> </li>
    <li class="active"><a href="../topup/list.from">充值查询</a> </li>
    <li><a href="../listPZ/list.from">账单查询</a> </li>
    <li><a href="../account/show.from">账户金额查询</a> </li>
  </ul>
</div>
  <div class="align-center"><h2>充值日期查询</h2></div>
  <div class="align-center">

      <div class="table-responsive">
      <table class="table table-striped table-bordered table-hover table-condensed">
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
    <input class="btn btn-default" type="button" value="返回" onclick="history.go(-1);"/>
  </div>
</body>
</html>
