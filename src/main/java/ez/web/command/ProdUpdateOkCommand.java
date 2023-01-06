package ez.web.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ez.web.model.ProductDAO;

public class ProdUpdateOkCommand implements ShoesCommand{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		MultipartRequest mr = null;
		
		String realPath = request.getServletContext().getRealPath("uploadedFile");
		
		ProductDAO pDao = ProductDAO.getInstance();
		
		String viewPage = null;
		try{
			mr = new MultipartRequest(request, realPath, 1024*1024*10, 
					"utf-8", new DefaultFileRenamePolicy());
			
			int n = pDao.updateProduct(mr);
			
			if(n > 0){
				request.setAttribute("msg", "상품 정보가 수정되었습니다!!!");
				viewPage = "prodList.do";
			}else{
				request.setAttribute("msg", "상품 정보 수정 실패!!");
				viewPage = "/admin/pd_list.jsp";
			}
		}catch(Exception e){
			request.setAttribute("msg", "상품 정보가 수정되었습니다!!!");
			viewPage = "/admin/pd_list.jsp";
		}		
		
		return viewPage;
	}
}
