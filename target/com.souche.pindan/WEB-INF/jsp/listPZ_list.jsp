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
    <title>ListPZList</title>
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
  <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/pindan/js/jquery-1.11.1.js"></script>
  <style type="text/css">
    .nav-center{
      margin:0 auto;		/* 居中 这个是必须的，，其它的属性非必须 */
      width:650px;		/* 给个宽度 顶到浏览器的两边就看不出居中效果了 */
      text-align:center; 	/* 文字等内容居中 */
    }
  </style>
  <script type="text/javascript">
    $(function() {
      $('#btn').click(function() {
        var listType = $('#listType').val() ;
        if(listType != 0) {
          $('#return').empty() ;
          $.ajax({
            url:"toType.from?listType="+listType ,
            type:"post" ,
            datatype:"json",
            success:function(list) {
              $('#return').empty() ;
              $('#listPZ').empty() ;
              var obj = JSON.parse(list) ;
              for(i=0;i<obj.length;i++) {
                var l = obj[i] ;
                $('#listPZ').append('<tr><td>'+ l.listNo+'</td><td>'+ l.listType+'</td><td>'+ l.listDate+'</td><td>'+
                        l.listMoney+'</td><td>'+ l.lastMoney+'</td></tr>') ;
              }
            }
          }) ;
        } else {
          $('#return').empty() ;
          $('#return').append("请选择账单类型") ;
        }
      }) ;
    }) ;
  </script>
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
  <div class="nav-center">
    <form action="toType.from" method="post" class="form-inline" role="form">
      <div>按类型查询账单：
          <select id="listType" name="listType" class="form-control">
            <option value="0">请选择</option>
            <option value="t">充值</option>
            <option value="c">消费</option>
            <option value="d">删除人员</option>
          </select>
         <input class="btn btn-primary" type="button" value="查询" id="btn"/>
        <span class="label label-warning" id="return"></span>
      </div>
      <div class="table-responsive">
      <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr>
        <td>账单编号</td>
        <td>账单类型</td>
        <td>账单日期</td>
        <td>金额</td>
        <td>账户余额</td>
        <td></td>
        </tr>
        </thead>
        <tbody id="listPZ">
        <c:forEach items="${listPZ}" var="l">
          <tr>
            <td>${l.listNo}</td>
            <td>${l.listType}</td>
            <td>${l.listDate}</td>
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
        </tbody>
      </table>
      </div>
    </form>
  </div>
</body>
</html>
