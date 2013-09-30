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
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.RequestAware;

/**
 *
 * @author Administrador
 */
public class ModificarInstitucionAction extends ActionSupport implements RequestAware,ServletRequestAware, ServletResponseAware {


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

	public ModificarInstitucionAction()
	{
	}

	@Override
	public String execute() throws Exception
	{
		Connection con;
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

			String sNombre = request.getParameter("sNuevoNombre");
			String sAcro = request.getParameter("acronimo");
			if (sNombre == null || sAcro == null)
				return INPUT;
			if (sNombre.trim().equals("") || sAcro.trim().equals(""))
			{
				request1.put("mensaje", "Ingrese un nombre no vacio");
				return INPUT;
			}

			try
			{
				String sqlOption="UPDATE universidad SET nombre = ? WHERE acronimo = ?";

				psdoLogin=con.prepareStatement(sqlOption);
				psdoLogin.setString(1,sNombre);
				psdoLogin.setString(2,sAcro);

				psdoLogin.executeUpdate();
				psdoLogin.close();
				request1.put("mensaje", "Modificacion exitosa de la universidad: "+sAcro+" a nombre: "+sNombre);
				return SUCCESS;
			}
			catch(Exception e)
			{
				response.sendRedirect("modInstitucion.jsp?error="+"Ingrese un string no vacio");
				e.printStackTrace();
				return INPUT;
			}
		}

		return INPUT;
	}
}