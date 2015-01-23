package util;

import java.io.FileReader;

import javax.servlet.ServletContext;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class oauthKey {
	public static void main(String[] args) {
		JSONParser parser = new JSONParser();
		try {
			// ServletContext ctx = req.getServletContext();
			String path = new java.io.File("").getAbsolutePath()
					+ "/WebContent";

			//System.out.println(new java.io.File("").getAbsolutePath());
			//System.out.println(new java.io.File("").getCanonicalPath());
			// System.out.println(this.getClassLoader().getResource("").getPath());
			Object obj = parser.parse(new FileReader(path + "/client.json"));
			JSONObject jsonObject = (JSONObject) obj;
			//System.out.println(obj);// 전체.
			Object web = jsonObject.get("web");
			JSONObject webObject = (JSONObject) web;
			String client_id = (String) webObject.get("client_id");
			System.out.println("client id : "+ client_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
