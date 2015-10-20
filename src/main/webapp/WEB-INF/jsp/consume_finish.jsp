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
</head>
<body>
  <div></div>
  <h2>消费成功</h2>
  <div>
    <div><h3>拼单消费成功！！</h3></div>
    <div>
      <h4>共<span style="color: #f00">${count}</span>人参加拼单，平均每人消费<span style="color: #f00">${onesPrice}</span>元</h4>
    </div>
    <div><input type="button" value="继续" onclick="location.href='view.from';"></div>

  </div>
</body>
</html>
