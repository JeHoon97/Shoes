package ez.web.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ez.web.model.ShoesAdDAO;
import ez.web.model.ShoesAdDTO;

public class ShoesAdLoginOkCommand implements ShoesCommand{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		ShoesAdDAO dao = ShoesAdDAO.getInstance();
		int chkNum = dao.adminCheck(id, pw);
		
		HttpSession session =request.getSession();
		
		if(chkNum == dao.ADMIN_LOGIN_NOT){
			request.setAttribute("loginErr", "idErr");
		}else if(chkNum == dao.ADMIN_LOGIN_PW_FAIL){
			request.setAttribute("loginErr", "pwErr");
			session.setAttribute("id", id);
		}else if(chkNum == dao.ADMIN_LOGIN_SUCCESS){
			ShoesAdDTO dto = dao.getAdminInfo(id);
			
			String name = dto.getName();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("isLogin", "yes");
			session.setAttribute("memberInfo", "admin");
		}
		
		String viewPage = null;
		

		if(request.getAttribute("loginErr") !=null) {
			viewPage = "/admin/shoesAd_login.jsp";
		}else {
			viewPage = "/admin/shoesAd_main.jsp";
		}
		return viewPage;
	}
}
