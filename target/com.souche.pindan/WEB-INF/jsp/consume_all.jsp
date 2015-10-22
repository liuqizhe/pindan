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
    <title>ConsumeView</title>
  <script type="text/javascript">
    function next(restrant,consPrice) {
      document.cookie = restrant + "," + consPrice ;
      window.toNext.submit();
    }
  </script>
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
      <form class="form-inline" role="form" name="toNext" action="toOnesConsume.from" method="post">
        <div class="form-group">拼单餐厅：</div>
        <div class="input-group"><input class="form-control" id="focusedInput" placeholder="请输入餐厅" type="text" name="restrant"/></div><br/>
        <div class="form-group">拼单金额：</div>
        <div class="input-group"><input class="form-control" id="focusedInput" placeholder="请输入金额" type="number" name="consPrice"></div><br/>
        <div><span class="label label-warning">${error}</span></div>
        <div><span class="label label-warning">${error1}</span> </div>
        <div>
          <input class="btn btn-primary" type="button" value="下一步" onclick="next(restrant,consPrice);"/>
          <input class="btn btn-primary" type="button" value="取消" onclick="history.go(-1);"/>
        </div>
      </form>
    </div>

  </div>
</body>
</html>
