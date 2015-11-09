<%--
  Created by IntelliJ IDEA.
  User: liuqizhe
  Date: 15/10/10
  Time: 下午4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" import="java.util.*" %>
<html>
<head>
    <title>UserAdd</title>
  <meta charset="utf-8">
  <meta name="viewpoint" content="width=device-width,initial-scal=1">
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
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
//    $(function() {
//      $('#sub').click(function() {
//        var name = $('#input1').val() ;
//        var mail = $('#input2').val() ;
//        if(name != "" && mail != "") {
//          alert(11) ;
//          document.newuser.action="/pindan/user/addUser.from";
//          document.newuser.submit() ;
//        }else{
//          $('#return').empty() ;
//          $('#return').append("请正确输入用户姓名和邮箱") ;
//        }
//      }) ;
//    }) ;
//    $(function() {
//      $('#sub').onclick(function() {
//        document.newuser.action="/pindan/user/addUser.from" ;
//        document.newuser.submit() ;
//      }) ;
//    }) ;
//function commit2() {
//  document.getElementById("new").action="/pindan/user/addUser.from" ;
//  document.getElementById("new").submit() ;
//}
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
    <li class="active"><a href="../user/list.from">用户查询</a> </li>
    <li><a href="../consume/view.from">拼单消费</a> </li>
    <li><a href="../consume/list.from">消费查询</a> </li>
    <li><a href="../topup/list.from">充值查询</a> </li>
    <li><a href="../listPZ/list.from">账单查询</a> </li>
    <li><a href="../account/show.from">账户金额查询</a> </li>
  </ul>
</div>
  <div class="align-center">
    <h2>添加用户</h2>
    <form name="newuser" action="addUser.from" method="post" class="form-inline" role="form" id="new">
      <div class="form-group"><span>姓名</span></div>
      <div class="input-group">
        <input type="text" class="width300" name="userName" class="form-control" id="input1" placeholder="请输入姓名"/>
      </div>
      <br/>
      <div class="form-group"><span>邮箱</span></div>
      <div class="input-group">
        <input type="email" class="width300" name="userMail" class="form-control" id="input2" placeholder="请输入邮箱"/>
      </div>
      <div><span class="label label-warning" id="return">${error}</span></div>
      <div>
        <input class="btn btn-primary" type="submit" value="保存" id="sub" onclick="commit2()"/>
        <input class="btn btn-primary" type="button" value="取消" onclick="history.go(-1);">
      </div>

    </form>
  </div>
</body>
</html>
