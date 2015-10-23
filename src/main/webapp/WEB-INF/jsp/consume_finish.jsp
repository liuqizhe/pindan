<%--
  Created by IntelliJ IDEA.
  User: liuqizhe
  Date: 15/10/13
  Time: 下午4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ConsumeFinish</title>
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
    <li class="active"><a href="../consume/view.from">拼单消费</a> </li>
    <li><a href="../consume/list.from">消费查询</a> </li>
    <li><a href="../topup/list.from">充值查询</a> </li>
    <li><a href="../listPZ/list.from">账单查询</a> </li>
    <li><a href="../account/show.from">账户金额查询</a> </li>
  </ul>
</div>
<div class="row">
  <div class="nav-center"><h2>消费成功</h2></div>
    <div class="nav-center"><h3>拼单消费成功！！</h3></div>
    <div class="nav-center">
      <h4>共<span style="color: #f00">${count}</span>人参加拼单，平均每人消费<span style="color: #f00">${onesPrice}</span>元</h4>
    </div>
    <div class="nav-center"><input class="btn btn-success" type="button" value="继续" onclick="location.href='view.from';"></div>

  </div>
</body>
</html>
