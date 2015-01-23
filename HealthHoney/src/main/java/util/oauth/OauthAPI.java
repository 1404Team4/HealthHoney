package util.oauth;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;

public interface OauthAPI {

	Object createObj(HttpTransport httpTransport, JsonFactory JSON_FACTORY,
			Credential credential, String APPLICATION_NAME);
}
