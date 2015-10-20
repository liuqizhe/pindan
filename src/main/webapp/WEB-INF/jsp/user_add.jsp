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
</head>
<body>
  <div>

  </div>
  <div>
    <form action="addUser.from" method="post">
      <div class="text_info clearfix"><span>姓名</span></div>
      <div class="input_info">
        <input type="text" class="width300" name="userName"/>
      </div>
      <div class="text_info clearfix"><span>邮箱</span></div>
      <div class="input_info">
        <input type="email" class="width300" name="userMail"/>
      </div>
      <div><span style="color: #f00">${error}</span></div>
      <div>
        <input type="submit" value="保存"/>
        <input type="button" value="取消" onclick="history.go(-1);">
      </div>

    </form>
  </div>
</body>
</html>
