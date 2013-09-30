/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.RequestAware;

/**
 *
 * @author Administrador
 */
public class EliminarInstitucionAction extends ActionSupport implements RequestAware, ServletRequestAware, ServletResponseAware
{
	private HttpServletRequest request=null;
	private HttpServletResponse response=null;
	private Map<String, Object> request1;
	//response.setContentType("text/html;charset=UTF-8");

	@Override
	public void setServletRequest(HttpServletRequest request)
	{
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response)
	{
		this.response = response;
	}

	@Override
	public void setRequest(Map<String, Object> map)
	{
		this.request1 = map;
	}

	public EliminarInstitucionAction()
	{
	}

	@Override
	public String execute() throws Exception
	{
		Connection con = null;
		try
		{
			Class.forName("org.postgresql.Driver").newInstance();
		}
		catch(ClassNotFoundException e)
		{

				response.sendRedirect("login.jsp?error="+"BadDB");
				return ERROR;

		}

		Class.forName("org.postgresql.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/equivalencia","sealos", "me");

		if (con != null)
		{
			PreparedStatement psdoLogin;

			String sAcro = request.getParameter("acronimo");
			try
			{
				String sqlOption="DELETE FROM universidad WHERE acronimo = ?";

				psdoLogin=con.prepareStatement(sqlOption);
				psdoLogin.setString(1,sAcro);

				psdoLogin.executeUpdate();
				psdoLogin.close();
				request1.put("mensaje", "Eliminacion exitosa de la universidad: "+sAcro);
				return SUCCESS;
			}
			catch(Exception e)
			{
				request1.put("mensaje",e);
				return INPUT;
			}
		}
		return INPUT;
	}
}