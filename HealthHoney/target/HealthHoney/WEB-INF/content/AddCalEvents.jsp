<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/HeadInfo.jsp"%>
<!-- Bootstrap -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="assets/css/main.css" rel="stylesheet">

</head>

<body>
	<div class="container">
		<span id="signinButton"> <span class="g-signin"
			data-callback="signinCallback"
			data-clientid="977578058440-6te7kh3mtob53g4p7gq40lik9oc6g2b5.apps.googleusercontent.com"
			data-redirecturi="postmessage" data-cookiepolicy="single_host_origin"
			data-accesstype="offline"
			data-scope="https://www.googleapis.com/auth/plus.login 
												https://www.googleapis.com/auth/plus.me 
												https://www.googleapis.com/auth/userinfo.email 
												https://www.googleapis.com/auth/userinfo.profile 
												https://www.googleapis.com/auth/calendar 
												https://www.googleapis.com/auth/fitness.activity.read 
												https://www.googleapis.com/auth/fitness.body.read">
		</span>
		</span>
		<form class="form-inline" id="new-event">
			<fieldset>
				<legend style="color: #ffffff;">
					<h2>Create an event into your Google Calendar!
				</legend>
				<br />
				<p>
					<i class="what"></i> <span id="what"></span> <i class="when"
						style="display: none"></i> <span id="when"></span> <i
						class="where" style="display: none"></i> <span id="where"></span>
					<i class="with" style="display: none"></i> <span id="with"></span>
				</p>
				<input type="text" id="event" class="input-xxlarge"
					placeholder="예) 다음주 화요일 오후 1시에 점심먹기 foo@mail.com bar@mail.com">
			</fieldset>
			<button type="submit" id="submit_button"
				class="btn btn-primary btn-block" data-loading-text="Wait...">Submit</button>
		</form>
<br/>
<br/>
<br/>
	</div>


	<%@include file="/Footer.jsp"%>
	<script>
		var access_token;
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-34925819-1' ]);
		_gaq.push([ '_trackPageview' ]);
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/underscore-min.js"></script>
	<script src="assets/js/sugar-1.3.5.js"></script>
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/cal.js?7"></script>
</body>
</html>