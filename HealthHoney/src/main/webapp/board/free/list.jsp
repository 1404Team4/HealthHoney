<?xml version="1.0" encoding="UTF-8" ?>
<%@ page  contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
   String cp = request.getContextPath();
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/HeadInfo.jsp"%>
<%
   System.out.println("asdfsadf    :" + cp);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Free Board</title>
<style type="text/css">
/* 
.mainouter {
   background-image:
      url("http://cfs.tistory.com/custom/blog/92/928179/skin/images/");
}

.footer {
   background-image:
      url("http://cfs.tistory.com/custom/blog/92/928179/skin/images/");
}

.myBoard th {
   text-align: center;
   border-style: solid;
   border-color: #000000;
   padding: 7px 3px;
   background-color: #555555;
}

.myBoard td {
   text-align: center;
   border-style: dotted;
   border-color: #000000;
   padding: 6px;
}

.myBoard tr {
   border-style: inset;
   border-color: #ffffff;
   background-color: #dcdcdc;
   
}

#line td {
   
}

/* 아직 안가본 곳,  가본 곳 */

.myBoard tr {
   background-color: null;
   text-align: center;
   border-color: #000000;
   border-style: solid;
   border-width: 1px;
   background-color: #ffffff;
}

.myBoard th {
   text-align: center;
   text-color: #ffffff;
}

.myBoard a:LINK, .myBoard a:VISITED {
        text-decoration: none; color: black;
}

.myBoard a:HOVER { /* 마우스 커서 올렸을때 */
   text-decoration: underline;
   color: #366;
   font-weight: bold;

}

.myBoard a:ACTIVE { /* 마우스 버튼을 눌렀을때 */
   text-decoration: none;
   color: black;
} */
</style>


</head>
<body onload="init();">
<%@include file="/Header.jsp" %>

   <form action="<%=cp%>/free/list.board" name="listForm">
      <input type="hidden" name="key" value="${param.key }" />
      <%
         String value = request.getParameter("value") == null ? "" : request
               .getParameter("value");
         if (value != null && !"".equals(value))
            value = new String(value.getBytes("iso-8859-1"), "UTF-8");
      %>
      <input type="hidden" name="value" value="<%=value%>" /> <input
         type="hidden" name="page" value="${param.page }" />

   </form>
   <div class="mainouter" align="center">
      <h1 style="color: #ffffff">Free Board</h1>
      <div style="width: 640px;" align="left">
         
      </div>
      <table class="myBoard" width="70%" border="1">
         <tr style="background-color: #fcc">
            <th width="10%">글번호</th>
            <th width="55%">글제목</th>
            <th width="10%">글쓴이</th>
            <th width="15%">작성일</th>
            <th width="10%">조회수</th>
         </tr>
         <c:forEach var="item" items="${list }">
            <tr>
               <td>${item.no }</td>
               <%--           <td style="text-align: left; padding-left: 20px;"><a href="<%=cp %>/free/read.board?no=${item.no}">      ${item.title } (<span style="color: red;">${item.replycount}</span>)</a></td> --%>
               <td style="text-align: left; padding-left: 20px;"><a
                  href="javascript:doRead(${item.no});"> ${item.title } </a></td>
               <td>${item.writer }</td>
               <td>${item.wdate }</td>
               <td>${item.rcount }</td>
            </tr>
         </c:forEach>
         <tr>
            <td colspan="5" align="center">&lt; <c:forEach var="i"
                  begin="1" end="${totPage }">
                  <!-- ${totPage} -->
                  <c:if test="${page != i }">
                     <!-- 현재 페이지가 아닐때 -->
                     <a href="javascript:doList('${i }');">${i }</a>
                  </c:if>
                  <c:if test="${page == i }">
                     <!-- 현재 페이지 -->
                     <span style="font-weight: bold; color: red;">${i }</span>
                  </c:if>
               </c:forEach> &gt;
            </td>
         </tr>
         
         <tr>
            <td colspan="5" align="center">
               <form action="<%=cp%>/free/list.board">
                  <div style="float:left; margin-right:10px; margin-left:370px;">
                  <select name="key">
                     <option value="title">제목</option>
                     <option value="content">내용</option>
                     <option value="writer">글쓴이</option>
                  </select>
                  </div>
                  <div style="float:left; margin-right:10px;"><input type="text" class="form-control" name="value" style="width:200px;" /></div>
                  <div style="float:left; margin-right:10px;">
                  <!-- <input type="submit" name="search" value="검색" class="btn btn-default"/> -->
                  <button class="btn btn-default" type="submit" name="search">검색</button>
                  </div>
                  <div style="float:left; margin-left:300px;"><a href="write.board"><input type="button" class="btn btn-warning" value="글쓰기"/></a></div>
               </form>
            </td>
         </tr>
      </table>
   </div>


   <script>
/* function init() {
        no = setInterval(setTime, 1000);
}
function setTime() {
        var target = document.getElementById('target');
        var date = new Date();
        target.innerHTML = date.toLocaleString();
} */
function doList(page) {
        document.forms['listForm'].page.value = page;
        document.forms['listForm'].submit();
}
function doRead(no) {
       
   var f = document.forms['listForm'];
    
    f.action = '<%=cp%>/free/' + no + '/read.board';
         f.submit();
}
   </script>
<%@include file="/Footer.jsp" %>
</body>
</html>