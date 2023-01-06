package ez.web.frontController;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ez.web.command.ShoesCommand;

//@WebServlet("/FrontController")
public class SfrontController extends HttpServlet {
private HashMap<String, ShoesCommand> commandMap = new HashMap<String, ShoesCommand>();
	
	@Override
	public void init() throws ServletException {
		String configFile=getInitParameter("configFile");
		
		String configPath = getServletContext().getRealPath(configFile);
		Properties prop = new Properties();
		
		try {
			FileReader fis = new FileReader(configPath);
			prop.load(fis);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Iterator keyIter =prop.keySet().iterator();
		
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			System.out.println(command);
			String cmdValue = prop.getProperty(command);
			System.out.println(cmdValue);
			
			
			try {			
				Class<?> cmdClass = Class.forName(cmdValue);
				
				ShoesCommand cmdInstance= (ShoesCommand)cmdClass.getDeclaredConstructor().newInstance();
				
				commandMap.put(command, cmdInstance);
				
				ShoesCommand cmdInstance2 = commandMap.get(command);
				System.out.println("cmdInstance2 : " + cmdInstance2);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();		
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length());
		System.out.println("cmd : " + cmd);
		
		request.setAttribute("cmd", cmd);
		
		ShoesCommand cmdInstance = commandMap.get(cmd.trim());
		
		String viewPage = null;
		viewPage = cmdInstance.execute(request, response);
		
		if(viewPage != null) {
			RequestDispatcher rd = request.getRequestDispatcher(viewPage);
			rd.forward(request, response);
		}
	}

}
