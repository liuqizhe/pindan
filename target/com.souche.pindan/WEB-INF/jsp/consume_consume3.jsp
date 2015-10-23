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
  <script type="text/javascript">
    function commit1() {
      document.consInfo.action="/pindan/consume/getUser.from";
      document.consInfo.submit();
    }

    function commit2() {
      document.consInfo.action="/pindan/consume/falseCommit.from";
      document.consInfo.submit() ;
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
<div class="nav-center">
  <ul class="nav nav-pills">
    <li><a href="../index/index.from">主页</a> </li>
    <li><a href="../user/list.from">用户查询</a> </li>
    <li class="active"><a href="../consume/view.from">拼单消费</a> </li>
    <li><a href="../consume/list.from">消费查询</a> </li>
    <li><a href="../topup/list.from">充值查询</a> </li>
    <li><a href="../listPZ/list.from">账单查询</a> </li>
    <li><a href="../account/show.from">账户金额查询</a> </li>
  </ul>
</div>
  <div class="nav-center"><h2>拼单消费</h2></div>
  <div>
    <div class="nav-center"><h4>进行拼单！！</h4></div>
    <div class="nav-center">

      <form name="consInfo" class="form-inline" role="form" method="post">
        <div class="form-group">拼单餐厅：</div>
        <div class="input-group"><input class="form-control" id="focusedInput" placeholder="请输入餐厅" type="text" name="restrant"/></div><br/>
        <div class="form-group">拼单金额：</div>
        <div class="input-group"><input class="form-control" id="focusedInput" placeholder="请输入金额" type="number" name="consPrice"/></div><br/>


        <div class="nav-center"><label>选择拼单用户</label></div>
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

          <div id="pages">
            <c:choose>
              <c:when test="${page.page>1}">
                <a href="toConsume.from?page=${page.page-1}">上一页</a>
              </c:when>
              <c:otherwise><a>上一页</a></c:otherwise>
            </c:choose>

            <c:forEach var="i" begin="1" end="${page.totalPage}">
              <c:choose>
                <c:when test="${i==page.page}">
                  <a href="toConsume.from?page=${i}" style="color: #f00">${i}</a>
                </c:when>
                <c:otherwise>
                  <a href="toConsume.from?page=${i}">${i}</a>
                </c:otherwise>
              </c:choose>
            </c:forEach>

            <c:choose>
              <c:when test="${page.page<page.totalPage}">
                <a href="toConsume.from?page=${page.page+1}">下一页</a>
              </c:when>
              <c:otherwise><a>下一页</a></c:otherwise>
            </c:choose>
          </div>
        </table></div>
        <div><span class="label label-warning">${error}</span></div>
        <input class="btn btn-primary" type="button" value="确认选择" onclick="commit1()"/>


        <div class="nav-center"><label>参与拼单用户</label></div>
        <div class="table-responsive"><table class="table table-striped table-bordered table-hover table-condensed">
          <tr>
            <td>用户编号：</td>
            <td>用户姓名：</td>
            <td>钱包余额：</td>
            <td></td>
          </tr>
          <c:forEach items="${userGet}" var="u" >
            <tr>
              <td>${u.userNo}</td>
              <td>${u.userName}</td>
              <td>${u.pokeyMoney}</td>
              <td></td>
            </tr>
          </c:forEach>
        </table></div>

        <input class="btn btn-primary" type="button" value="确认消费" onclick="commit2()"/>
        <input class="btn btn-primary" type="button" value="取消" onclick="location.href='view.from';"/>
        <!--
        <div>

          <input type="button" value="确认消费" onclick="commit1();"/>

        </div>
        -->
      </form>
    </div>

  </div>
</body>
</html>
