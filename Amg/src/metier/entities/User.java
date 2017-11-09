package metier.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USER")

public class User  implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column(name="ID_USER")
	
	
		private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	//private String nom;
	//private String prenom;
	private String mail;
	private String password;
	
	 
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String mail, String password) {
		super();
		this.mail = mail;
		this.password = password;
	}
	

}
