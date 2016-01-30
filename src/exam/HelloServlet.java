package exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//servlet lifecycle	
@SuppressWarnings("serial")
public class HelloServlet extends HttpServlet {
	
	public HelloServlet() {
		System.out.println("HelloServlet  생성자 호출!!!");
	}

	@Override
	public void init() throws ServletException {
		System.out.println("HelloServlet  init 호출!!!");
	}

	@Override
	public void destroy() {
		System.out.println("HelloServlet  destroy 호출!!!");
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("HelloServlet  service 호출!!!");
		//
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>helloServlet!!</title></head><body>");
		for (int i = 0; i < 5; i++) {
			out.print("안녕 서블릿!!  " + req.getParameter("name") + "<br>");
		}
		out.print("</body></html>");
	}

}
