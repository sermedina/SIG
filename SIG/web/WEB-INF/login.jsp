<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://www.usb.ve/equivalencias"
		http-equiv="Content-Style-Type"
		content="text/css">
	<meta http-equiv="Content-Type"
		  content="text/html; charset=utf-8" />
	<meta charset="utf-8" />
	<link rel="shortcut icon"
		  href="http://www.dace.usb.ve/sites/default/files/bluemarine_favicon.ico"
		  type="image/vnd.microsoft.icon" />

	<title>Sistema de Equivalencias de Estudios Universidad Simon Bolivar | Direccion de
	Admision y Control de Estudios (DACE)</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css" type="text/css" media="all" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select.js"></script>
	<link rel="shortcut icon" href="http://www.dace.usb.ve/sites/default/files/bluemarine_favicon.ico" type="image/vnd.microsoft.icon" />
</head>
	<body>
	<s:div id="header">
		<table border="0" width="100%">
		<tr>
			<td>
				<img src="./images/usb-logo.gif" alt="USB" />
			</td>
			<td align="center">
				<h1>Universidad Sim&oacute;n Bol&iacute;var</h1>
				<h2>Servicio Centralizado de Autenticación</h2>
			</td>
		</tr>
		</table>
	</s:div>

	<s:div id="content">
		<div id="errors">
			<ul>
				<li><s:actionerror/></li>
			</ul>
		</div>

		<s:form action="LoginAction" namespace="/" method="POST" align="center">
			<s:div id="welcome">
				<s:div style="margin-left: auto; margin-right: auto; left: 50%; width: 300px;">
					<p><strong>Introduzca su usuario y contraseña.</strong></p>
					<p>
						<label for="usr">Usuario:</label><br />
						<input type="text" name="usr" size="32" tabindex="1" required="true" id="usr"/>
					</p>
					<p>
						<label for="pas">Contraseña:</label><br />
						<input type="password" name="pas" size="33" tabindex="2" required="true" id="pas"/>
					</p>
					<p style="text-align: center;">
						<input type="submit" name="Submit" value="Ingresar" onclick=""/>
					</p>
				</s:div>
			</s:div>
		</s:form>
	</s:div>
	<footer>
		<s:div id="copyright">
			<p>
				Copyright &copy 2013 TONINAS GROUP. All rights reserved.
				<br>
				Powered by <a href="struts.apache.org/2.x/">Struts 2<a>
			</p>
		</s:div>
	</footer>
	</body>
</html>