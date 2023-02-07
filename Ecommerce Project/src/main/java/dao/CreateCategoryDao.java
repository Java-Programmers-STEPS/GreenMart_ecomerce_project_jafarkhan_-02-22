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

import bean.CreateCategory;


public class CreateCategoryDao {

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
	
	public static int update(CreateCategory u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"update createcategory_table set category=?,where id=?");  
	        ps.setString(1,u.getCreatecategory());  
	       
	        ps.setInt(2,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	
	public static int delete(CreateCategory u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from createcategory_table where id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  

	public static int register(CreateCategory category) {
		int i = 0;

		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();

		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		i = (Integer) session.save(category);
		t.commit();
		session.close();
		return i;

	}
	
	public static CreateCategory getRecordById(int id){  
	    CreateCategory u=null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from createcategory_table where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new CreateCategory();  
	            u.setId(rs.getInt("id"));  
	            u.setCreatecategory(rs.getString("createcategory"));  
	           
	            
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  

	public static List<CreateCategory> getAllRecords() {
		List<CreateCategory> list = new ArrayList<CreateCategory>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from createcategory_table");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CreateCategory u = new CreateCategory();
				u.setId(rs.getInt("id"));
				  u.setCreatecategory(rs.getString("createcategory"));  

				
	
				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

}
