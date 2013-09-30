package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware, ServletRequestAware, ServletResponseAware
{
	private Map session;
	private HttpServletRequest request;
	private HttpServletResponse response;

	@Override
	public String execute() throws Exception
	{
		if (request != null && request.getSession() != null)
		{
			request.getSession().invalidate();
			addActionError("Sesión cerrada.");
		}
		return SUCCESS;
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
}