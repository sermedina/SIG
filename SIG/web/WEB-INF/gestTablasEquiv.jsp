<%--
	Document   : gestTablasEquiv
	Created on : May 30, 2013, 4:27:57 AM
	Author	 : brian-m
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
	 <head profile="http://www.usb.ve/equivalencias">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://www.dace.usb.ve/sites/default/files/bluemarine_favicon.ico" type="image/vnd.microsoft.icon" />

  <title> Sistema de Equivalencias de Estudios Universidad Simon Bolivar  | Direccion de Admision y Control de Estudios (DACE)
  </title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all" />

<script type="text/javascript">
</script>
		<title>Gestionar Tablas de Equivalencia</title>

</head>
<p align="center"><image src="${pageContext.request.contextPath}/images/top_bar_dace.jpg" width="973" height="147"/></p>
<body> <br><br><br><br><br><br><br><br>
		<h2 style="text-align:center; font-size: 30px"> Gestion de las Tablas de Equivalencias </h2>
		<br />
		<br />
		<center>
		<form name="agregarTabla" action="agregarTabla.jsp" method="post">
		<input type="submit" name="sSubmit" value="Agregar Tabla" />
		</form>
		<br />
		<form name="consultarTabla" action="consultarTabla.jsp" method="post">
		<input type="submit" name="sSubmit" value="Consultar Tabla" />
		</form>
		<br />
		<form name="consultarCarrera" action="consultarCarrera.jsp" method="post">
		<input type="submit" name="sSubmit" value="Atras" />
		</form>
		<br />
		<s:form action="Index" namespace="/" method="POST">
			<p class="c2"><input type="submit" name="sub" value="Inicio" width="75"/></p>
		</s:form>
		<br>
		</center>
	</body>
</html>