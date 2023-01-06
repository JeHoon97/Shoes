package ez.web.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ez.web.model.ProductDAO;

public class ProdDeleteCommand implements ShoesCommand{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pNum = request.getParameter("pNum");

		if(pNum == null || pNum.trim().equals("")){
			return "/admin/ad_main.jsp";
		}
		
		String pImage =request.getParameter("pImage");
		String realPath = request.getServletContext().getRealPath("uploadedFile");
		
		File delFile = null;
		
		if(pImage != null){
			delFile = new File(realPath + "/"+pImage);
			System.out.println("삭제할 파일명 경로 : "+ delFile);
			if(delFile.exists()){
				if(delFile.delete()) System.out.println("이미지 파일 삭제 완료!!");
			}
		}
		
		ProductDAO dao = ProductDAO.getInstance();
		int n = dao.delProduct(pNum.trim());
			
		String viewPage = null;
		if(n > 0){
			request.setAttribute("msg", "상품 삭제처리 완료!!");
			viewPage = "prodList.do";
		}else{
			request.setAttribute("msg", "상품 삭제처리 실패!!");
			viewPage = "/admin/pd_list.jsp";
		}		
		
		return viewPage;
	}
}
