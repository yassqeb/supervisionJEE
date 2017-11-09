package metier.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="MACHINE")

public class Machine implements Serializable {
@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column(name="ID_MACHINE")

	private Long idMachine;
	
   
 @Column(name="IP_ADR")
    private String ipadr;
	
    private String salle;
	private String etage;
	
	public Long getIdMachine() {
		return idMachine;
	}
	public void setIdMachine(Long idMachine) {
		this.idMachine = idMachine;
	}
	
	public String getIpadr() {
		return ipadr;
	}
	public void setIpadr(String ipadr) {
		this.ipadr = ipadr;
	}
	
	public String getSalle() {
		return salle;
	}
	public void setSalle(String salle) {
		this.salle = salle;
	}
	
	public String getEtage() {
		return etage;
	}
	public void setEtage(String etage) {
		this.etage = etage;
	}
	
	
	public Machine() {
		super();
		
		
	}
	public Machine( String ipadr, String salle, String etage) {
		super();
		
		this.ipadr = ipadr;
		this.salle = salle;
		this.etage = etage;
	}
	
	
	

}
