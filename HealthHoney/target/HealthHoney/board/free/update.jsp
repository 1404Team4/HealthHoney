<?xml version="1.0" encoding="utf-8" ?>
<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/HeadInfo.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>글쓰기 / 수정</title>

<!-- ck editor 사용 위한 세팅 -->
<script type="text/javascript" src="/pp/ckeditor/ckeditor.js"></script>
<!--  -->
</head>
<body>
<%@include file="/Header.jsp" %>

<div style="width: 60%; margin:auto;">
   <table>
      <tr>
         <td>
            <c:if test="${not empty item && not empty item.writer}">
      <!-- item 이 비어있지 않으면 -->
      <div style="margin:auto;"><font color="#ffffff"><h1>글 수정</h1></font></div>
      <form action="<%=cp%>/free/update.board" method="post">
         <input type="hidden" name="no" value="${item.no }" />
   </c:if>
   <c:if test="${not empty item && empty item.writer }">
      <!-- item 이 비어있으면 -->
      <h1>답변</h1>
      <form action="<%=cp%>/free/reply.board" method="post">
         <input type="hidden" name="step" value="${item.step }" /> <input
            type="hidden" name="depth" value="${item.depth }" /> <input
            type="hidden" name="ref" value="${item.ref }" />
   </c:if>
   <c:if test="${empty item }">
      <!-- item 이 비어있으면 -->
      <h1>글 작성</h1>
      <form action="<%=cp%>/free/write.board" method="post">
   </c:if>
         </td>
      </tr>
      <tr>
         <td align=left bgcolor=#FFCCCC width=10%>글쓴이</td>
      </tr>
      <tr>
         <td><input type="text" class="form-control" readonly="readonly" name="writer" id="writer" value="${item.writer }" /></td>
      </tr>
      <tr>
         <td align=left bgcolor=#FFCCCC width=10%>제목</td>
      </tr>
      <tr>
         <td><input type="text" class="form-control" name="title" value="${item.title }" /></td>
      </tr>
      <tr>
         <td align=left bgcolor=#FFCCCC width=10%>내용</td>
      </tr>
      <tr>
         <td><textarea class="form-control" rows="10" cols="60" name="content" id="content">${item.content }</textarea>
      <script type="text/javascript">
         CKEDITOR.replace('content');
      </script></td>
      </tr>
   
   </table>

   <div>
      <font color="#ffffff">파일첨부 : <input type="file" name="file" /></font>
   </div>
   <br/>
   <!-- <input type="submit" value="저장" /> --> <button class="btn btn-warning" type="submit">저장</button> <input type="button" class="btn btn-default" value="목록"
         onclick="location.href='<%=cp%>/free/list.board'" />
</div>

   </form>
<%@include file="/Footer.jsp" %>

</body>
</html>