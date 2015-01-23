<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

   <div class="container">

      <!-- FIRST ROW OF BLOCKS -->
      <div class="row">

               <!-- USER PROFILE BLOCK :-->
            <div class="col-sm-4 col-lg-4">
               <div class="half-unit" style="height: 190px">
                  <dtitle>User Profile</dtitle>
                  <hr>
                  <div class="thumbnail">
                     <img id="img-circle" src="assets/img/face.jpg"
                        alt="google user" class="img-circle" width="72">
                  </div>
                  <!-- /thumbnail -->
                  <h2>
                     <div id="Dname" align="center">Please Login</div>
                  </h2>
                  <!-- <br />
                  <hr /> -->
                  <!-- <div class="info-user">
                     <a href="main?cmd=USER" data-toggle="tooltip" title="회원정보"><span
                        aria-hidden="true" class="li_user fs1"></span></a> <a
                        href="https://myaccount.google.com/" target="_new"
                        data-toggle="tooltip" title="정보수정(구글)"><span
                        aria-hidden="true" class="li_settings fs1"></span></a> <a
                        href="https://mail.google.com/mail/u/0/" target="_new"
                        data-toggle="tooltip" title="G메일"><span aria-hidden="true"
                        class="li_mail fs1"></span></a> <a href="main?cmd=CALENDAR"
                        data-toggle="tooltip" title="일정"><span aria-hidden="true"
                        class="li_calendar fs1"></span></a> <a
                        href="https://drive.google.com/drive" target="_new"
                        data-toggle="tooltip" title="구글 드라이브"><span aria-hidden="true"
                        class="li_data fs1"></span></a> <a
                        href="https://plus.google.com/u/0/photos" target="_new"
                        data-toggle="tooltip" title="구글 사진"><span aria-hidden="true"
                        class="li_camera fs1"></span></a>
                  </div> -->
               </div>
               <div class="half-unit">
	               <dtitle>Local Time</dtitle>
	               <hr>
	               <div class="clockcenter">
	                  <digiclock>12:45:25</digiclock>
	               </div>
               </div>
            </div>

         <!-- DONUT CHART BLOCK -->
         <div class="col-sm-4 col-lg-4">
            <div class="dash-unit" style="height: 350px">
               <dtitle>Daily Step Counter</dtitle>
               <hr>
               <div id="date" style="position:absolute;"></div>
               
               <div id="dashChart1" style="margin:auto; position:relative;"></div>
               <!-- 하루치 걸음 수 -->
               <div>
               <h2 id="estiSteps">0 Steps</h2>
               <div id="dialog" title="목표 달성!!" style="background-color: #4f4f4f; height: 30px"></div>
               <input type="button" id="prev" value="Prev"/>
               <input type="button" id="next" value="Next"/>
               </div>
               
            </div>
         </div>

         <!-- DONUT CHART BLOCK -->
         <div class="col-sm-4 col-lg-4">
            <div class="dash-unit" style="height: 350px;">
               <dtitle>Daily Activity Session</dtitle>
               <hr>
               <div id="date1" style="position:absolute;"></div>
               <div id="dashChart2" style="margin:auto; position:relative;" ></div>
               <!-- 하루치 시간 -->
               <div>
               <h2 id="sessions">0 Min</h2>
               <input type="button" id="prev1" value="Prev"/>
               <input type="button" id="next1" value="Next"/>
               </div>
            </div>
         </div>
      </div>
      <!-- /row -->
      
      <!-- Second ROW OF BLOCKS -->
      <div class="row">

         <!-- DONUT CHART BLOCK -->
         <div class="col-sm-8 col-lg-8">
            <div class="dash-unit" style="height: 450px">
               <dtitle>Total Result</dtitle>
               <hr>
               <div id="combination" style="margin: 0 auto; position:relative;" ></div>
               <input type="button" id="prev2" value="Prev"/>
               <input type="button" id="next2" value="Next"/>
            </div>
         </div>

         <div class="col-sm-4 col-lg-4">

            <!-- Calorie Block -->
            <div class="half-unit" style="height: 290px;">
            <dtitle>Calorie Consumption</dtitle>
               <hr>
               <div id="calorie" style="margin: 0 auto;"></div>
               <p id="totalCal" style="font-size:30px" align="center">0</p>
            </div>

            <!-- LIVE VISITORS BLOCK -->
            <div class="half-unit">
               <dtitle>Weight</dtitle>
               <hr>
               <div id="weight" style="margin: 0 auto"></div>
            </div>

         </div>
      </div>
      </div>
   <!-- /container -->
   