<%--
  Created by IntelliJ IDEA.
  User: liuqizhe
  Date: 15/10/13
  Time: 上午9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>TopupOne</title>
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
  <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <style type="text/css">
    .align-center{
      margin:0 auto;		/* 居中 这个是必须的，，其它的属性非必须 */
      width:500px;		/* 给个宽度 顶到浏览器的两边就看不出居中效果了 */
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
    <li class="active"><a href="../user/list.from">用户查询</a> </li>
    <li><a href="../consume/view.from">拼单消费</a> </li>
    <li><a href="../consume/list.from">消费查询</a> </li>
    <li><a href="../topup/list.from">充值查询</a> </li>
    <li><a href="../listPZ/list.from">账单查询</a> </li>
    <li><a href="../account/show.from">账户金额查询</a> </li>
  </ul>
</div>
  <div>

  </div>
  <div class="align-center">
    <h2>个人充值</h2>
    <form:form cssClass="form-inline" role="form" action="topupMoney.from" commandName="user" method="post">
      <div>充值员工编号：</div>
      <div>
      <form:input path="userNo" cssClass="readonly" readonly="true"/>
      </div>
      <br/>
      <div>充值金额：</div>
      <div>
      <input class="form-control" id="focusedInput" placeholder="请输入充值金额" type="number" name="money">
        <span class="label label-warning">${error}</span>
      </div>
      <br/>
      <div>
        <input class="btn btn-primary" type="submit" value="确认充值"/>
        <input class="btn btn-primary" type="button" value="取消" onclick="history.go(-1);"/>
      </div>
    </form:form>
  </div>
</body>
</html>
