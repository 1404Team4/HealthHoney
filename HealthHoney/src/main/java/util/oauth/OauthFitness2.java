package util.oauth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
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

public class OauthFitness2 implements OauthAPI {
	String dataSetId = "";
	String dataStreamId = "";
	// 시간구간 계산 함수.
	DataSetGen dsg = new DataSetGen();
	JSONParser parser = new JSONParser();
	JSONObject jobj, obj2, obj3;
	JSONArray jArr, jArr2;

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
		String weight = "";
		ArrayList<String> list = new ArrayList<String>();
		Vector returnWeight = new Vector();
		dataStreamId = "derived:com.google.weight:com.google.android.gms:merge_weight";
		dataSetId = dsg.getDataSetId(30, -1); // 한달
		Dataset WeightDatasets = fclient.users().dataSources().datasets()
				.get("me", dataStreamId, dataSetId).execute();
		jobj = (JSONObject) parser.parse(WeightDatasets.toString());
		jArr = (JSONArray) jobj.get("point");
		for (int j = 0; j < jArr.size(); j++) {
			obj2 = (JSONObject) jArr.get(j);
			jArr2 = (JSONArray) obj2.get("value");
			obj3 = (JSONObject) jArr2.get(0);
			weight = obj3.get("fpVal").toString();
			//System.out.println("weight : " + weight);
			list.add(weight);

			Collections.sort(list);
		}
		returnWeight.add(weight);
		returnWeight.add(list);
		return returnWeight;
	}

	// segment의 시작과 끝시간을 저장한 리스트
	ArrayList segmentDtoList = new ArrayList();
	public ArrayList callActivitySegment(Fitness fclient) throws IOException{
		long walkingSegment = 0;
		ArrayList segmentList = new ArrayList();
		ArrayList setTimeList = new ArrayList();
		String endTimeStr=null, startTimeStr=null; 
		dataStreamId = "derived:com.google.activity.segment:com.google.android.gms:platform_activity_segments";
		dataSetId = dsg.getDataSetId(6, -1);
		int days=6;
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
					
					// walking segment 
					if(segmentOneValue.getIntVal()==7){
						SegmentDto segDto = new SegmentDto();
						segDto.setStartTimeNanos(startTimeNanos);
						segDto.setEndTimeNanos(endTimeNanos);
						segDto.setSegmentVal(segmentOneValue.getIntVal());
						segmentDtoList.add(segDto);
						
						// 확인용
						endTimeStr = String.valueOf(segmentDataOnePoint.getEndTimeNanos()).substring(0, 13);
						startTimeStr = String.valueOf(segmentDataOnePoint.getStartTimeNanos()).substring(0, 13);
						walkingSegment+=(Long.valueOf(endTimeStr)-Long.valueOf(startTimeStr));
					}
					
					// running segment
					else if(segmentOneValue.getIntVal()==8){
						SegmentDto segDto = new SegmentDto();
						segDto.setStartTimeNanos(startTimeNanos);
						segDto.setEndTimeNanos(endTimeNanos);
						segDto.setSegmentVal(segmentOneValue.getIntVal());
						segmentDtoList.add(segDto);
						endTimeStr = String.valueOf(segmentDataOnePoint.getEndTimeNanos()).substring(0, 13);
						startTimeStr = String.valueOf(segmentDataOnePoint.getStartTimeNanos()).substring(0, 13);
						//endTimeCal.setTimeInMillis(Long.parseLong(endTime));
						//startTimeCal.setTimeInMillis(Long.parseLong(startTime));
						//System.out.println(endTimeCal.getTime()+" / "+startTimeCal.getTime());
						//walkingSegment+=(Long.valueOf(endTimeStr)-Long.valueOf(startTimeStr));
					}
					
					// biking segment?
					/*else if(segmentOneValue.getIntVal()==1){
						segDto.setStartTimeNanos(startTimeNanos);
						segDto.setEndTimeNanos(endTimeNanos);
						segDto.setSegmentVal(segmentOneValue.getIntVal());
						segmentDtoList.add(segDto);
						endTimeStr = String.valueOf(segmentDataOnePoint.getEndTimeNanos()).substring(0, 13);
						startTimeStr = String.valueOf(segmentDataOnePoint.getStartTimeNanos()).substring(0, 13);
						walkingSegment+=(Long.valueOf(endTimeStr)-Long.valueOf(startTimeStr));
					}*/
				}
			}
			System.out.println("walkingMinutes : "+walkingSegment/60000);
			walkingSegment=0;
		}
		return null;	
	}

	public double callDistance(Fitness fclient) throws Exception {
		System.out.println("segmentDtoList.size() : "+segmentDtoList.size());
		SegmentDto testDto = new SegmentDto();
		for(int k=0;k<segmentDtoList.size();k++){
			testDto = (SegmentDto) segmentDtoList.get(k);
			System.out.println("Time : "+testDto.getStartTimeNanos()+"-"+testDto.getEndTimeNanos()+" / "+"segmentVal : "+testDto.getSegmentVal());
		}
		double mergeDistance=0, walkingDistance=0;
		dataStreamId = "derived:com.google.distance.delta:com.google.android.gms:merge_distance_delta";
		dataSetId = dsg.getDataSetId(0, -1); // 하루
		Dataset distanceDatasets = fclient.users().dataSources().datasets()
				.get("me", dataStreamId, dataSetId).execute();
		List mergeDistPoints = distanceDatasets.getPoint();
		DataPoint mergeDistOnePoint = null;
		
		// 활동거리가 있을 때만 진행
		if(mergeDistPoints!=null&&segmentDtoList.size()>0){ 
			SegmentDto segDto = new SegmentDto();
			long distStartTimeNanos=0, distEndTimeNanos=0;
			for(int i=0; i<1;i++){
				for (int j = 0; j < mergeDistPoints.size(); j++) {
					mergeDistOnePoint = (DataPoint) mergeDistPoints.get(j);
					
						//System.out.println(j+","+i);
						segDto = (SegmentDto) segmentDtoList.get(i);
						List<Value> mergeDistValues = mergeDistOnePoint.getValue();
						if(mergeDistOnePoint.getStartTimeNanos()>=((segDto.getStartTimeNanos()/1000000000000l)*1000000000000l)&&
								((mergeDistOnePoint.getEndTimeNanos()/1000000000000l)*1000000000000l)<=segDto.getEndTimeNanos()){
							System.out.println("mergeDistValues: "+mergeDistValues.get(0).getFpVal());
							System.out.println(segDto.getSegmentVal());
							if(segDto.getSegmentVal()==7){
								//mergeDistance+=segDto.getDistance();
								walkingDistance+=mergeDistValues.get(0).getFpVal();
								segDto.setDistance(mergeDistValues.get(0).getFpVal());
							}
							else if(segDto.getSegmentVal()==8){
								System.out.println("getSegmentVal()==8");
								segDto.setDistance(mergeDistValues.get(0).getFpVal());
							}
						}
					}
					//mergeDistance += obj5;
			}
			//System.out.println(((segDto.getStartTimeNanos()/1000000000)*1000000000));
			//System.out.println(((mergeDistOnePoint.getEndTimeNanos()/1000000000)*1000000000));
		}
		System.out.println(walkingDistance);
		return mergeDistance;
	}
}
