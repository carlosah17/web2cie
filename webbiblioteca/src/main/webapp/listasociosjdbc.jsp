<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="es.ascender.biblioteca.negocio.Socio"%>

<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

	List<Socio> lista=(List<Socio>) request.getAttribute("lista");

	%>

	<table>
	<thead>
		<tr>
		<th><a href="?orden=dni">Dni</a></th>
		<th><a href="?orden=nombre">Nombre</a></th>
		<th><a href="?orden=apellidos">Apellidos</a></th>
		<th>Borrar</th>
		</tr>
	</thead>
		<%for (Socio s:lista) {%>
		<tr>
			<!-- una columna o celda  -->
			<td><%=s.getDni()%></td>
			<td><%=s.getNombre()%></td>
			<td><%=s.getApellidos()%></td>
			<td><a href="borrarsociojdbc.jsp?dni=<%=s.getDni()%>">borrar</a></td>
		</tr>
		<%} %>
	</table>
<!-- ancla es un enlace a otra pagina -->
<!-- lleva una propiedad href con la pagina de destino y un texto -->
<a href="formulariosocio.html">insertar</a>






</body>
</html>