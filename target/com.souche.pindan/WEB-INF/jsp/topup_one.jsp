<%--
  Created by IntelliJ IDEA.
  User: liuqizhe
  Date: 15/10/13
  Time: 上午9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>TopupOne</title>
</head>
<body>
  <div>

  </div>
  <div>
    <h2>个人充值</h2>
    <form:form action="topupMoney.from" commandName="user" method="post">
      <div>充值员工编号：</div>
      <div>
      <form:input path="userNo" cssClass="readonly" readonly="true"/>
      </div>
      <div>充值金额：</div>
      <div>
      <input type="number" name="money"><span style="color: #f00">${error}</span>
      </div>
      <div>
        <input type="submit" value="确认充值"/>
        <input type="button" value="取消" onclick="history.go(-1);"/>
      </div>
    </form:form>
  </div>
</body>
</html>
