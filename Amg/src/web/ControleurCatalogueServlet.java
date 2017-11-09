package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.CatalogueMetierImpl;
import metier.ICatalogueMetier;
import metier.entities.Machine;

public class ControleurCatalogueServlet extends HttpServlet{
	
private ICatalogueMetier metier;
	
	@Override
	public void init() throws ServletException {

metier = new CatalogueMetierImpl();
	}
	

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
	throws ServletException, IOException {
		
		doPost(request, response);
			}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {
	String action=request.getParameter("action");
	
	if(action!=null) {
	if(action.equals("save")) {
		try {
		String ip=request.getParameter("ipadr");
		String salle=request.getParameter("salle");
		String etage=request.getParameter("etage");
		
		metier.addMachine(new Machine(ip,salle,etage));
		}catch(Exception e) {
			request.setAttribute("ecxeption", "erreur de saisie");
		}
			
	}
	else if(action.equals("supp")) {
		Long id=Long.parseLong(request.getParameter("id"));
		metier.deleteMachine(id);
		}
	else if(action.equals("edit")) {
		Long id=Long.parseLong(request.getParameter("id"));
		Machine m= metier.getMachine(id);
		request.setAttribute("machine", m);
		}
	else if(action.equals("update")) {
		try {
			
			Long idM= Long.parseLong(request.getParameter("idMachine"));
			String ip=request.getParameter("ipadr");
			String salle=request.getParameter("salle");
			String etage=request.getParameter("etage");
			
			Machine m = new Machine(ip,salle,etage);
			m.setIdMachine(idM);
			metier.updateMachine(m);
			}catch(Exception e) {
				e.printStackTrace();
				request.setAttribute("ecxeption", "erreur de saisie");
			}		
		}
	
	
	}
			
	request.setAttribute("machines", metier.listMachines());
	request.getRequestDispatcher("views/machines.jsp").forward(request, response);
		
	}
	
	
	

}
