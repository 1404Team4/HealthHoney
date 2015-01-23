<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.DataSetGen"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- footer -->
<div id="footerwrap">
   <footer class="clearfix"></footer>
   <div class="container">
      <div class="row">
         <div class="col-sm-12 col-lg-12">
            <p>
               <a href="<%=cp%>/intro.html"><img src="<%=cp%>/assets/img/logo.png" alt="" width="75"></a>
            </p>
            <p>Honey Jam for the Health</p>
         </div>

      </div>
      <!-- /row -->
   </div>
   <!-- /container -->
</div>
<!-- /footerwrap -->

<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<!-- <script type="text/javascript" src="assets/js/lineandbars.js"></script> -->
<!-- 목표달성 다이얼로그 라이브러리 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script type="text/javascript" src="assets/js/dash-charts.js"></script>
<script type="text/javascript" src="assets/js/weight-chart.js"></script>
<script type="text/javascript" src="assets/js/combination-chart.js"></script>
<script type="text/javascript" src="assets/js/calorie-chart.js"></script>
<!-- <script type="text/javascript" src="assets/js/gauge.js"></script> -->

<!-- NOTY JAVASCRIPT -->
<script type="text/javascript" src="assets/js/noty/jquery.noty.js"></script>
<script type="text/javascript" src="assets/js/noty/layouts/top.js"></script>
<script type="text/javascript" src="assets/js/noty/layouts/topLeft.js"></script>
<script type="text/javascript" src="assets/js/noty/layouts/topRight.js"></script>
<script type="text/javascript" src="assets/js/noty/layouts/topCenter.js"></script>

<!-- You can add more layouts if you want -->
<script type="text/javascript" src="assets/js/noty/themes/default.js"></script>
<!-- 
   <script type="text/javascript" src="assets/js/dash-noty.js"></script> 
   This is a Noty bubble when you init the theme-->
<script type="text/javascript" src="//code.highcharts.com/highcharts.js"></script>
<script src="assets/js/jquery.flexslider.js" type="text/javascript"></script>

<script type="text/javascript" src="assets/js/admin.js"></script>
<script type="text/javascript">
      $(document).ready(function() {

         $("#btn-blog-next").click(function() {
            $('#blogCarousel').carousel('next')
         });
         $("#btn-blog-prev").click(function() {
            $('#blogCarousel').carousel('prev')
         });

         $("#btn-client-next").click(function() {
            $('#clientCarousel').carousel('next')
         });
         $("#btn-client-prev").click(function() {
            $('#clientCarousel').carousel('prev')
         });

      });

      $(window).load(function() {

         $('.flexslider').flexslider({
            animation : "slide",
            slideshow : true,
            start : function(slider) {
               $('body').removeClass('loading');
            }
         });
      });
   </script>
<!-- 챠트 데이터 -->
<script>
	  var cnt=0;	// dash-chart1  버튼 카운터
	  var cnt1=0;	// dash-chart2
	  var cnt2=10;	// combination-chart nanoTime 뽑기
	  var cnt3=0;   // combination-chart 버튼 카운터
	  //날짜 뽑기
	  //var day = new Date().getDate();
	  var combDate = new Date();
	  
      // 1화면에 표시되는 1일치 걸음 수 
      var dailySteps = 0;
      
      // 1일치 걸음 목표량 퍼센트 
      var estiStepsPercent=(dailySteps/10000)*100;  
      
      var walkingMinPer = 0;
      var runningMinPer = 0;
      var bikingMinPer = 0;
      var currWeight = 0;
</script>
<!--Google+ script-->
<script>
      (function() {
         var po = document.createElement('script');
         po.type = 'text/javascript';
         po.async = true;
         po.src = 'https://apis.google.com/js/client:plusone.js';
         var s = document.getElementsByTagName('script')[0];
         s.parentNode.insertBefore(po, s);
      })();
      /* function render() {
          gapi.signin.render('customBtn', {
            //'callback': 'signinCallback',
            'clientid': '841077041629.apps.googleusercontent.com',
            'cookiepolicy': 'single_host_origin',
            'requestvisibleactions': 'http://schemas.google.com/AddActivity',
            'scope': 'https://www.googleapis.com/auth/plus.login'
          });
        } */

   </script>
