package control;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserCommand implements Command {

	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			 throws ServerException, IOException {
		
		return "/user.jsp";
	}

}

