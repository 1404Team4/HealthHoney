package control;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.oauth.OauthCredential;

public class CalendarCommand implements Command {
	com.google.api.services.calendar.model.Calendar calendar;
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			 throws ServerException, IOException {

		HttpSession session = req.getSession();
		OauthCredential oauth = new OauthCredential();
		oauth.Oauth2Cal(req, res);
		
		
		calendar = oauth.Oauth2Cal(req, res);
		session.setAttribute("calendar", calendar);
		
		
		
		return "/calendar.jsp";
	}

}