<script>
      var test1=1; //  disconnect함수에서 사용할 액세스 토큰을 저장
      function signinCallback(authResult) {
    	  if (authResult['status']['signed_in'] && authResult['status']['method'] == 'PROMPT') {
    		  gapi.auth.setToken(authResult);  // 토큰 저장 
        	  gapi.auth.getToken();
        	  console.log("signinCallback: ", authResult);
        	  window.location.reload(true);
    	  } else if (authResult['status']['signed_in']) {
    		  document.getElementById('signinButton').setAttribute('style', 'display: none');
    		  helper.onSignInCallback(authResult);
          	  access_token = authResult['access_token'];
    	  } else {
    	      // Update the app to reflect a signed out user
    	      // Possible error values:
    	      //   "user_signed_out" - User is signed-out
    	      //   "access_denied" - User denied access to your app
    	      //   "immediate_failed" - Could not automatically log in the user
    	      console.log('Sign-in state: ' + authResult['error']);
    	  }
    	      /* if (authResult['access_token']) {
                signedIn = authResult['status']['signed_in'];
            	console.log("signedIn1 : "+signedIn);
              // 승인 성공
              console.log("signinCallback: ", authResult);
              
               // 사용자가 승인되었으므로 로그인 버튼 숨김
               document.getElementById('signinButton').setAttribute('style', 'display: none');
               // 로그인 버튼을 로그아웃 버튼으로 바꿈
               // $("#signinButton").parent().html('<input type="button" id="revokeButton" name="revokeButton" value="logout"/>');
               // 로그인 버튼 삭제
               //$("#signinButton").parent().remove();
               
               gapi.auth.setToken(authResult);  // 토큰 저장 
         	   gapi.auth.getToken();
               helper.onSignInCallback(authResult);
           	   access_token = authResult['access_token'];
            
            } else if (authResult['error']) {
              // 오류가 발생했습니다.
              // 가능한 오류 코드:
              //   "access_denied" - 사용자가 앱에 대한 액세스 거부
              //   "immediate_failed" - 사용자가 자동으로 로그인할 수 없음
              console.log('오류 발생: ' + authResult['error']);
            } */
    	  
      }
      
      function disconnectUser(access_token) {  // 로그아웃 함수
         var revokeUrl = 'https://accounts.google.com/o/oauth2/revoke?token=' +
         access_token;
         //alert(test1);

         // 비동기 GET 요청을 수행합니다.
         $.ajax({
           type: 'GET',
           url: revokeUrl,
           async: false,
           contentType: "application/json",
           dataType: 'jsonp',
           success: function(nullResponse) {
             // 사용자가 연결 해제되었으므로 작업을 수행합니다.
             // 응답은 항상 정의되지 않음입니다.
           },
           error: function(e) {
             // 오류 처리
             // console.log(e);
             // 실패한 경우 사용자가 수동으로 연결 해제하게 할 수 있습니다.
             // https://plus.google.com/apps
           }
         });
       }
       // 버튼 클릭으로 연결 해제를 실행할 수 있습니다.
       $(document).on("click", "[name=revokeButton]", function(){  // 로그아웃 버튼
          disconnectUser(test1);
          alert("revokeButton");
       });
   </script>

