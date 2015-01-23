package util.oauth;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;
import java.util.Vector;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.*;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventAttendee;
import com.google.api.services.calendar.model.EventDateTime;

public class OauthCalendar implements OauthAPI {
	com.google.api.services.calendar.model.Calendar calendar;
	Event createdEvent;
	static Calendar service; // 캘린더 객체.

	public Calendar createObj(HttpTransport httpTransport,
			JsonFactory JSON_FACTORY, Credential credential,
			String APPLICATION_NAME) {
		service = new Calendar.Builder(httpTransport, JSON_FACTORY, credential)
				.setApplicationName(APPLICATION_NAME).build();

		return service;
	}

	public com.google.api.services.calendar.model.Calendar getCalender() {
		// https://developers.google.com/google-apps/calendar/v3/reference/calendars/get

		try {
			calendar = service.calendars().get("primary").execute();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return calendar;
	}

	public void addEvent(Vector list) {
		// https://developers.google.com/google-apps/calendar/v3/reference/events/insert
		String startTime=null;
		String endTime=null;
		try {
			// Create and initialize a new event
			Event event = new Event();

			if(list.get(3).toString().length()<1){
				list.set(3, list.get(1));
			}

			// startTime이 endTime보다 시간이 뒤일때
			if(totalTime(list.get(2)) < totalTime(list.get(4))){
				System.out.println("정상");
				startTime = makeDate(list.get(1))+makeTime(list.get(2));
				endTime = makeDate(list.get(3))+makeTime(list.get(4));
			}
			else{
				startTime = makeDate(list.get(1))+makeTime(list.get(2));
				endTime = makeDate(list.get(3))+"00:00";
			}
			
			// 날짜형식 포맷적용을 위한 format
			DateFormat sdFormat = new SimpleDateFormat("MM/dd/yyyyHH:mm");

			event.setSummary((String) list.get(0));
			Date startDate = sdFormat.parse(startTime);
			DateTime start = new DateTime(startDate,TimeZone.getTimeZone("UTC"));
			Date endDate = sdFormat.parse(endTime);
			
			if(list.get(1).equals(list.get(3))){
				java.util.Calendar c = java.util.Calendar.getInstance();
				c.setTime(endDate);
				c.add(java.util.Calendar.DATE,1);
				endDate = c.getTime();
				}
			
			DateTime end = new DateTime(endDate, TimeZone.getTimeZone("UTC"));
			
			//제목을 입력 안했을경우 등록한 날짜에 추가한 일정 이라는 제목이 생김
			if(list.get(0).toString().length() != 0 ){
				event.setSummary((String) list.get(0));
			}
			else{
				event.setSummary(makeDate(list.get(1)+"에 추가한 일정"));
			}
			event.setStart(new EventDateTime().setDateTime(start));
			event.setEnd(new EventDateTime().setDateTime(end));

			// Insert the new event
			createdEvent = service.events().insert("primary", event).execute();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//날짜가 비었을때 처리
	//종료시간이 시작시간이랑
	public String makeDate(Object data) {
		String date = (String)data;
		if(date.length() < 1){
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
			date = formatter.format (new Date());
		}
		return (String)date;
	}
	
	//메서드 분할~~~~
	public String makeTime(Object clock){
		int hour, min, time_total;
		String clockstr = clock.toString();
		if(clockstr == null || clockstr ==""){
			clockstr = "00:00 AM";
		}
		String[] times = clockstr.split("[: ]");
		hour = Integer.parseInt(times[0]);//캐스팅말고 그냥값으로 가져오기
		min = Integer.parseInt(times[1]);
		if ("PM".equals(times[2] )) {
			hour += 12;
		}
		return hour+":"+min;
	}
	
	public int totalTime(Object clock){
		int hour, min, time_total;
		String clockstr = clock.toString();
		if(clockstr == null || clockstr ==""){
			clockstr = "00:00 AM";
		}
		String[] times = clockstr.split("[: ]");
		hour = Integer.parseInt(times[0]);//캐스팅말고 그냥값으로 가져오기
		min = Integer.parseInt(times[1]);
		if ("PM".equals(times[2] )) {
			hour += 12;
		}
		time_total = hour*60+min;
		return time_total;
	}
}
