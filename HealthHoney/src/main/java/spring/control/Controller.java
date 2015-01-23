package spring.control;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.http.HttpRequest;

import spring.board.domain.BoardDto;
import spring.board.domain.CalendarEventDto;
import util.oauth.OauthCalendar;
import util.oauth.OauthCredential;

@org.springframework.stereotype.Controller
@Component
public class Controller {
	@RequestMapping("/index.do")
	public ModelAndView indexCommand() {
		ModelAndView view = new ModelAndView("/WEB-INF/content/index.jsp");
		return view;
	}
	
	@RequestMapping("/intro.do")
	public String introCommand() {
		return "/intro.html";
	}
	@RequestMapping("/calendar.do")
	public String calendarCommand() {
		return "/WEB-INF/content/calendar.jsp";
	}
	@RequestMapping(value="/addevent.do")
	public String preAddEventCommand() {
		return "/WEB-INF/content/AddCalEvents.jsp";
	}

	@RequestMapping(value="/close.do")
	public String addEventCommand() {
		return "/WEB-INF/content/close.html";
	}
	
	@RequestMapping("/user.do")
	public String userCommand() {
		return "/WEB-INF/content/user.jsp";
	}

	@RequestMapping("/table.do")
	public String tableCommand() {
		return "/WEB-INF/content/tables.jsp";
	}
}