<!-- 구글 데이터 요청 -->
<script type="text/javascript">
	function dataSetGen(start, end){
		var date1 = new Date();
		var endDate = new Date();
		var startDate = new Date();
		
		currdate = date1.getDate()
		 
		if(end>=0){
			endDate.setDate(currdate-end)
			endDate.setHours(0, 0, 0, 0)
			//endTime.setHours(endTime.getHours()-currHours, endTime.getMinutes()-currMinutes, endTime.getSeconds()-currSeconds)
		}
		startDate.setDate(currdate-start)
		startDate.setHours(0, 0, 0, 0)
		
		var endNanos = endDate.getTime()+'000000'
		var startNanos = startDate.getTime()+'000000'
		
		var dataSetId = startNanos+"-"+endNanos;
		//console.log("dataSetId1 : "+dataSetId)
		
		return dataSetId
	}
	
	var str = $("#estiSteps").html()
	var helper = (function() {
      return {
         onSignInCallback : function(authResult) {
            gapi.client.load('plus', 'v1', this.renderProfile);
            gapi.client.load('plus', 'v1', this.peopleList);
            gapi.client.load('fitness', 'v1', this.fitWeight);
           	gapi.client.load('fitness', 'v1', this.fitSegment);
           	gapi.client.load('fitness', 'v1', this.fitSegment2);
           	gapi.client.load('fitness', 'v1', this.fitSteps);
           	//alert(access_token)
            //console.log('authResult', authResult);
         },
         /**
          * Retrieves and renders the authenticated user's Google+ profile.
          */
         renderProfile : function() {
            var request = gapi.client.plus.people.get({
               'userId' : 'me'
            });
            request.execute(function(profile) {

               var TagLine = profile.tagline;//tagline 
               var AboutMe = profile.aboutMe;//자기소개
               var Gender = profile.gender;//성별
               var Email = profile.emails[0].value; //이메일
               var Dname = profile.displayName; //전체 이름(닉) 
               var Gname = profile.name.givenName; //이름
               var Fname = profile.name.familyName; //성 
               var Nick = profile.nickname; //닉네임
               var Gurl = profile.url;
               $("#img-circle").attr("src", profile.image.url); // 프로필 사진

               //user 페이지 div 내용
               $("#Dname").empty().append(Dname);

               $("#Gname").empty().append(Gname);
               $("#Fname").empty().append(Fname);
               $("#Nick").empty().append(Nick);

               $("#Email").empty().append(Email);
               $("div #writer").empty().attr('value', Email);
               $("#Gender").empty().append(Gender);
               $("#AboutMe").empty().append(AboutMe);
               $("#calendar iframe").attr('src', "https://www.google.com/calendar/embed?showPrint=0&showTabs=0&showTz=0&height=600&wkst=1&bgcolor=%23333333&src="+Email+"&color=%232952A3&ctz=Asia%2FSeoul"
               );
            });
         },
         //해당 앱을 사용하는 구글 서클에 추가된 사용자들(친구)
         peopleList : function(){
            var request = gapi.client.plus.people.list({
               'userId' : 'me',
               'collection' : 'visible'
            });
            request.execute(function(list){
            	console.log("list : ", list)
               $(".dash-unit #friendList").append("("+list.totalItems+")");
            });
         },

         
      <%--  fitness  --%>   
         
         fitWeight : function(){
        	var currWeight=0
        	var dataSetId = dataSetGen(30, -1)
            var request = gapi.client.fitness.users.dataSources.datasets.get({
                'userId' : 'me',
                'dataSourceId' : 'derived:com.google.weight:com.google.android.gms:merge_weight',
                'datasetId' : dataSetId
            });
             request.execute(function(fitWeight){
                //console.log("fitWeight", fitWeight)
                
                var fitWeightArr = fitWeight['point']
                if(fitWeightArr!=null){
                	currWeight = fitWeightArr[fitWeightArr.length-1]['value'][0]['fpVal'];
                }
                var chart = $('#weight').highcharts();
                chart.series[0].setData([
                            ['몸무게', currWeight]
                        	]);
              });
         },
         
         	 fitSegment : function(){
         	 var dataSetId = dataSetGen(cnt1, cnt1-1)
        	 var walkingSegment=0, runningSegment=0, bikingSegment=0;
        	 var request = gapi.client.fitness.users.dataSources.datasets.get({
                 'userId' : 'me',
                 'dataSourceId' : 'derived:com.google.activity.segment:com.google.android.gms:platform_activity_segments',
                 'datasetId' : dataSetId
             });
              request.execute(function(fitSegment){
                 //console.log("fitSegment", fitSegment)

                 var fitSegArr = fitSegment['point'];
                 if(fitSegArr!=null){
	                 for(var j=0;j<fitSegArr.length;j++){
	                	 if(fitSegArr[j]['value'][0]['intVal']==7){
	                		 walkingSegment += Math.round((fitSegArr[j]['endTimeNanos']/60000000000)-(fitSegArr[j]['startTimeNanos']/60000000000))
	                	 }
	                	 else if(fitSegArr[j]['value'][0]['intVal']==8){
	                		 runningSegment += Math.round((fitSegArr[j]['endTimeNanos']/60000000000)-(fitSegArr[j]['startTimeNanos']/60000000000))
	                	 }
	                	 else if(fitSegArr[j]['value'][0]['intVal']==1){
	                		 bikingSegment += Math.round((fitSegArr[j]['endTimeNanos']/60000000000)-(fitSegArr[j]['startTimeNanos']/60000000000))
	                	 }
	                 }	
                 }
                 //console.log("walkingSegment", walkingSegment)
                 var walk = walkingSegment
                 var run = runningSegment
                 var bike = bikingSegment
                 var walkPercent= Math.round((walkingSegment/100)*100);  
                 var runPercent=Math.round((runningSegment/100)*100);  
                 var bikePercent=Math.round((bikingSegment/100)*100);  
                 var sum=walkPercent+runPercent+bikePercent;
                 console.log("walk : "+walkPercent+" / "+"run : "+runPercent+" / "+"bike : "+bikePercent+" / "+"sum : "+sum)
                 $("#sessions").html(sum+' Min');
                 var chart = $('#dashChart2').highcharts();
                 if(sum>100){
                	 chart.series[0].setData([
                	             ['목표 달성',   walkPercent]
                	             ]);
                	 
                 }
                 else{
	                 chart.series[0].setData([
	                             ['걸은 시간',   walkPercent],
	                             ['뛴 시간',     runPercent],
	                             ['라이딩 시간',  bikePercent],
	                             ['목표량까지 남은 시간',   100-(sum)]
	                             ]);  
                 }
                 
				//Calorie 차트 
                 var walkingCal = walk*3;
                 var runningCal = run*11.2;
                 var bikingCal = bike*7.42;
                 $("#totalCal").html((walkingCal+runningCal+bikingCal)+' Kcal');
                 var chart2 = $('#calorie').highcharts();
                 chart2.series[0].setData([
                             ['걷기 소비',   walkingCal],
                             ['달리기 소비',     runningCal],
                             ['자전거 소비',  bikingCal],
                             ]);
               })
         },  // fitSegment 끝
         
         	 fitSegment2 : function(){
         	 var startTimeArr = new Array();
         	 var endTimeArr = new Array();
        	 var walkingSegment = new Array();
        	 var runningSegment = new Array()
        	 var bikingSegment = new Array();
        	 var segmentSum = new Array();
         	 var index=0;
         	 
         	 for(var i=cnt2-10;i<cnt2;i++){
	         	 startTimeArr[index] = (dataSetGen(i, i-1)).substring(0, 19);
	         	 endTimeArr[index] = (dataSetGen(i, i-1)).substring(20, 39);
	         	 index++;
	         	 //console.log(i+" : "+startTimeArr[index]+"-"+endTimeArr[index]);
         	 } // i for문 끝
         	 index=0;
         	 var dataSetId = dataSetGen(cnt2, -1);
        	 var request = gapi.client.fitness.users.dataSources.datasets.get({
                 'userId' : 'me',
                 'dataSourceId' : 'derived:com.google.activity.segment:com.google.android.gms:platform_activity_segments',
                 'datasetId' : dataSetId
             });
        	 
              request.execute(function(fitSegment2){
                 //console.log("fitSegment2", fitSegment2)

                 var fitSegArr = fitSegment2['point'];
                 if(fitSegArr!=null){
                	 for(var k=0;k<startTimeArr.length;k++){
                		 walkingSegment[k]=0;
                		 runningSegment[k]=0;
                		 bikingSegment[k]=0;
                		 segmentSum[k]=0;
		                 for(var j=0;j<fitSegArr.length;j++){
		                	 if(fitSegArr[j]['startTimeNanos']>=startTimeArr[k]
		                	 && fitSegArr[j]['endTimeNanos']<=endTimeArr[k]){
			                	 if(fitSegArr[j]['value'][0]['intVal']==7){
			                		 walkingSegment[k] += Math.round((fitSegArr[j]['endTimeNanos']/60000000000)-(fitSegArr[j]['startTimeNanos']/60000000000))
			                	 }
			                	 else if(fitSegArr[j]['value'][0]['intVal']==8){
			                		 runningSegment[k] += Math.round((fitSegArr[j]['endTimeNanos']/60000000000)-(fitSegArr[j]['startTimeNanos']/60000000000))
			                	 }
			                	 else if(fitSegArr[j]['value'][0]['intVal']==1){
			                		 bikingSegment[k] += Math.round((fitSegArr[j]['endTimeNanos']/60000000000)-(fitSegArr[j]['startTimeNanos']/60000000000))
			                	 }
		                	 }  // 시간비교 if문 끝
		                 }	// j for문 끝
		                 var walk = walkingSegment[k]
		                 var run = runningSegment[k]
		                 var bike = bikingSegment[k]
		                 segmentSum[k] = walk+run+bike;
                	 }  // k for문 끝
                 }  // if문 끝
                 
                 walkingSegment.reverse();
                 runningSegment.reverse();
                 bikingSegment.reverse();
                 segmentSum.reverse();
                 
                 var combDate2 = new Date();
                 var testDate = new Date();
                 var dateArr = new Array();
                 var index1=0;
                 for(var l=cnt2-10 ; l<cnt2 ; l++){
                	combDate2.setDate(testDate.getDate()-l);
                	dateArr[index1] = (combDate2.getMonth()+1)+'/'+combDate2.getDate();
                	combDate2.setMonth(testDate.getMonth());
                	//console.log(dateArr[index1])
                	index1++;
                 }
                 index1=0;
                 dateArr.reverse();
                 var chart = $('#combination').highcharts();
                 chart.xAxis[0].setCategories(dateArr, false);
                 chart.series[0].setData(walkingSegment, false);
                 chart.series[1].setData(runningSegment, false); 
                 chart.series[2].setData(bikingSegment, false); 
                 chart.series[3].setData(segmentSum, true);
               })  // execute끝
         },  // fitSegment2 끝 
         
         fitSteps : function(){
        	 var dataSetId = dataSetGen(cnt, cnt-1)
        	 console.log("dataSetId : "+dataSetId)
        		var steps=0;
	        	request = gapi.client.fitness.users.dataSources.datasets.get({
	                'userId' : 'me',
	                'dataSourceId' : 'derived:com.google.step_count.delta:com.google.android.gms:estimated_steps',
	                'datasetId' : dataSetId
	            });
	        	request.execute(function(fitSteps){
	                var fitStepsArr = fitSteps['point']
	                if(fitStepsArr!=null){
		                for(var j=0;j<fitStepsArr.length;j++){
		        		//console.log("k : "+k+" / "+"j : "+j)
		                	steps += fitStepsArr[j]['value'][0]['intVal'];
		                } // j for문 끝
	                } // if문 끝
	                console.log("steps : "+steps);
	                $("#estiSteps").html(steps+' Steps')
	                
			        var strPercent=(steps/10000)*100;  
	                //console.log("strPercent : "+strPercent)
	                if(strPercent>100){
	                	var chart = $('#dashChart1').highcharts();
	                	$("#dialog").html('목표량보다 '+(steps-10000)+'걸음 초과달성')
				        chart.series[0].setData([
	                    ['목표달성!!',  strPercent]
	                    ]);  
				        $("#dialog").dialog("open");
	                }
	                else {
	                	var chart = $('#dashChart1').highcharts();
				        chart.series[0].setData([
	                    ['걸음 수',   strPercent],
	                    ['목표 걸음 수까지',  100-strPercent]
	                    ]);  
	                }
	                steps=0;
	        	});
         } //fitSteps 끝
      };
   })();
