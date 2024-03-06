package springdemo.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestDbServlet
 */
public class TestDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestDbServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		// setup connection variables
		String user = "springstudent";
		String pass = "springstudent";

		String jdbcUrl = "jdbc:mysql://localhost:3306/asm1?useSSL=true&requireSSL=true";
		String driver = "com.mysql.cj.jdbc.Driver";

		try {
			PrintWriter out = response.getWriter();

			out.println("Connecting to database: " + jdbcUrl);

			Class.forName(driver);

			Connection myConn = DriverManager.getConnection(jdbcUrl, user, pass);

			out.println("SUCCESS !!!");

			myConn.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
//					throw new ServletException(e);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
