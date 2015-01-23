<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<%@ include file="/HeadInfo.jsp"%>
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/themes/redmond/jquery-ui.css" />
<link rel="stylesheet" href="assets/js/jquery.ptTimeSelect.css" />

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/js/jquery.ptTimeSelect.js"></script>

</head>
<body>

	<form action="<%=cp%>/addevent.do" method="post"
		class="form-horizontal" role="form">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h2 style="color: white; font-weight: bolder;" align="center">일정
						추가</h2>
					<input type="text" id="summary" class="form-control"
								name="summary" placeholder="일정 이름" />

								<input name="startTime" id="startTime" class="form-control" placeholder="시작시간" />
							<input type="text" id="from" name="from" class="form-control"
								placeholder="시작일"> <input name="endTime" id="endTime"
						placeholder="종료시간" class="form-control" /> <input type="text" id="to" name="to" placeholder="종료일"
								class="form-control"> 

							<input type="text" name="description" id="description"
								class="form-control" placeholder="설명" />
							<button onclick="submit(this.form)" class="btn btn-success">일정
								추가</button>
				</div>
			</div>
		</div>
	</form>



	<script type="text/javascript">
		$(document).ready(function() {
			// find the input fields and apply the time select to them.
			$('#startTime').ptTimeSelect({}); //end ptTimeSelect()
			$('#endTime').ptTimeSelect({}); //end ptTimeSelect()
		}); // end ready()
	</script>
	<script>
		$(function() {
			$("#from").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1,
				onClose : function(selectedDate) {
					$("#to").datepicker("option", "minDate", selectedDate);
				}
			});
			$("#to").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1,
				onClose : function(selectedDate) {
					$("#from").datepicker("option", "maxDate", selectedDate);
				}
			});
		});
	</script>
	<script>
		function submit(f) {
			f.submit;

		}
	</script>
</body>
</html>