<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<style type="text/css">
body {
	padding-top: 60px;
	background-color: #353535;
	color: #fff
}
</style>

<%@ include file="/HeadInfo.jsp"%>
</head>
<body>
	<%@include file="/Header.jsp"%>
	<div class="container">
		<div align="right">
			<input type="button" class="btn btn-primary" value="일정 추가"
				onclick="window.open('<%=cp%>/addevent.do', '','width=500, height=400')">
		</div>
		<div class="row" id="calendar">
			<div class="col-sm-12 col-lg-12">
				<iframe src="" style="border-width: 0" width="100%" height="600"
					frameborder="0"></iframe>
				<!-- CONTENT -->
				<div style="clear: both"></div>
			</div>
		</div>
	</div>
	<br>
	<%@include file="/Footer.jsp"%>


</body>
</html>

