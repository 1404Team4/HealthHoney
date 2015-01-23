package control;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.oauth.OauthCredential;

public class IndexCommand implements Command {
	Vector dataList;
	Vector userInfo;
	
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException {
		HttpSession session = req.getSession();
		//OauthCredential oauth = new OauthCredential();
		//dataList = FrontController.oauth.Oauth2Fit(req, res);
		//userInfo = FrontController.oauth.Oauth2Plus(req, res);
		//System.out.println("오브젝트"+dataList.size());
		//session.setAttribute("dataList", dataList);
		//session.setAttribute("userInfo", userInfo);
		
		return "/index.jsp";
	}
}
