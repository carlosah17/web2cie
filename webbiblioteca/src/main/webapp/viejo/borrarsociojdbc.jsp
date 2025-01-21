<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="es.ascender.biblioteca.negocio.Socio" %>
<%@ page import="es.ascender.biblioteca.repositories.SocioRepository" %>
<%@ page import="es.ascender.biblioteca.repositories.jdbc.SocioRepositoryJDBC" %>

<%
String dni= request.getParameter("dni");
Socio s= new Socio(dni);
SocioRepository repo= new SocioRepositoryJDBC();
repo.borrar(s);
response.sendRedirect("listasociosjdbc.jsp");
%>
