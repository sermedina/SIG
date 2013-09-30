<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <jsp:include page="WEB-INF/inc/loginCheck.jsp" /> --%>
<!DOCTYPE html>
<html>

<head profile="http://www.usb.ve/equivalencias">
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="utf-8" />

<link rel="shortcut icon" href="http://www.dace.usb.ve/sites/default/files/bluemarine_favicon.ico" type="image/vnd.microsoft.icon" />

  <title> Sistema de Equivalencias de Estudios Universidad Simon Bolivar  | Direccion de Admision y Control de Estudios (DACE)
  </title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/list.css" type="text/css" media="all" />

</head>
<p align="center"><image src="${pageContext.request.contextPath}/images/top_bar_dace.jpg" width="973" height="147"/></p>

<body>
	<center><br><br><p style="font-size: 20px"> Has ingresado como: <%= session.getAttribute("Usuario") %><br /><br>
	
		<nav align="center">
			<ul>
				<li><a href="<s:url action="Index"/>">Inicio</a>
				<li><a href="<s:url action="gestInstitucion"/>">Gestionar Instituciones</a>
					<ul>
						<li><a href="<s:url action="agrInstitucion"/>">Agregar Institución</a></li>
						<li><a href="<s:url action="modInstitucion"/>">Modificar Institución</a></li>
						<li><a href="<s:url action="elimInstitucion"/>">Eliminar Institución</a></li>
					</ul>
				</li>
				<li><a href="<s:url action="gestCarreras"/>">Gestionar Carreras</a>
					<ul>
						<li><a href="<s:url action="agregarCarrera"/>">Agregar Carrera</a></li>
						<li><a href="<s:url action="consultarCarrera"/>">Consultar Carreras</a>
							<ul>
								<li><a href="<s:url action="modCarrera"/>">Modificar</a></li>
								<li><a href="<s:url action="elimCarrera"/>">Eliminar</a></li>
							</ul>
						</li>
						<li><a href="<s:url action="elimCarrera"/>">Eliminar Carreras</a></li>
					</ul>
				</li>
				<li><a href="<s:url action="Logout"/>">Cerrar Sesión</a></li>
			</ul>
		</nav>
	</center>
	<footer>
		<s:div id="copyright">
			<p>
				Copyright &copy 2013 TONINAS GROUP. All rights reserved.
				<br>
				Powered by <a href="struts.apache.org/2.x/">Struts 2<a>
			</p>
		</s:div>
	</footer>
</html>
