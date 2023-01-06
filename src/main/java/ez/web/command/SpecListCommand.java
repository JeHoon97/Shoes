package ez.web.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ez.web.model.ProductDAO;
import ez.web.model.ProductDTO;
import ez.web.util.ProdSpec;

public class SpecListCommand implements ShoesCommand{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ProductDAO pDao = ProductDAO.getInstance();
		String pSpec = request.getParameter("pSpec");
		System.out.println("~~~~pSpec : " + pSpec);
		
		ArrayList<ProductDTO> pDtos = null;
		
		pDtos = pDao.map.get(pSpec);
		String specValue = ProdSpec.valueOf(pSpec).getValue();
		request.setAttribute("specValue", specValue);
		
		if(pDtos.size() == 0) {
			request.setAttribute("msg", "상품이 존재하지 않습니다!!!");			
		}else{
			request.setAttribute("pDtos", pDtos);
		}
		return "/customer/spec_list.jsp";
	}
}
