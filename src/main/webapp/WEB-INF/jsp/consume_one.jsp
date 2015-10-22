<%--
  Created by IntelliJ IDEA.
  User: liuqizhe
  Date: 15/10/13
  Time: 下午4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>ConsumeView</title>
  <!--
  <script type="text/javascript">
    function commit2() {
      var user = document.getElementsByName('User') ;
      var count = 0 ;
      var u = '';
      for (var i=0 ; i<user.length ; i++){
        if(user[i].checked) {
          u+=user[i].value+',';
          count ++ ;
        }
      }

      window.alert(u==''?'你还没有选择任何内容！':u);

    }

    function commit1() {
      document.Consume.submit();
    }

  </script>
  -->
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
  <div class="nav-center"><h2>拼单消费</h2></div>
  <div>
    <div class="nav-center"><h4>进行拼单！！</h4></div>
    <div class="nav-center">

      <form:form name="Consume" action="commitConsume.from" commandName="consume" method="post">
        <div>拼单餐厅：<form:input path="restrant" cssClass="readonly" readonly="true"/> </div>
        <div>拼单金额：<form:input path="consPrice" cssClass="readonly" readonly="true"/> </div>
        <!--
        <div>

          <input type="button" value="确认消费" onclick="commit1();"/>

        </div>
        -->
        <div class="table-responsive"><table class="table table-striped table-bordered table-hover table-condensed">
          <tr>
            <td>选择：</td>
            <td>用户编号：</td>
            <td>用户姓名：</td>
            <td>钱包余额：</td>
          </tr>
          <c:forEach items="${user}" var="u" >
            <tr>
              <td><input type="checkbox" value="${u.userNo}" name="User"/></td>
              <td>${u.userNo}</td>
              <td>${u.userName}</td>
              <td>${u.pokeyMoney}</td>
            </tr>
          </c:forEach>
        </table></div>
        <div><span class="label label-warning">${error}</span></div>
        <input class="btn btn-primary" type="button" value="上一步" onclick="history.go(-1);"/>
        <input class="btn btn-primary" type="submit" value="确认消费"/>
        <input class="btn btn-primary" type="button" value="取消" onclick="location.href='view.from';"/>
      </form:form>
    </div>

  </div>
</body>
</html>
