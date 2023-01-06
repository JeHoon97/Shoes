package ez.web.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ez.web.model.CartDAO;

public class CartDelete2Command implements ShoesCommand{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		CartDAO shopCart = (CartDAO)session.getAttribute("shopCart");
		
		String pNums = request.getParameter("delProdNums");

		String[] pNumArr = pNums.split("/");
		
		if(pNumArr !=null && pNumArr.length > 0){
			for(int i=0; i<pNumArr.length; i++){
				shopCart.deleteProduct(pNumArr[i]);
			}
		}
		
		return "checkOut.do";
	}
}
