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
</head>
<body>
  <div></div>
  <h2>拼单消费</h2>
  <div>
    <div><h4>进行拼单！！</h4></div>
    <div>

      <form:form name="Consume" action="commitConsume.from" commandName="consume" method="post">
        <div>拼单餐厅：<form:input path="restrant" cssClass="readonly" readonly="true"/> </div>
        <div>拼单金额：<form:input path="consPrice" cssClass="readonly" readonly="true"/> </div>
        <!--
        <div>

          <input type="button" value="确认消费" onclick="commit1();"/>

        </div>
        -->
        <div><table border="1px">
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
        <div><span style="color: #f00">${error}</span></div>
        <input type="button" value="上一步" onclick="history.go(-1);"/>
        <input type="submit" value="确认消费"/>
        <input type="button" value="取消" onclick="location.href='view.from';"/>
      </form:form>
    </div>

  </div>
</body>
</html>
