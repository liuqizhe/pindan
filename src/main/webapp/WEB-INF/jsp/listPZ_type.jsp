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
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
  <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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
<div class="nav-center">
  <ul class="nav nav-pills">
    <li><a href="../index/index.from">主页</a> </li>
    <li><a href="../user/list.from">用户查询</a> </li>
    <li><a href="../consume/view.from">拼单消费</a> </li>
    <li><a href="../consume/list.from">消费查询</a> </li>
    <li><a href="../topup/list.from">充值查询</a> </li>
    <li class="active"><a href="../listPZ/list.from">账单查询</a> </li>
    <li><a href="../account/show.from">账户金额查询</a> </li>
  </ul>
</div>
  <div class="nav-center"><h2>账单查询</h2></div>
  <div>
    <div><span class="label label-warning">${error}</span></div>
    <form action="findListPZType.from" method="post">
      <div class="table-responsive">
      <table class="table table-striped table-bordered table-hover table-condensed">
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
      <div class="nav-center"><input class="btn btn-primary" type="button" value="返回" onclick="history.go(-1);"/></div>
    </form>
  </div>
</body>
</html>
