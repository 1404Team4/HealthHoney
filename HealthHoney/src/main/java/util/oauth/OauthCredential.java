package util.oauth;

import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.DataStoreFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.fitness.Fitness;
import com.google.api.services.fitness.FitnessScopes;
import com.google.api.services.plus.Plus;

import control.IndexCommand;

public class OauthCredential {

	private static final String APPLICATION_NAME = "HoneyJam-Health Honey";

	/** Directory to store user credentials. */
	private static final java.io.File DATA_STORE_DIR = new java.io.File(
			System.getProperty("user.home"), ".store/plus_sample");

	/**
	 * Global instance of the {@link DataStoreFactory}. The best practice is to
	 * make it a single globally shared instance across your application.
	 */
	private static FileDataStoreFactory dataStoreFactory;

	/** Global instance of the HTTP transport. */
	private static HttpTransport httpTransport;

	/** Global instance of the JSON factory. */
	private static final JsonFactory JSON_FACTORY = JacksonFactory
			.getDefaultInstance();

	/** OAuth 2.0 scopes. */
	private static final List<String> SCOPES = Arrays.asList(
			"https://www.googleapis.com/auth/calendar");

	private static Plus plus;
	private static com.google.api.services.calendar.Calendar calendar;
	private static Fitness fclient;
	private static Credential credential;

	public OauthCredential(){
		try{
		httpTransport = GoogleNetHttpTransport.newTrustedTransport();
		dataStoreFactory = new FileDataStoreFactory(DATA_STORE_DIR);
		credential = authorize();
		System.out.println("oauthCredential : "+credential.getAccessToken());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private static Credential authorize() throws Exception {
		// load client secrets
		GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(
				JSON_FACTORY,
				new InputStreamReader(IndexCommand.class
						.getResourceAsStream("/client_secrets.json")));

		// set up authorization code flow
		GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
				httpTransport, JSON_FACTORY, clientSecrets, SCOPES)
				.setDataStoreFactory(dataStoreFactory).build();
		System.out.println("authorize1");
		// authorize
		return new AuthorizationCodeInstalledApp(flow,
				new LocalServerReceiver()).authorize("me1234");
	}

	public Vector Oauth2Plus(HttpServletRequest req, HttpServletResponse res) {
	      Vector userInfo = new Vector();
	      try {


	         OauthAPI oauthPlus = new OauthPlus();
	         plus = (Plus) oauthPlus.createObj(httpTransport, JSON_FACTORY,
	               credential, APPLICATION_NAME);
	         userInfo =  ((OauthPlus) oauthPlus).getPeople(plus);
	      } catch (Throwable t) {
	         t.printStackTrace();
	      }
	      return userInfo;
	   }

	public Vector Oauth2Fit(HttpServletRequest req, HttpServletResponse res) {
		Vector dataList = new Vector();
		try {
			OauthAPI oauthFitness = new OauthFitness();
			
			Fitness fclient = (Fitness) oauthFitness.createObj(httpTransport,
					JSON_FACTORY, credential, APPLICATION_NAME);
			
			// 피트니스 걸은 시간
			Map segMap = ((OauthFitness) oauthFitness)
					.callActivitySegment(fclient);
			
			// 피트니스 걸음 수 호출
			int day = 15;
			ArrayList estiStepsList = ((OauthFitness) oauthFitness)
					.callDailyStep(fclient, day);

			// 피트니스 몸무게 호출
			Vector returnWeight = ((OauthFitness) oauthFitness)
					.callWeight(fclient);
			String weight = (String) returnWeight.get(0);
			ArrayList list = (ArrayList) returnWeight.get(1);

			// 거리
			double mergeDistance = ((OauthFitness) oauthFitness)
					.callDistance(fclient);

			// 반환 객체 생성.
			dataList.add(estiStepsList);
			dataList.add(weight);
			dataList.add(list.get(0)); // 체중 최소값
			dataList.add(list.get(list.size() - 1));// 체중 최대값
			dataList.add(Math.round(mergeDistance));
			dataList.add(segMap); 

		} catch (Throwable t) {
			t.printStackTrace();
		}
		return dataList;
	}

	public com.google.api.services.calendar.model.Calendar Oauth2Cal(HttpServletRequest req, HttpServletResponse res) {
	      com.google.api.services.calendar.model.Calendar calendarList = new com.google.api.services.calendar.model.Calendar();
	      try {
	         OauthAPI oauthCalendar = new OauthCalendar();

	         calendar = (Calendar) oauthCalendar.createObj(httpTransport,
	               JSON_FACTORY, credential, APPLICATION_NAME);
	         //calendarList = ((OauthCalendar) oauthCalendar).getCalender();
	      } catch (Throwable t) {
	         t.printStackTrace();
	      }
	      return calendarList;
	   }
}
