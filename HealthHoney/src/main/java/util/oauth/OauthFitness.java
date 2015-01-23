package util.oauth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import util.DailyStep;
import util.DataSetGen;
import util.SegmentDto;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.services.fitness.Fitness;
import com.google.api.services.fitness.model.DataPoint;
import com.google.api.services.fitness.model.Dataset;
import com.google.api.services.fitness.model.Value;

public class OauthFitness implements OauthAPI {
	String dataSetId = "";
	String dataStreamId = "";
	// 시간구간 계산 함수.
	DataSetGen dsg = new DataSetGen();
	JSONParser parser = new JSONParser();
	JSONObject jobj, obj2, obj3;
	JSONArray jArr, jArr2;
	public OauthFitness (){
		
	}
	public Fitness createObj(HttpTransport httpTransport,
			JsonFactory JSON_FACTORY, Credential credential,
			String APPLICATION_NAME) {
		return new Fitness.Builder(httpTransport, JSON_FACTORY, credential)
				.setApplicationName(APPLICATION_NAME).build();
	}

	public ArrayList callDailyStep(Fitness fclient, int day) {
		DailyStep dailyStep = new DailyStep();
		ArrayList dailyStepList = new ArrayList();
		try {
			dailyStepList = dailyStep.getDailyStep(fclient, day, -1);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dailyStepList;
	}

	public Vector callWeight(Fitness fclient) throws Exception {
		String weight = "0";
		ArrayList<String> list = new ArrayList<String>();
		Vector returnWeight = new Vector();
		dataStreamId = "derived:com.google.weight:com.google.android.gms:merge_weight";
		dataSetId = dsg.getDataSetId(30, -1); // 한달
		Dataset WeightDatasets = fclient.users().dataSources().datasets()
				.get("me", dataStreamId, dataSetId).execute();
		jobj = (JSONObject) parser.parse(WeightDatasets.toString());
		jArr = (JSONArray) jobj.get("point");
		if(jArr!=null){
		for (int j = 0; j < jArr.size(); j++) {
			obj2 = (JSONObject) jArr.get(j);
			jArr2 = (JSONArray) obj2.get("value");
			obj3 = (JSONObject) jArr2.get(0);
			weight = obj3.get("fpVal").toString();
			//System.out.println("weight : " + weight);
			list.add(weight);

			Collections.sort(list);
		}
		}else{
			weight="0";
			list.add(weight);
		}
		returnWeight.add(weight);
		returnWeight.add(list);
		return returnWeight;
	}

	// segment의 시작과 끝시간을 저장한 리스트
	//ArrayList segmentDtoList = new ArrayList();
	public Map callActivitySegment(Fitness fclient) throws IOException{
		long walkingSegment=0, runningSegment=0, bikingSegment=0;
		//ArrayList segmentList = new ArrayList();
		ArrayList setTimeList = new ArrayList();
		
		Map segMap = new HashMap();
		ArrayList walkingMinList = new ArrayList();
		ArrayList runningMinList = new ArrayList();
		ArrayList bikingMinList = new ArrayList();
		
		dataStreamId = "derived:com.google.activity.segment:com.google.android.gms:platform_activity_segments";
		dataSetId = dsg.getDataSetId(15, -1);
		int days=15;
		String[] setTimeStr=null;
	      for(int i=0;i<days;i++){
	    	  setTimeStr = dsg.getDataSetId(i, i-1).split("-");
	    	  setTimeList.add(setTimeStr);
	    }
		
		Dataset segmentDataSets = fclient.users().dataSources().datasets()
				.get("me", dataStreamId, dataSetId).setFields("point(endTimeNanos, startTimeNanos,value(intVal))").execute();
		
		List segmentDataPoints = segmentDataSets.getPoint();
		DataPoint segmentDataOnePoint = null;
		
		long startTimeNanos=0, endTimeNanos=0;
		for(int j=0;j<days;j++){
			for(int i=0;i<segmentDataPoints.size();i++){
				segmentDataOnePoint = (DataPoint) segmentDataPoints.get(i);
				List<Value> segmentValues = segmentDataOnePoint.getValue();
				startTimeNanos = segmentDataOnePoint.getStartTimeNanos();
				endTimeNanos = segmentDataOnePoint.getEndTimeNanos();
				if(startTimeNanos>=Long.parseLong(((String[])setTimeList.get(j))[0])
		        		  &&endTimeNanos<=Long.parseLong(((String[])setTimeList.get(j))[1])){
					Value segmentOneValue = segmentValues.get(0);
					
					/*SegmentDto segDto = new SegmentDto();
					segDto.setStartTimeNanos(startTimeNanos);
					segDto.setEndTimeNanos(endTimeNanos);
					segDto.setSegmentVal(segmentOneValue.getIntVal());
					segmentDtoList.add(segDto);*/
					
					// walking segment 
					if(segmentOneValue.getIntVal()==7){
						walkingSegment+=(segmentDataOnePoint.getEndTimeNanos()/1000000)
								-(segmentDataOnePoint.getStartTimeNanos()/1000000);
					}
					
					// running segment
					else if(segmentOneValue.getIntVal()==8){
						runningSegment+=(segmentDataOnePoint.getEndTimeNanos()/1000000)
								-(segmentDataOnePoint.getStartTimeNanos()/1000000);
					}
					
					// biking segment?
					else if(segmentOneValue.getIntVal()==1){
						bikingSegment+=(segmentDataOnePoint.getEndTimeNanos()/1000000)
								-(segmentDataOnePoint.getStartTimeNanos()/1000000);
					}
				}
			}
			
			/*System.out.println("walkingMinutes : "+walkingSegment/60000+" / "
								+"runningMinutes : "+runningSegment/60000+" / "
								+"bikingMinutes : "+bikingSegment/60000);*/
			walkingMinList.add(walkingSegment/60000);
			runningMinList.add(runningSegment/60000);
			bikingMinList.add(bikingSegment/60000);
			walkingSegment=0;
			runningSegment=0;
			bikingSegment=0;
		}
		segMap.put("walkingMinList", walkingMinList);
		segMap.put("runningMinList", runningMinList);
		segMap.put("bikingMinList", bikingMinList);
		return segMap;	
	}

	public double callDistance(Fitness fclient) throws Exception {
		double mergeDistance=0;
		dataStreamId = "derived:com.google.distance.delta:com.google.android.gms:merge_distance_delta";
		dataSetId = dsg.getDataSetId(0, -1); // 하루
		Dataset distanceDatasets = fclient.users().dataSources().datasets()
				.get("me", dataStreamId, dataSetId).execute();
		List mergeDistPoints = distanceDatasets.getPoint();
		DataPoint mergeDistOnePoint = null;
		
		// 활동거리가 있을 때만 진행
		if(mergeDistPoints!=null){ 
			for (int j = 0; j < mergeDistPoints.size(); j++) {
				mergeDistOnePoint = (DataPoint) mergeDistPoints.get(j);
					List<Value> mergeDistValues = mergeDistOnePoint.getValue();
					mergeDistance+=mergeDistValues.get(0).getFpVal();
				}
		}
		return mergeDistance;
	}
}
