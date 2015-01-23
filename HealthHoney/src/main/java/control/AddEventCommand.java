package control;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.services.calendar.Calendar;

import util.oauth.OauthAPI;
import util.oauth.OauthCalendar;

public class AddEventCommand implements Command {

	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException {
		
		Vector eventlist = new Vector();
		String summary = req.getParameter("cal_event_summary");
		String from = req.getParameter("from");
		String startTime = req.getParameter("startTime");
		String to = req.getParameter("to");
		String endTime = req.getParameter("endTime");
		String description = req.getParameter("description");

		eventlist.add(summary);
		eventlist.add(from);
		eventlist.add(startTime);
		eventlist.add(to);
		eventlist.add(endTime);
		eventlist.add(description);
		
		OauthCalendar cal = new OauthCalendar();
		cal.addEvent(eventlist);
		
		return  "/main?cmd=CLOSER";
	}

}
