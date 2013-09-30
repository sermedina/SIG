<%--
	Document   : elimInstitucion
	Created on : May 30, 2013, 1:53:46 AM
	Author	 : brian-m
--%>

<%@page contentType="text/html, java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
	  <head profile="http://www.usb.ve/equivalencias">
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="shortcut icon" href="http://www.dace.usb.ve/sites/default/files/bluemarine_favicon.ico" type="image/vnd.microsoft.icon" />

  <title> Sistema de Equivalencias de Estudios Universidad Simon Bolivar  | Direccion de Admision y Control de Estudios (DACE)
  </title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/selectAjax.js"></script>

<title>Agregar Institucion</title>
</head>
<p align="center"><image src="${pageContext.request.contextPath}/images/top_bar_dace.jpg" width="973" height="147"/></p>

	<body>
		<br><br><br><br><br><br><br><br><br><br><br>
		<h2 style="text-align:center; font-size: 30px"> Agregar Institucion
		<br><br>
		<span id="msjOut"><s:property value="#request.mensaje" /></span>
		</h2>

		<center>
		<s:form action="/agrInstitucion" theme="simple">
				<br />
				<br>
					Ingrese el nombre de la institucion: <br /><s:textfield  name="sNombre" /><br />
					Ingrese las siglas (Acronimo) de la institucion: <br /><s:textfield name="sAcronimo" /><br />
				<br>
				<s:submit align="center" value="Aceptar" />

		</s:form>	<br />
		<s:form action="gestInstitucion" namespace="/" method="POST">
			<p class="c2"><input type="submit" name="sub" value="Atras" width="75"/></p>
		</s:form>
		<br />
		<s:form action="Index" namespace="/" method="POST">
			<p class="c2"><input type="submit" name="sub" value="Inicio" width="75"/></p>
		</s:form>
		<br>
		</center>
	</body>
</html>
