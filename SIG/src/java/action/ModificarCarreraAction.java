/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.RequestAware;

/**
 *
 * @author Administrador
 */
public class ModificarCarreraAction extends ActionSupport implements RequestAware, ServletRequestAware, ServletResponseAware
{

	private Map<String, Object> request1;
	private HttpServletRequest request=null;
	private HttpServletResponse response=null;
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

	public ModificarCarreraAction()
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

			String sAcronimo = request.getParameter("acronimo");
			String sCodigo = request.getParameter("codCar");
			String sNuevoNombre = request.getParameter("sNuevoNombre");

			if (sNuevoNombre.trim().equals(""))
			{
				request1.put("mensaje","Ingrese un nombre no vacio" );
				return INPUT;
			}

			try
			{
				String sqlOption="UPDATE carrera SET nombrecarrera = ? WHERE codigocarrera = ? AND universidad = ?";

				psdoLogin=con.prepareStatement(sqlOption);
				psdoLogin.setString(1,sNuevoNombre);
				psdoLogin.setString(2,sCodigo);
				psdoLogin.setString(3,sAcronimo);

				psdoLogin.executeUpdate();
				psdoLogin.close();
				request1.put("mensaje","Se modifico la carrera ("+sCodigo+") "
						+ " en " + sAcronimo + " con nuevo nombre " + sNuevoNombre);

				return SUCCESS;
			}
			catch(Exception e)
			{
				request1.put("mensaje", e);
				e.printStackTrace();
			}
		}
		return INPUT;
	}
}