/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;
import beans.Login;
import java.util.ArrayList;
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
public class AgregarCarreraAction extends ActionSupport implements RequestAware, ServletRequestAware, ServletResponseAware
{

	private Map<String, Object> request1;
	private HttpServletRequest request=null;
	private HttpServletResponse response=null;
	ArrayList lista= new ArrayList();
	//response.setContentType("text/html;charset=UTF-8");
	Login loginForm = new Login();

	public AgregarCarreraAction()
	{
	}

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

	@Override
	public String execute() throws Exception
	{
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
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/equivalencia","sealos", "me");

		if (con != null)
		{
			PreparedStatement psdoLogin;

			String sCodigo = request.getParameter("sCodigo");
			String sNombre = request.getParameter("sNombre");
			String sAcronimo = request.getParameter("acronimo");
			if (sNombre.trim().equals("") || sCodigo.trim().equals(""))
			{
				request1.put("mensaje", "Ingrese un string no vacio");
				return INPUT;
			}

			try
			{
				String sqlOption="INSERT INTO carrera(codigocarrera, nombrecarrera, universidad) VALUES(?, ?, ?)";

				psdoLogin=con.prepareStatement(sqlOption);
				psdoLogin.setString(1,sCodigo);
				psdoLogin.setString(2,sNombre);
				psdoLogin.setString(3,sAcronimo);

				psdoLogin.executeUpdate();
				psdoLogin.close();
				request1.put("mensaje","Se agrego la carrera ("+sCodigo+") "+ sNombre + " en " + sAcronimo);
				return SUCCESS;
			}
			catch(Exception e)
			{
				request1.put("mensaje", e);
				return INPUT;
			}
		}

		return ERROR;
	}
}