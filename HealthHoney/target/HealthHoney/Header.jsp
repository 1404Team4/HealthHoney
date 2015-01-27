<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  구글로그인버튼 스타일 -->
  <style type="text/css">
    #customBtn {
      display: inline-block;
      background: #cc3732;
      color: white;
      width: 175px;
      border-radius: 5px;
    }
    #customBtn:hover {
      background: #e74b37;
      cursor: hand;
    }
    span.label {
      font-weight: bold;
    }
    span.icon {
      background: url('/+/images/branding/btn_red_32.png') transparent 10px 50% no-repeat;
      display: inline-block;
      vertical-align: middle;
      width: 40px;
      height: 40px;
    }
    span.buttonText {
      display: inline-block;
      vertical-align: middle;
      padding-left: 40px;
      padding-right: 40px;
    }
  </style>

	<!-- NAVIGATION MENU -->

		<div class="navbar-nav navbar-inverse navbar-fixed-top">
		   <div class="container">
		      <div class="navbar-header">
		         <button type="button" class="navbar-toggle" data-toggle="collapse"
		            data-target=".navbar-collapse">
		            <span class="icon-bar"></span> <span class="icon-bar"></span> <span
		               class="icon-bar"></span>
		         </button>
		         
		         <a class="navbar-brand" href="<%=cp%>/index.do"><img
			            src="<%=cp%>/assets/img/logo.png" width="21" alt="">&nbsp;Team4 HEALTH KIT</a>
			      </div>
			      <div class="navbar-collapse collapse">
			         <ul class="nav navbar-nav">
			            <li><%-- <a href="<%=cp%>/main?cmd=INDEX"> --%><a href="<%=cp%>/index.do"><i
			                  class="icon-home icon-white"></i> Home</a></li>
			            <li><a href="<%=cp%>/calendar.do"><i
			                  class="icon-calendar icon-white"></i> Calendar</a></li>
			            <li><a href="<%=cp%>/table.do"><i class="icon-th icon-white"></i>
			                  Tables</a></li>
			            <li><a href="<%=cp%>/user.do"><i class="icon-user icon-white"></i>
			                  User</a></li>
			            <li>
			               <div class="dropdown" style="margin-top: 15px; margin-left: 15px">
			                  <a id="dLabel" role="button" data-toggle="dropdown"
			                     data-target="#" href="#"> 게시판 <span class="caret"></span>
			                  </a>
			                  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
			                     <li><a href="<%=cp%>/free/list.board">자유게시판</a></li>
			                  </ul>
			               </div>
			            </li>
				</ul>
				<div style="margin-top: 10px;margin-left: 570px">
							<span id="signinButton"> 
							 	<span class="g-signin"
									data-callback="signinCallback"
									data-clientid="977578058440-6te7kh3mtob53g4p7gq40lik9oc6g2b5.apps.googleusercontent.com"
    								data-redirecturi="postmessage"
									data-cookiepolicy="single_host_origin"
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
					</div>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!--  end navigation bar -->
