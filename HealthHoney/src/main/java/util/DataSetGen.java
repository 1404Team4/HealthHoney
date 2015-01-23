package util;

import java.util.Calendar;
import java.util.Date;


public class DataSetGen {
	/****테스트용 메인메서드****/
	public static void main(String[] args) {
		DataSetGen dsg = new DataSetGen();
		
		// startTime 현재일로부터 1일전 자정, endTime 현재일로부터 0일전
		String dataSetId = dsg.getDataSetId(1, 0); 
		System.out.println(dataSetId);
	}
	
	/****dataset 호출에 필요한 dataestId 생성****/
	public String getDataSetId(int startDay, int endDay){
		Date now = new Date();
		Calendar cal = Calendar.getInstance();
		
	    // 현재일 자정시간
		cal.add(Calendar.DATE, -endDay);
		cal.add(Calendar.HOUR, -cal.get(Calendar.HOUR_OF_DAY));
		cal.add(Calendar.MINUTE, -cal.get(Calendar.MINUTE));
		cal.add(Calendar.SECOND, -cal.get(Calendar.SECOND));
		
		// endDay인자 -1일 때 현재일 경과시간 포함
		if(endDay==-1){
			cal.setTime(now);
		}
		//System.out.println("endDay : "+cal.getTime());
		
		
		// endTime endDay일 전 자정시간 설정
		long endTime = cal.getTimeInMillis();
		
		cal.setTime(now);
		
	    // 현재일로부터 startDay일 전 자정
	    cal.add(Calendar.DATE, -startDay);
	    cal.add(Calendar.HOUR, -cal.get(Calendar.HOUR_OF_DAY));
		cal.add(Calendar.MINUTE, -cal.get(Calendar.MINUTE));
		cal.add(Calendar.SECOND, -cal.get(Calendar.SECOND));
	    //System.out.println("startDay : "+cal.getTime());
	    
	    // startTime startDay일 전 자정시간 설정
	    long startTime = cal.getTimeInMillis();
	    
	    String dataSetId = String.valueOf(startTime)+"000000"+"-"+String.valueOf(endTime)+"000000";
	    //System.out.println(dataSetId);
    	return dataSetId;
    }
}
