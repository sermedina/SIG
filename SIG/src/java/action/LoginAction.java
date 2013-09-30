package action;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import beans.Login;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware, ServletRequestAware, ServletResponseAware
{
	private Map session;
	private String mensajeError;
	private String usr;
	private String pas;

	private HttpServletRequest request;
	private HttpServletResponse response;
	Login login;

	@Override
	public String execute() throws Exception
	{
		if (session.get("Login") != null)
			return SUCCESS;

		Connection con;
		try
		{
			Class.forName("org.postgresql.Driver").newInstance();
		}
		catch(ClassNotFoundException e)
		{
			addActionError("Error al conectar con la base de datos.");
			setMensajeError("Error al conectar con la base de datos.");
		}

		Class.forName("org.postgresql.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/equivalencia","sealos", "me");

		if (con != null)
		{
			ResultSet rsdoLogin;
			PreparedStatement psdoLogin;

			String sUserID = getUsr();
			String sPassword = getPas();

			try
			{
				String sqlOption="SELECT * FROM coordinador WHERE"
								+" codigocarrera=? and password=?";

				psdoLogin=con.prepareStatement(sqlOption);
				psdoLogin.setString(1,sUserID);
				psdoLogin.setString(2,sPassword);

				rsdoLogin = psdoLogin.executeQuery();

				if(rsdoLogin.next())
				{
					login = new Login();
					login.setUserName(getUsr());
					login.setEmail(rsdoLogin.getString("email"));
					login.setPassword(getPas());
					session.put("Login", login);
					session.put("Usuario", rsdoLogin.getString("email"));
					session.put("Privilegios", "1");
					return SUCCESS;
				}
				else
				{
					addActionError("Usuario o contraseña incorrecta.");
					setMensajeError("Usuario o contraseña incorrecta.");
				}
			}
			catch(Exception e)
			{
				response.sendRedirect("login.jsp?error="+e);
				e.printStackTrace();
				return ERROR;
			}

			/// close object and connection
			try
			{
				psdoLogin.close();
				rsdoLogin.close();
				con.close();
			}
			catch(Exception e)
			{
				addActionError("Error al conectar con la base de datos.");
				setMensajeError("Error al conectar con la base de datos.");
				return ERROR;
			}
		}
			return INPUT;
	}

	public Map getSession()
	{
		return session;
	}

	@Override
	public void setSession(Map session)
	{
		this.session = session;
	}

	public String getUsr()
	{
		return usr;
	}

	public void setUsr(String usr)
	{
		this.usr = usr;
	}

	public String getPas()
	{
		return pas;
	}

	public void setPas(String pas)
	{
		this.pas = pas;
	}

	public void setMensajeError(String mensajeError)
	{
		this.mensajeError = mensajeError;
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

	public Login getModel()
	{
		return login;
	}
}