</script>


<!-- 챠트 액션 -->
<script>
   var date = new Date();
   var month = date.getMonth()+1;
   var day = date.getDate();
   $(document).ready(function(){
      $("#date").html(month+"월/"+day+"일");
   });
   
	  /*****dash chart1*********************************************
	  *************************************************************/
      $("#next").hide();
      $("#prev").on("click", (function(){
         cnt=cnt*1+1;
         gapi.client.load('fitness', 'v1', helper.fitSteps);
         $("#next").show();
         date.setDate(date.getDate()-1);
         month = date.getMonth()+1;
         day = date.getDate();
         $("#date").html(month+"월/"+day+"일");
      }));
      
      $("#next").on("click", (function(){
         cnt=cnt*1-1;
         gapi.client.load('fitness', 'v1', helper.fitSteps);
         $("#prev").show();
         date.setDate(date.getDate()+1);
         month = date.getMonth()+1;
         day = date.getDate();
         $("#date").html(month+"월/"+day+"일");
         if(cnt==0){
             $("#next").hide();
          }
      }));
      
      var date1 = new Date();
      var month1 = date1.getMonth()+1;
      var day1 = date1.getDate();
      $(document).ready(function(){
         $("#date1").html(month1+"월/"+day1+"일");
      });
      
      
      /*****dash chart2*********************************************
       *************************************************************/
      $("#next1").hide();
      $("#prev1").on("click", (function(){
         $("#next1").show();
         cnt1=cnt1*1+1;
         gapi.client.load('fitness', 'v1', helper.fitSegment)
         date1.setDate(date1.getDate()-1);
         month1 = date1.getMonth()+1;
         day1 = date1.getDate();
         $("#date1").html(month1+"월/"+day1+"일");
      }));
      
      $("#next1").on("click", (function(){
         cnt1=cnt1*1-1;
         gapi.client.load('fitness', 'v1', helper.fitSegment)
         $("#prev1").show();
         date1.setDate(date1.getDate()+1);
         month1 = date1.getMonth()+1;
         day1 = date1.getDate();
         $("#date1").html(month1+"월/"+day1+"일");
         if(cnt1==0){
             $("#next1").hide();
          }
      }));
      
      
      /*****combination chart**************************************
      *************************************************************/
      $("#next2").hide();
      $("#prev2").on("click", (function(){
    	  $("#next2").show();
    	  cnt2=cnt2*1+10;
    	  cnt3=cnt3*1+1;
    	  gapi.client.load('fitness', 'v1', helper.fitSegment2)
    	  combDate.setDate(combDate.getDate()-10);
      }))
      
      $("#next2").on("click", (function(){
    	  cnt2=cnt2+1-11;
    	  cnt3=cnt3*1-1;
    	  gapi.client.load('fitness', 'v1', helper.fitSegment2)
    	  combDate.setDate(combDate.getDate()+10);
    	  if(cnt3==0){
              $("#next2").hide();
           }
      }));
      
      
      /*****목표 달성 다이얼로그************************************
      **************************************************************/
      $(function() {
    	    $( "#dialog" ).dialog({
    	      dialogClass: "alert",
    	      autoOpen: false,
    	      /* title: "목표 달성!!", */
    	      show: {
    	        effect: "explode",
    	        duration: 1000
    	      },
    	      hide: {
    	        effect: "slide",
    	        duration: 1000
    	      }
    	    });
    	  });
</script>