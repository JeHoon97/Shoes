package ez.web.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SmovePageCommand implements ShoesCommand{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String cmd = (String)request.getAttribute("cmd");
		
		String viewPage = null;
		if(cmd.equals("/shoesAdLogin.do")) {
			viewPage = "/admin/shoesAd_login.jsp";
		}else if(cmd.equals("/shoesAdMain.do")) {
			viewPage = "/admin/shoesAd_main.jsp";
		}else if(cmd.equals("/adminCatInput.do")) {
			viewPage = "/admin/cat_input.jsp";
		}else if(cmd.equals("/userLogin.do")) {
			viewPage = "/customer/user_login.jsp";
		}else if(cmd.equals("/userJoin.do")) {
			viewPage = "/customer/user_join.jsp";
		}
		return viewPage;
	}
}
