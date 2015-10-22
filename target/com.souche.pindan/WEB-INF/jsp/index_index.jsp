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
    <title>PindanIndex</title>
  <meta charset="utf-8">
  <meta name="viewpoint" content="width=device-width,initial-scal=1">
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
  <div class="container">
    <div class="jumbotron">
      <div class="row">
        <div class="col-sm-4">
          <h1>拼单</h1>
          <p>一起来拼单！！！！</p>
        </div>
        <div class="col-sm-4">
          <ul class="pull-right">
            <li><h3><span class="glyphicon glyphicon-star"></span>团体聚餐</h3></li>
            <li><h3><span class="glyphicon glyphicon-star"></span>统一付款</h3></li>
            <li><h3><span class="glyphicon glyphicon-star"></span>AA结算</h3></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="nav-center" id="index_navi">
    <div>
    <ul class="nav nav-pills">
      <li class="active"><a href="../index/index.from">主页</a> </li>
      <li><a href="../user/list.from">用户查询</a> </li>
      <li><a href="../consume/view.from">拼单消费</a> </li>
      <li><a href="../consume/list.from">消费查询</a> </li>
      <li><a href="../topup/list.from">充值查询</a> </li>
      <li><a href="../listPZ/list.from">账单查询</a> </li>
      <li><a href="../account/show.from">账户金额查询</a> </li>
    </ul>
    </div>
  </div>
  <div class="bottom">
    <div class="container">
      <div class="col-md-4">
        <h3><span class="glyphicon glyphicon-heart"></span> Footer section 1</h3>
        <p>Content for the first footer section.</p>
      </div>
      <div class="col-md-4">
        <h3><span class="glyphicon glyphicon-star"></span> Footer section 2</h3>
        <p>Content for the second footer section.</p>
      </div>
      <div class="col-md-4">
        <h3><span class="glyphicon glyphicon-music"></span> Footer section 3</h3>
        <p>Content for the third footer section.</p>
      </div>
    </div>
  </div>
</body>
</html>
