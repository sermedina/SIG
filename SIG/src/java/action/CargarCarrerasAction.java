package action;

import java.sql.*;
import java.util.Map;
import java.util.HashMap;
import com.opensymphony.xwork2.Action;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


public class CargarCarrerasAction
{
	private Map<String, String> maps = new HashMap<String, String>();
	//response.setContentType("text/html;charset=UTF-8");
	HttpServletRequest request = ServletActionContext.getRequest();

	public CargarCarrerasAction() throws Exception
	{
		String univ = request.getParameter("uni");

		ResultSet res2;
		PreparedStatement psdoLogin;
		try
		{
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/equivalencia","sealos", "me");

			psdoLogin=con.prepareStatement("SELECT codigocarrera, nombrecarrera FROM CARRERA WHERE universidad = " + "\'"+ univ +"\'");
			res2 = psdoLogin.executeQuery();

			while (res2.next())
			{
				String codigo = res2.getString(1);
				String nombre = res2.getString(2);
				maps.put(codigo+ " " + nombre, codigo);
			}

			con.close();
		}
		catch (SQLException e)
		{
			System.out.println("Error accediendo base de datos:  "+e);
			e.printStackTrace();
		}
	}

	public String execute()
	{
		return Action.SUCCESS;
	}

	public Map<String, String> getMaps()
	{
		return maps;
	}

	public void setMaps(Map<String, String> maps)
	{
		this.maps = maps;
	}
}