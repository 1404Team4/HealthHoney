package util.oauth;

import java.io.IOException;
import java.util.Vector;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.services.plus.Plus;
import com.google.api.services.plus.model.PeopleFeed;
import com.google.api.services.plus.model.Person;

public class OauthPlus implements OauthAPI {
	Vector userInfo;
	Person mePerson;
	PeopleFeed peopleFeed;

	public Plus createObj(HttpTransport httpTransport,
			JsonFactory JSON_FACTORY, Credential credential,
			String APPLICATION_NAME) {
		return new Plus.Builder(httpTransport, JSON_FACTORY, credential)
				.setApplicationName(APPLICATION_NAME).build();
	}

	public Vector getPeople(Plus plus) {
		userInfo = new Vector();
		try {
			// 유저 정보
			// https://developers.google.com/+/api/latest/people#resource
			mePerson = plus.people().get("me").execute();
			
			// 사용자가 추가한 사용자 리스트
			//https://developers.google.com/+/api/latest/people/list
			Plus.People.List listPeople = plus.people().list("me", "visible");
			peopleFeed = listPeople.execute();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userInfo.add(mePerson);
		userInfo.add(peopleFeed);
		
		return userInfo;
	}
}
