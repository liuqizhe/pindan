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
    <title>ConsumeList</title><link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
  <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/pindan/js/jquery-1.11.1.js"></script>
  <style type="text/css">
    .align-center{
      margin:0 auto;		/* 居中 这个是必须的，，其它的属性非必须 */
      width:650px;		/* 给个宽度 顶到浏览器的两边就看不出居中效果了 */
      text-align:center; 	/* 文字等内容居中 */
    }
  </style>
  <script type="text/javascript">
    $(function() {
      $('#btn').click(function() {
        var str = $('#focusedInput').val() ;
        if(str.match(/^((?:19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/)) {
          $('#return').empty() ;
          $.ajax({
            url:"toTime.from?consTime="+str ,
            type:"post" ,
            datatype:"json",
            success:function(list) {
              $('#return').empty() ;
              $('#consList').empty() ;
              var obj = JSON.parse(list) ;
              for(i=0;i<obj.length;i++) {
                var c = obj[i] ;
                $('#consList').append('<tr><td>'+c.consNo+'</td><td>'+c.restrant+'</td><td>'+ c.consPrice+'</td><td>'+
                        c.consTime+'</td><td>'+ c.user+'</td></tr>') ;
              }
            }
          }) ;
        } else {
          $('#return').empty() ;
          $('#return').append("请输入正确的日期") ;
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
  <div class="align-center">
    <ul class="nav nav-pills">
      <li><a href="../index/index.from">主页</a> </li>
      <li><a href="../user/list.from">用户查询</a> </li>
      <li><a href="../consume/view.from">拼单消费</a> </li>
      <li class="active"><a href="../consume/list.from">消费查询</a> </li>
      <li><a href="../topup/list.from">充值查询</a> </li>
      <li><a href="../listPZ/list.from">账单查询</a> </li>
      <li><a href="../account/show.from">账户金额查询</a> </li>
    </ul>
  </div>
  <div class="align-center"><h2>消费查询</h2></div>
  <div class="align-center">
    <form action="" method="" class="form-inline" role="form">
      <div class="form-group"><label>按日期查询消费(YYYY-MM-DD)：</label></div>
      <div class="input-group"><input class="form-control" id="focusedInput" placeholder="YYYY-MM-DD" type="date" name="consTime"/>
        <span class="input-group-btn"><input class="btn btn-default" type="button" value="查询" id="btn"/></span>
        <span class="label label-warning" id="return"></span>
      </div>
      <div class="table-responsive">
      <table class="table table-striped table-bordered table-hover table-condesed">
        <thead>
        <tr>
        <td>消费编号</td>
        <td>消费餐厅</td>
        <td>消费金额</td>
        <td>消费时间</td>
          <td>参与用户</td>
        <td></td>
        </tr>
        </thead>
        <tbody id="consList">
        <c:forEach items="${consumeList}" var="c">
          <tr>
            <td>${c.consNo}</td>
            <td>${c.restrant}</td>
            <td>${c.consPrice}</td>
            <td>${c.consTime}</td>
            <td>${c.user}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      </div>
    </form>
  </div>
</body>
</html>
