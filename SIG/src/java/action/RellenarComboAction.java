package action;

import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import beans.Institucion;
import com.opensymphony.xwork2.ModelDriven;

public class RellenarComboAction extends ActionSupport implements ModelDriven
{
	Institucion instForm= new Institucion();

	@Override
	public String execute() throws Exception
	{
		return SUCCESS;
	}

	@Override
	public Institucion getModel()
	{
		return instForm;
	}
}