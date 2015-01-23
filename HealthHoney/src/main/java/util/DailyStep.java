package util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.simple.parser.ParseException;

import com.google.api.services.fitness.Fitness;
import com.google.api.services.fitness.model.DataPoint;
import com.google.api.services.fitness.model.Dataset;
import com.google.api.services.fitness.model.Value;

public class DailyStep {
	public static void main(String args[]){
	}
	
	public ArrayList getDailyStep(Fitness fclient, int startDay, int endDay) throws IOException, ParseException{
		  // dataSetId 값을 저장할 변수
	      String dataSetId = null, startTime=null, formattedDate=null;
	      // dataSetId를 리턴할 DataSetGen 객체
	      util.DataSetGen dsg = new DataSetGen();
	      Calendar calendar = Calendar.getInstance();
	      Date date = new Date();
	      
	      /*********데이터 리스트로 한번에 불러올 수 없음*******************************************
	      ListDataSourcesResponse dataResponse = fclient.users().dataSources().list("me").execute();
	      //System.out.println(dataResponse.toPrettyString());
	      List dsSourceList = dataResponse.getDataSource();
	      ******************************************************************************************/
	      
		  String dataStreamId = "derived:com.google.step_count.delta:com.google.android.gms:estimated_steps";
	      int estiStepsSum=0;
	      ArrayList estiStepsList = new ArrayList();
	      ArrayList setTimeList = new ArrayList();
	      dataSetId = dsg.getDataSetId(startDay, endDay); 
	      int days = startDay;  // days일치 데이터
	      String[] setTimeStr=null;
	      for(int i=0;i<days;i++){
	    	  setTimeStr = dsg.getDataSetId(i, i-1).split("-");
	    	  setTimeList.add(setTimeStr);
	      }
	      
	      Dataset datasets = fclient.users().dataSources().datasets().get("me", dataStreamId, dataSetId)
	              .setFields("point(endTimeNanos,startTimeNanos,modifiedTimeMillis,value(intVal))").execute();
	      
	      List estiStepsPoints = datasets.getPoint();
          //System.out.println("estiStepsPoints.size() : "+estiStepsPoints.size());
	      
	      	  // 기록된 걸음 수가 있을 때만 진행
	          if(estiStepsPoints!=null){
		          long startTimeNanos=0, endTimeNanos=0;
		          //DataPoint estiStepsOnePoint=null;
		          for(int j=0;j<days;j++){
			          for(int i=0;i<estiStepsPoints.size();i++){
				          DataPoint estiStepsOnePoint = (DataPoint) estiStepsPoints.get(i);
				          startTimeNanos=estiStepsOnePoint.getStartTimeNanos();
				          endTimeNanos=estiStepsOnePoint.getEndTimeNanos();
				          if(startTimeNanos>=Long.parseLong(((String[])setTimeList.get(j))[0])
				        		  &&endTimeNanos<=Long.parseLong(((String[])setTimeList.get(j))[1])){
				        	  List<Value> estiStepsValue = estiStepsOnePoint.getValue();
				        	  Value estiStepOneValue = estiStepsValue.get(0);
				        	  estiStepsSum+=estiStepOneValue.getIntVal();
				          }
			          }
			          startTime=((String[])setTimeList.get(j))[0].substring(0, 13);
			          calendar.setTimeInMillis(Long.parseLong(startTime));
			          date=calendar.getTime();
			          formattedDate = new SimpleDateFormat("yyyy년 MM월 dd일").format(date);
			          System.out.println(formattedDate+" : "+estiStepsSum+"걸음");
			          estiStepsList.add(estiStepsSum);
			          estiStepsSum=0;
		          }
	          }
	          else{
	        	  estiStepsList.add(estiStepsSum);
	          }
          return estiStepsList;
	}
}
