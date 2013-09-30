package beans;

import java.util.ArrayList;

import java.sql.*;

/**
 *
 * @author brian-m
 */
public class Institucion
{
	private String nombre;
	private String acronimo;

	ArrayList<Institucion> institucionList = new ArrayList<Institucion>();
	ArrayList<Institucion> carreraList = new ArrayList<Institucion>();

	public Institucion()
	{

	}
	public Institucion(String nom, String acron)
	{
		super();
		this.nombre = nom;
		this.acronimo = acron;
	}

	public String getNombre()
	{
		return nombre;
	}

	public void setNombre(String s)
	{
		nombre = s;
	}

	public String getAcronimo()
	{
		return acronimo;
	}

	public void setAcronimo(String a)
	{
		acronimo = a;
	}

	public ArrayList getCarreraList()
	{
		return carreraList;
	}

	public void setCarreraList(ArrayList a)
	{
		carreraList = a;
	}

	public ArrayList getInstitucionList()
	{
		Connection con;
		Statement stmt;
		ResultSet res;
		try
		{
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/equivalencia","sealos", "me");
			if (con == null)
				return null;

			stmt = con.createStatement();
			res = stmt.executeQuery("SELECT nombre, acronimo FROM UNIVERSIDAD");
			while (res.next())
			{
				String univ = res.getString(1);
				String acro = res.getString(2);
				institucionList.add(new Institucion(univ + " ("+acro+")" ,acro));
			}

			stmt.close();
			res.close();
			con.close();
		}
		catch (SQLException e)
		{
			System.out.println("Error accediendo base de datos:  "+e);
			e.printStackTrace();
		}

		return institucionList;
	}

	public void setInstitucionList(ArrayList a)
	{
		institucionList = a;
	}

	public void reset()
	{
		nombre = "";
		institucionList = new ArrayList();
	}
}
