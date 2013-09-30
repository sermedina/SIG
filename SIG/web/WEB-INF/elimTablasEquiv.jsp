<%--
	Document   : elimTablasEquiv
	Created on : May 30, 2013, 4:51:00 AM
	Author	 : brian-m
--%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://www.usb.ve/equivalencias">
	<meta http-equiv="Content-Type"
		  content="text/html; charset=utf-8" />
	<link rel="shortcut icon"
		  href="http://www.dace.usb.ve/sites/default/files/bluemarine_favicon.ico"
		  type="image/vnd.microsoft.icon" />

	<title>Sistema de Equivalencias de Estudios Universidad Simon Bolivar | Direccion de
	Admision y Control de Estudios (DACE)</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all" />

	<title>Eliminar Tabla de Equivalencia</title>
	<meta http-equiv="Content-Type"
		  content="text/html; charset=utf-8" />
	<style type="text/css">
		div.c2 {text-align: center}
		h2.c1 {text-align:center; font-size: 30px}
	</style>
</head>
<p align="center"><image src="${pageContext.request.contextPath}/images/top_bar_dace.jpg" width="973" height="147"/></p>
<body>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<h2 class="c1">Eliminar Tabla de Equivalencia</h2><br />
	<br />

	<div class="c2">
		<form name="consultarTabla"
			  action="consultarTabla.jsp"
			  method="post"
			  id="consultarTabla">
			<input type="submit"
				  name="sSubmit"
				  value="Atras" />
		</form><br />

		<s:form action="Index" namespace="/" method="POST">
			<p class="c2"><input type="submit" name="sub" value="Inicio" width="75"/></p>
		</s:form><br />
	</div>
</body>
</html>
