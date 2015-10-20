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
</head>
<body>
  <div></div>
  <h2>拼单消费</h2>
  <div>
    <div><h4>进行拼单！！</h4></div>
    <div>
      <form  name="toNext" action="toOnesConsume.from" method="post">
        <div>拼单餐厅：<input type="text" name="restrant"/></div>
        <div>拼单金额：<input type="number" name="consPrice"></div>
        <div><span style="color: #f00">${error}</span></div>
        <div>
          <input type="button" value="下一步" onclick="next(restrant,consPrice);"/>
          <input type="button" value="取消" onclick="history.go(-1);"/>
        </div>
      </form>
    </div>

  </div>
</body>
</html>
