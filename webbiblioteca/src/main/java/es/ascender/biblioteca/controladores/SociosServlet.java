package es.ascender.biblioteca.controladores;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.ascender.biblioteca.negocio.Socio;
import es.ascender.biblioteca.repositories.SocioRepository;
import es.ascender.biblioteca.repositories.jdbc.SocioRepositoryJDBC;


@WebServlet("/SociosServlet")
public class SociosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	SocioRepository repo = new SocioRepositoryJDBC();
	List<Socio> lista=null;
	// el metodo que se ejecuta cuando pido el servlet

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		
		if (request.getParameter("orden")!=null) {
			
			
			lista=repo.buscarTodosOrdenados(request.getParameter("orden"));
		}else {
			
			// los datos de los socios
			lista=repo.buscarTodos();
		}
		
		request.setAttribute("lista", lista);
		RequestDispatcher despachador= request.getRequestDispatcher("listasociosjdbc.jsp");
		despachador.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
	}

}
