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
  <div class="align-center"><h2>消费日期查询</h2></div>
  <div class="align-center">

      <div class="table-responsive">
      <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
        <td>消费编号</td>
        <td>消费餐厅</td>
        <td>消费金额</td>
        <td>消费时间</td>
          <td>参与用户</td>
        <td></td>
        </tr>
        <c:forEach items="${consumeTime}" var="c">
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
    <input class="btn btn-default" type="button" value="返回" onclick="history.go(-1);"/>
  </div>
</body>
</html>
