package metier;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import metier.entities.Machine;
import util.HibernateUtil;

public class CatalogueMetierImpl  implements ICatalogueMetier{

	@Override
	public void addMachine(Machine m) {
		// TODO Auto-generated method stub
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.save(m);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();
		
		
		
	}

	@Override
	public List<Machine> listMachines() {
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		Query req=session.createQuery("select m from Machine m");
		List<Machine> macs=req.list();
		session.getTransaction().commit();
		
		return macs;
		
		
		
	}

	@Override
	public Machine getMachine(long idMac) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object m=session.get(Machine.class, idMac);
		if(m==null) throw new RuntimeException("Produit introuvable");
		
		session.getTransaction().commit();
		return (Machine)m;
		
		
	}

	@Override
	public List<Machine> getMachinesParMc(String mc) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		Query req=session.createQuery("select m from Machine m where m.ipadr like :x");
		req.setParameter("x","%"+mc+"%");
		List<Machine> macs=req.list();
		session.getTransaction().commit();
		return macs;
		
		
		
	}

	@Override
	public void deleteMachine(long idMac) {
		// TODO Auto-generated method stub
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Object m=session.get(Machine.class, idMac);
		if(m==null) throw new RuntimeException("Machine introuvable");
		session.delete(m);
		session.getTransaction().commit();
		
	}

	@Override
	public void updateMachine(Machine m) {
		// TODO Auto-generated method stub
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(m);
		session.getTransaction().commit();
		
		
	}

	
	
	
	//pas encore end to look out 
	@Override
	public void login() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void logout() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getUserByMailPassword(String mail, String password) {
		// TODO Auto-generated method stub
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query req=session.createQuery("from user wheremail=? and password=?");
		
		req.setParameter(0, mail);
		req.setParameter(1, password);
		req.getSingleResult();	
		
		session.getTransaction().commit();
		
	}

}
