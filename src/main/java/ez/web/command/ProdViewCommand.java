package ez.web.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ez.web.model.ProductDAO;
import ez.web.model.ProductDTO;
import ez.web.util.ProdSpec;

public class ProdViewCommand implements ShoesCommand{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pNum = request.getParameter("pNum");
		String pSpec = request.getParameter("pSpec");
		
		if(pNum == null || pNum.trim().equals("")){
			return "/customer/user_main.jsp";
		}
		
		ProductDAO pDao = ProductDAO.getInstance();
		ProductDTO pDto = pDao.getProduct(pNum);
		
		String specValue = ProdSpec.valueOf(pSpec).getValue();
		
		request.setAttribute("pNum", pNum);
		request.setAttribute("pSpec", pSpec);
		request.setAttribute("specValue", specValue);
		request.setAttribute("pDto", pDto);
		
		return "/customer/prod_view.jsp";
	}
}
