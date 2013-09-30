
package interceptores;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.Map;
import beans.Login;

/**
 *
 * @author Stefano
 */
public class InterceptorLogin implements Interceptor
{
	public void destroy() {}
	public void init() {}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception
	{
		Map session = actionInvocation.getInvocationContext().getSession();
		Login usuario = (Login) session.get("Login");
		if (usuario == null)
		{
			return Action.LOGIN;
		}
		else
		{
			return actionInvocation.invoke();
		}
	}
}