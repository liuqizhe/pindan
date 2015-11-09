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
    <title>TopupList</title>
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
  <script type="text/javascript" src="/pindan/js/jquery-1.11.1.js"></script>
  <script type="text/javascript">
    /*
    //创建xhr对象
    function getXhr() {
      //为了应对所有的现代浏览器
      var xhr = null ;
      if(window.XMLHttpRequest) {
        xhr = new XMLHttpRequest() ;
      } else {
        xhr = new ActiveXObject("Microsoft.XMLHttp") ;
      }
      return xhr ;
    }

    function check_time() {
      //1.获取日期
      var str = document.getElementById("focusedInput").value ;
      alert(str) ;
      //2.使用ajax将日期发送到服务器端验证
      var xhr = getXhr() ;
      xhr.onreadystatechange=function() {
        if(xhr.readyState==4&&xhr.status==200) {
          //处理返回的文本
          var str = xhr.responseText ;
          alert(str) ;
          //获取用于显示文本的span标记
          var spanObj = document.getElementById("return") ;
          //赋值
          spanObj.innerHTML = str ;
        }
      } ;
      //使用js语言提供的编码方法对地址进行编码
      var uri = encodeURI("toError1.from?topupTime="+str) ;
      //规定请求的类型、URL 以及是否异步处理请求。
      xhr.open("get",uri,true) ;
      //将请求发送到服务器。
      xhr.send() ;
    }

    function check() {
      var str = document.getElementById("focusedInput").value ;
      alert(str) ;
    }
    */
    $(function() {
      $('#btn').click(function() {
        var str = $('#focusedInput').val() ;
        if(str.match(/^((?:19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/)) {
          $('#return').empty() ;
          $.ajax({
            url:"toTime.from?topupTime="+str ,
            type:"post" ,
            datatype:"json",
            success:function(list) {
              $('#return').empty() ;
              $('#topupList').empty() ;
              var obj = JSON.parse(list) ;
              for(i=0;i<obj.length;i++) {
                var t = obj[i] ;
                $('#topupList').append('<tr><td>'+t.topupNo+'</td><td>'+t.userNo+'</td><td>'+t.topupMoney+'</td><td>'+t.topupTime+'</td></tr>') ;
              }
            }
          }) ;
        } else {
          $.ajax({
            url:"toError1.from",
            type:"get" ,
            datatype:"json",
            success:function(back) {
              $('#return').empty() ;
              $('#return').append(back) ;
            }
          }) ;
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
      <li><a href="../consume/list.from">消费查询</a> </li>
      <li class="active"><a href="../topup/list.from">充值查询</a> </li>
      <li><a href="../listPZ/list.from">账单查询</a> </li>
      <li><a href="../account/show.from">账户金额查询</a> </li>
    </ul>
  </div>
  <div class="align-center"><h2>充值查询</h2></div>
  <div class="align-center">
    <form action="" method="" class="form-inline" role="form">
      <div class="form-group"><label>按日期查询充值(YYYY-MM-DD)：</label></div>
      <div class="input-group"><input class="form-control" id="focusedInput" placeholder="YYYY-MM-DD" type="date" name="focusedInput"/>
        <span class="input-group-btn"><input id="btn" class="btn btn-default" type="button" value="查询"></span>
        <span class="label label-warning" id="return"></span>
      </div>
      <div class="table-responsive">
      <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr>
        <td>充值编号</td>
        <td>充值用户</td>
        <td>金额</td>
        <td>充值时间</td>
        <td></td>
        </tr>
        </thead>
        <tbody id="topupList">
        <c:forEach items="${topupList}" var="t">
          <tr>
            <td>${t.topupNo}</td>
            <td>${t.userNo}</td>
            <td>${t.topupMoney}</td>
            <td>${t.topupTime}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      </div>
    </form>
  </div>
</body>
</html>
