<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>

<%@include file="/HeadInfo.jsp"%>
<!-- DATA TABLE CSS -->
<link href="assets/css/table.css" rel="stylesheet">
<!-- DataTables Initialization -->
<script type="text/javascript"
	src="assets/js/datatables/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#dt1').dataTable();
	});
</script>
</head>
<body>

<%@include file="/Header.jsp"%>

	<div class="container">

		<!-- CONTENT -->
		<div class="row">
			<div class="col-sm-12 col-lg-12">
								<!--SECOND Table -->

				<h4>
					<strong>Data Table</strong>
				</h4>
  				
				<%@include file="calorie.jsp"%>
				<!--/END SECOND TABLE -->

			</div>
			<!--/span12 -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
	<br>

	<!-- <div class="container">
		<h4>
			<strong>Pure CSS Price Table</strong>
		</h4>
		<div class="row">
			<div class="col-sm-3 col-lg-3">
				<div id="hosting-table">
					<div class="table_style4">
						<div class="column">
							<ul>
								<li><strong>Select Your Plan</strong></li>
								<li class="header_row">
									<h1>Free</h1>
								</li>
								<li>Disk Space 500 MB <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Contrary
												to popular belief. It has roots in a classical Latin</span></span></a></li>
								<li>Bandwidth Unmetered</li>
								<li>Setup Free <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Do
												your layouts deserve better than Lorem Ipsum?</span></span></a></li>
								<li>1 Free Email Accounts</li>
								<li>1 FTP Accounts <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Apply
												as an art than director Do your</span></span></a></li>
								<li>Half Privacy</li>
								<li class="footer_row"><a href="#" class="hosting-button">Add
										To Cart</a></li>
							</ul>
						</div>
						/ column
					</div>
					/ Table Style
				</div>
				/ Hosting Table
			</div>
			/span3
			<div class="col-sm-3 col-lg-3">
				<div id="hosting-table">
					<div class="table_style4">
						<div class="column">
							<ul>
								<li><strong>Select Your Plan</strong></li>
								<li class="header_row">
									<h1>Pro</h1>
								</li>
								<li>Disk Space 500 MB <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Contrary
												to popular belief. It has roots in a classical Latin</span></span></a></li>
								<li>Bandwidth Unmetered</li>
								<li>Setup Free <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Do
												your layouts deserve better than Lorem Ipsum?</span></span></a></li>
								<li>5 Free Email Accounts</li>
								<li>5 FTP Accounts <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Apply
												as an art than director Do your</span></span></a></li>
								<li>Full Privacy</li>
								<li class="footer_row"><a href="#" class="hosting-button">Add
										To Cart</a></li>
							</ul>
						</div>
						/ column
					</div>
					/ Table Style
				</div>
				/ Hosting Table
			</div>
			/span3
			<div class="col-sm-3 col-lg-3">
				<div id="hosting-table">
					<div class="table_style4">
						<div class="column">
							<ul>
								<li><strong>Select Your Plan</strong></li>
								<li class="header_row">
									<h1>Gold</h1>
								</li>
								<li>Disk Space 2000 MB <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Contrary
												to popular belief. It has roots in a classical Latin</span></span></a></li>
								<li>Bandwidth Unmetered</li>
								<li>Setup Free <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Do
												your layouts deserve better than Lorem Ipsum?</span></span></a></li>
								<li>25 Free Email Accounts</li>
								<li>5 FTP Accounts <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Apply
												as an art than director Do your</span></span></a></li>
								<li>Full Privacy</li>
								<li class="footer_row"><a href="#" class="hosting-button">Add
										To Cart</a></li>
							</ul>
						</div>
						/ column
					</div>
					/ Table Style
				</div>
				/ Hosting Table
			</div>
			/span3
			<div class="col-sm-3 col-lg-3">
				<div id="hosting-table">
					<div class="table_style4">
						<div class="column">
							<ul>
								<li><strong>Select Your Plan</strong></li>
								<li class="header_row">
									<h1>Platinum</h1>
								</li>
								<li>Disk Space 10000 MB <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Contrary
												to popular belief. It has roots in a classical Latin</span></span></a></li>
								<li>Bandwidth Unmetered</li>
								<li>Setup Free <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Do
												your layouts deserve better than Lorem Ipsum?</span></span></a></li>
								<li>Unlimited Email Accounts</li>
								<li>Unlimited FTP Accounts <a class="tt" href="#">(?)<span
										class="tooltip"><span class="triangle-obtuse">Apply
												as an art than director Do your</span></span></a></li>
								<li>Full Privacy</li>
								<li class="footer_row"><a href="#" class="hosting-button">Add
										To Cart</a></li>
							</ul>
						</div>
						/ column
					</div>
					/ Table Style
				</div>
				/ Hosting Table
			</div>
			/span3

		</div>
		/row
	</div> -->
	<!-- /container -->
	<br>
	<%@include file="/Footer.jsp"%>

</body>
</html>