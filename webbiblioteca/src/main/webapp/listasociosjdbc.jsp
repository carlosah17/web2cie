<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="es.ascender.biblioteca.negocio.Socio"%>
<%@ page
	import="es.ascender.biblioteca.repositories.jdbc.SocioRepositoryJDBC"%>
<%@ page import="es.ascender.biblioteca.repositories.SocioRepository"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

	SocioRepository repo = new SocioRepositoryJDBC();
	List<Socio> lista=null;
	
	
	
	if (request.getParameter("orden")!=null) {
		
		out.println("ordenado por  "+ request.getParameter("orden"));
		lista=repo.buscarTodosOrdenados(request.getParameter("orden"));
	}else {
		
		out.println("no hay orden");
		lista=repo.buscarTodos();
	}
	

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