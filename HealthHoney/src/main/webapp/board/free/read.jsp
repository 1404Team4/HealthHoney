<?xml version="1.0" encoding="utf-8" ?>
<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/HeadInfo.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>게시물 보기</title>
<link type="text/css"
        href="/pp/css/custom-theme/jquery-ui-1.8.23.custom.css"
        rel="stylesheet" />
<style type="text/css">


</style>

</head>
<body>
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


<table class="readTable" align=center width=60% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td colspan=2 bgcolor=#FFCCCC height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
 
  
    <tr> 
    <td align=center bgcolor=#FFCCCC width=10%> 이 름 </td>
    <td bgcolor=#ffffff>${item.writer }</td>
    </tr>
    <tr>
    <td align=center bgcolor=#FFCCCC width=10%> 등록날짜 </td>
    <td bgcolor=#ffffff>${item.wdate }</td>
   </tr>
 
    <tr> 
     <td align=center bgcolor=#FFCCCC width=10%> 제 목</td>
     <td bgcolor=#ffffff width=500px>${item.title }</td>

   </tr>
   
   <tr>
   <td colspan=2 bgcolor=#ffffff>
    ${item.content }
   </td>
   </tr>
 <tr>
   <td colspan="4">
       
   </td>
   </tr>
   <tr> 
    <td colspan=4></td>
   </tr>
    <td colspan=2 align=right>
    <font color="#ffffff">
    조회수 :${item.rcount }
    </font> 
   </td>
   <tr>
   <td colspan=2 align=center>
               <input type="button" class="btn btn-default" value="목록" onclick="doList();" /> <input
                       type="button" class="btn btn-default" value="수정"
                       onclick="location.href='<%=cp %>/free/${item.no }/update.board'" /> <input
                       type="button" class="btn btn-default" value="답글"
                       onclick="location.href='<%=cp %>/free/${item.no }/reply.board'" /> <input
                       type="button" class="btn btn-default" value="삭제"
                       onclick="location.href='<%=cp %>/free/${item.no }/delete.board'" />
                       </td>
                       </tr>
   </table>

<script type="text/javascript" src="/pp/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
        src="/pp/js/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="/pp/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript">
        function doList() {
               document.forms['listForm'].submit();

        }
</script>

<%@include file="/Footer.jsp" %>

</body>
</html>