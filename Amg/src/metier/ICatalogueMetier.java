package metier;

import java.util.List;


import metier.entities.Machine;

public interface ICatalogueMetier {
	
	

	public void addMachine(Machine m);
	public List<Machine> listMachines();
	public Machine getMachine(long idMac);
	public List<Machine> getMachinesParMc(String mc);
	public void deleteMachine(long idMac);
	public void updateMachine(Machine m);
	
	

}
