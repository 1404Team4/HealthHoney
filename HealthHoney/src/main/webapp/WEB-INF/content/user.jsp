<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<style>
ok {
	float: left;
}
</style>
<%@include file="/HeadInfo.jsp"%>
</head>
<body>

	<%@include file="/Header.jsp"%>


	<div class="container">
		<div class="row">

			<div class="col-lg-6">
				<div class="register-info-wraper">
					<div id="register-info">

						<!-- --------------------------------------- -->
						<div class="cont2">
							<img id="img-circle" src="assets/img/face.jpg" class="img-circle" width="150">
							<h2>
								<div id="Dname" align="center">${userInfo[0].displayName}</div>
							</h2>
						</div>
						<!-- --------------------------------------- -->

						<div class="row">
							<div class="col-lg-3">
								<div class="cont3">
									<ok>이름:&nbsp;</ok>
									<div id="Gname">${userInfo[0].name.givenName}</div>
									<ok>성:&nbsp;</ok>
									<div id="Fname">${userInfo[0].name.familyName}</div>
									<ok>별명:&nbsp;</ok>
									<div id="Nick">${userInfo[0].nickname}</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="cont3">
									<div class=".col-xs-6 .col-sm-3 .col-md-2">
										<ok>E-Mail:&nbsp;</ok>
										<div id="Email">${userInfo[0].emails[0].value}</div>
										<ok>성별:&nbsp;</ok>
										<div id="Gender">${userInfo[0].gender}</div>
									</div>
								</div>
							</div>
							<!-- /inner row -->
							

						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="register-info-wraper">
					<div id="register-info">

						<div class="cont2">
							<h2>자기 소개</h2>
						</div>

						<div class="row">
							<div class="col-lg-5">
								<div class="cont3">
									<div id="AboutMe">${userInfo[0].aboutMe}</div>
								</div>
							</div>
						</div>
						<!-- /inner row -->

						<hr />
						<div class="cont2">
							<h2>Choose Your Option</h2>
						</div>
						<br />

						<div class="info-user2">
							<a href="main" data-toggle="tooltip" title="메인화면"><span
								aria-hidden="true" class="li_shop fs1"></span></a> <a
								href="https://myaccount.google.com/" target="_new"
								data-toggle="tooltip" title="정보수정(구글)"><span
								aria-hidden="true" class="li_settings fs1"></span></a> <a
								href="https://mail.google.com/mail/u/0/" target="_new"
								data-toggle="tooltip" title="G메일"><span aria-hidden="true"
								class="li_mail fs1"></span></a> <a href="main?cmd=CALENDAR"
								data-toggle="tooltip" title="일정"><span aria-hidden="true"
								class="li_calendar fs1"></span></a> <a
								href="https://drive.google.com/drive" target="_new"
								data-toggle="tooltip" title="구글 드라이브"><span
								aria-hidden="true" class="li_data fs1"></span></a> <a
								href="https://plus.google.com/u/0/photos" target="_new"
								data-toggle="tooltip" title="구글 사진"><span aria-hidden="true"
								class="li_camera fs1"></span></a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/Footer.jsp"%>
	<script>
		
	</script>
</body>
</html>