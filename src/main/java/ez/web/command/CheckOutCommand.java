package ez.web.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ez.web.model.CartDAO;
import ez.web.model.MemberDAO;
import ez.web.model.MemberDTO;
import ez.web.model.ProductDTO;

public class CheckOutCommand implements ShoesCommand{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		CartDAO shopCart = (CartDAO)session.getAttribute("shopCart");
		
		ArrayList<ProductDTO> pDtos = shopCart.getCartList();
		
		String id = (String)session.getAttribute("id");
		MemberDAO mDao = MemberDAO.getInstance();		
		MemberDTO mDto = mDao.getMember(id);
		
		request.setAttribute("pDtos", pDtos);
		request.setAttribute("mDto", mDto);
		
		
		return "/customer/check_out.jsp";
	}
}
