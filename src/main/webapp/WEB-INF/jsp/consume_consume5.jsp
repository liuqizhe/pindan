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
  <script type="text/javascript" src="/pindan/js/json.js"></script>
  -->
  <script type="text/javascript" src="/pindan/js/jquery-1.11.1.js"></script>
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
    /*
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

    function change_page(page) {
      alert(page) ;
      var xhr = getXhr() ;
      xhr.onreadystatechange=function() {
        if(xhr.readyState==4&&xhr.status==200) {
          var result = xhr  .responseText ;
          alert(result) ;
          var list = result.parseJSON() ;
          document.getElementById("report").innerHTML = list ;
          alert(list) ;
        }
      } ;
      var uri = encodeURI("changePage2.from?page="+page) ;
      xhr.open("get",uri,true) ;
      xhr.send(null) ;
    }
    */

    //数字分页
    $(function() {
      $('.a1').click(function() {
        var page = $(this).text() ;
        //页码变色
        $('.a1').css("color","#3576ab") ;
        $(this).css("color","#f00") ;
        //记录当前页码
        $('#page').empty();
        $('#page').html(page) ;
        $.ajax({
          url:"changePage2.from?page="+page,
          type:"post" ,
          datatype:"json" ,
          success:function(data) {
            //写入用户选择表
            $('#tb1').empty() ;
            var obj = JSON.parse(data) ;
            for(i=0;i<obj.length;i++) {
              var s = obj[i] ;
              $('#tb1').append('<tr><td><input type="checkbox" value="'+s.userNo+'" name="User"/></td><td>'+s.userNo
                      + '</td><td>' + s.userName
                      + '</td><td>' + s.pokeyMoney
                      + '</td></tr>');
            }
          }
        }) ;
      }) ;
    }) ;

    //上一页分页
    $(function() {
      $('.alast').click(function() {
        var pn = $('#page').text() ;
        //确认不在第一页
        if(pn > 1) {
          //记录当前页码
          pn = parseInt(pn)-1 ;
          $('#page').empty();
          $('#page').html(pn) ;
          //页码变色
          $('.a1').css("color","#3576ab") ;
          $('#pages').find('a').eq(pn).css("color","#f00");
          $.ajax({
            url:"changePage2.from?page="+pn,
            type:"post" ,
            datatype:"json" ,
            success:function(data) {
              //写入用户选择表
              $('#tb1').empty() ;
              var obj = JSON.parse(data) ;
              for(i=0;i<obj.length;i++) {
                var s = obj[i] ;
                $('#tb1').append('<tr><td><input type="checkbox" value="'+s.userNo+'" name="User"/></td><td>'+s.userNo
                        + '</td><td>' + s.userName
                        + '</td><td>' + s.pokeyMoney
                        + '</td></tr>');
              }
            }
          }) ;
        }
      }) ;
    }) ;

    //下一页分页
    $(function() {
      $('.anext').click(function() {
        var total = $('.a1').last().text() ;
        var pn = $('#page').text() ;
        //确认不在最后一页
        if(pn < total) {
          //记录当前页码
          pn = parseInt(pn)+1 ;
          $('#page').empty();
          $('#page').html(pn) ;
          //页码变色
          $('.a1').css("color","#3576ab") ;
          $('#pages').find('a').eq(pn).css("color","#f00");
          $.ajax({
            url:"changePage2.from?page="+pn,
            type:"post" ,
            datatype:"json" ,
            success:function(data) {
              //写入用户选择表
              $('#tb1').empty() ;
              var obj = JSON.parse(data) ;
              for(i=0;i<obj.length;i++) {
                var s = obj[i] ;
                $('#tb1').append('<tr><td><input type="checkbox" value="'+s.userNo+'" name="User"/></td><td>'+s.userNo
                        + '</td><td>' + s.userName
                        + '</td><td>' + s.pokeyMoney
                        + '</td></tr>');
              }
            }
          }) ;
        }
      }) ;
    }) ;

    $(function() {
      $('#commit1').click(function() {
        //获取选择的用户的编号
        var stu1 = [] ;
        $(":checkbox:checked").each(function() {
          var uId1 = $(this).parent().siblings().eq(0).text() ;
          $(this).attr("checked",false) ;
          stu1.push({userNo:uId1}) ;
        }) ;
        //获取之前已选择的用户编号
        var stu2 = [] ;
        $('#gotten tbody tr').each(function() {
          var uId2 = $(this).children("td").eq(0).text() ;
          stu2.push({userNo:uId2}) ;
        }) ;
        //合并后转成json字符串
        var stu = $.merge(stu1,stu2);
        console.log($.unique(stu)) ;
        var str = JSON.stringify(stu) ;
        $.ajax({
          url:"getUser2.from?userNo="+str ,
          type:"post",
          datatype:"json" ,
          success:function(data){
            //写入参与用户表
            $('#tb2').empty() ;
            var userGet = JSON.parse(data) ;
            for(i=0;i<userGet.length;i++) {
              var s = userGet[i] ;
              $('#tb2').append('<tr><td>'+s.userNo
                      + '</td><td>' + s.userName
                      + '</td><td>' + s.pokeyMoney
                      + '</td><input type="hidden" name="UserGet" value="'+ s.userNo +'"/></tr>');
            }          }
        }) ;
      }) ;
    }) ;

    function commit2() {
      document.consInfo.action="/pindan/consume/consume1.from" ;
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
          <thead>
          <tr>
            <td>选择：</td>
            <td>用户编号：</td>
            <td>用户姓名：</td>
            <td>钱包余额：</td>
          </tr>
          </thead>
          <tbody id="tb1">
          <c:forEach items="${user}" var="u" >
            <tr>
              <td><input type="checkbox" value="${u.userNo}" name="User"/></td>
              <td>${u.userNo}</td>
              <td>${u.userName}</td>
              <td>${u.pokeyMoney}</td>
            </tr>
          </c:forEach>
          </tbody>

          <div style="display: none" id="page">${page.page}</div>
          <div id="pages">
            <a href="javascript:;" class="alast" id="alast">上一页</a>


            <c:forEach var="i" begin="1" end="${page.totalPage}">
              <c:choose>
                <c:when test="${i==page.page}">
                  <a href="javascript:;" style="color: #f00" class="a1" id="a1">${i}</a>
                </c:when>
                <c:otherwise>
                  <a href="javascript:;" class="a1" id="a1">${i}</a>
                </c:otherwise>
              </c:choose>
            </c:forEach>

            <c:choose>
              <c:when test="${page.page<page.totalPage}">
                <a href="javascript:;" class="anext" id="anext">下一页</a>
              </c:when>
              <c:otherwise><a>下一页</a></c:otherwise>
            </c:choose>
          </div>
        </table></div>
        <div><span class="label label-warning">${error}</span></div>
        <input class="btn btn-primary" type="button" value="确认选择" id="commit1"/>


        <div class="nav-center"><label>参与拼单用户</label></div>
        <div class="table-responsive"><table id="gotten" class="table table-striped table-bordered table-hover table-condensed">
          <thead>
          <tr>
            <td>用户编号：</td>
            <td>用户姓名：</td>
            <td>钱包余额：</td>
            <td></td>
          </tr>
          </thead>
          <tbody id="tb2">
          <c:forEach items="${userGet}" var="u" >
            <tr>
              <td>${u.userNo}</td>
              <td>${u.userName}</td>
              <td>${u.pokeyMoney}</td>
              <td><input type="hidden" name="UserGet" value="${u.userNo}"/></td>
            </tr>
          </c:forEach>
          </tbody>
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
