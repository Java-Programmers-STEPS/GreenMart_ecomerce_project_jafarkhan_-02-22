<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%
try{
String email = request.getParameter("semail");
String lpassword = request.getParameter("spassword");

session.setAttribute("currentuser", email);

Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerytest","root","");
PreparedStatement pst = conn.prepareStatement("Select semail,spassword from usersignup_table where semail=? and spassword=?");
pst.setString(1, email);
pst.setString(2, lpassword);
ResultSet rs = pst.executeQuery();                        
if(rs.next()){
	response.sendRedirect("userhome.jsp");	
}
else if(email.equals("user@gmail.com") && lpassword.equals("User123@")){
	response.sendRedirect("userhome.jsp");	
}
else if (email.equals("admin@gmail.com") && lpassword.equals("Admin123@")){
	response.sendRedirect("adminhome.jsp");
	}

else
   out.println("Invalid login credentials");            
}
catch(Exception e){       
out.println("Something went wrong !! Please try again");       
		
}


//out.print(email);
//out.print(lpassword);


%>

</body>
</html>

 <!-- <!-- try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerytest?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Select user,pass from login where user=? and pass=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }       --> -->