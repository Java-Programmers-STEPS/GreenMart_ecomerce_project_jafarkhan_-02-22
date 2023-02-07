package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import bean.UserSignup;

public class UserSignupDao {

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerytest", "root", "");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static int update(UserSignup u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"update usersignup_table set semail=?, spassword=? where id=?");  
	        ps.setString(1,u.getSemail());  
	        ps.setString(2,u.getSpassword());  
	        ps.setInt(3,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	
	public static int delete(UserSignup u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from usersignup_table where id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  

	public static int register(UserSignup user) {
		int i = 0;

		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();

		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		i = (Integer) session.save(user);
		t.commit();
		session.close();
		return i;

	}
	
	public static UserSignup getRecordById(int id){  
	    UserSignup u=null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from usersignup_table where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new UserSignup();  
	            u.setId(rs.getInt("id"));  
	            u.setSemail(rs.getString("semail"));  
	            u.setSpassword(rs.getString("spassword"));  
	            
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  

	public static List<UserSignup> getAllRecords() {
		List<UserSignup> list = new ArrayList<UserSignup>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from usersignup_table");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserSignup u = new UserSignup();
				u.setId(rs.getInt("id"));
				u.setSemail(rs.getString("semail"));

				u.setSpassword(rs.getString("spassword"));
	
				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

}
