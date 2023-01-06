package uploadTest;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUploadTest
 */
@WebServlet("/upload.do")
public class FileUploadTest extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String savePath = "/uploadedFile";
		
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath(savePath);
		
		System.out.println(realPath);
		
		int maxSize = 1024*1024*10;
		
		MultipartRequest mr= new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		String title = mr.getParameter("title");
		File file = mr.getFile("image");
		String fileName = "";
		
		if(file !=null) {
			fileName = file.getName();
		}
		
		System.out.println(fileName);
		
		request.setAttribute("title", title);
		request.setAttribute("fileName", fileName);

		RequestDispatcher rd = request.getRequestDispatcher("fileUploadTest/result.jsp");
		rd.forward(request, response);
	}

}
