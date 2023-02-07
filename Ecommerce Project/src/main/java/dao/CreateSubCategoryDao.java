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

import bean.CreateSubCategory;


public class CreateSubCategoryDao {

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
	
	public static int update(CreateSubCategory u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"update createsubcategory_table set category=?, subcategory=? where id=?");  
	        ps.setString(1,u.getCategory());  
	        ps.setString(2,u.getCreatesubcategory());  
	        ps.setInt(3,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	
	public static int delete(CreateSubCategory u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from createsubcategory_table where id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  

	public static int register(CreateSubCategory createsubcategory) {
		int i = 0;

		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();

		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		i = (Integer) session.save(createsubcategory);
		t.commit();
		session.close();
		return i;

	}
	
	public static CreateSubCategory getRecordById(int id){  
	    CreateSubCategory u=null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from createsubcategory_table where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new CreateSubCategory();  
	            u.setId(rs.getInt("id"));  
	            u.setCategory(rs.getString("category"));  
	            u.setCreatesubcategory(rs.getString("createsubcategory"));  
	            
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  

	public static List<CreateSubCategory> getAllRecords() {
		List<CreateSubCategory> list = new ArrayList<CreateSubCategory>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from createsubcategory_table");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CreateSubCategory u = new CreateSubCategory();
				u.setId(rs.getInt("id"));
				u.setCategory(rs.getString("category"));

				u.setCreatesubcategory(rs.getString("createsubcategory"));
	
				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

}
