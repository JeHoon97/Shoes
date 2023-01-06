package ez.web.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ez.web.model.CategoryDAO;
import ez.web.model.CategoryDTO;
import ez.web.model.ProductDAO;
import ez.web.model.ProductDTO;

public class ProdUpdateCommand implements ShoesCommand{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pNum = request.getParameter("pNum");
		
		if(pNum == null || pNum.trim().equals("")){
			return "/admin/pd_list.jsp";
		}
		ProductDAO pDao = ProductDAO.getInstance();
		ProductDTO pDto =pDao.getProduct(pNum);
		request.setAttribute("pDto", pDto);
		
		CategoryDAO dao = CategoryDAO.getInstance();
		ArrayList<CategoryDTO> dtos=dao.categoryList();
		request.setAttribute("list", dtos);
		
		return "/admin/pd_update.jsp";
	}
}
