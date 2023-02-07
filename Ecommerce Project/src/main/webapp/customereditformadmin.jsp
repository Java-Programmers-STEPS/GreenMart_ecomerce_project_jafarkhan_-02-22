    <!DOCTYPE html>  
    <html>  
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
    <title>Edit Form</title>  
    </head>  
    <body>  
    <%@page import="bean.UserSignup, dao.UserSignupDao"%>  
      
    <%  
    String id=request.getParameter("id");  
    UserSignup u=UserSignupDao.getRecordById(Integer.parseInt(id));  
    %>  
      
    <h1>Edit Form</h1>  
    <form action="customeradminedit.jsp" method="post">  
    <input type="hidden" name="id" value="<%=u.getId() %>"/>  
    <table>  
    <tr><td>Email:</td><td>  
    <input type="text" name="email" value="<%= u.getEmail()%>"/></td></tr>  
    <tr><td>Password:</td><td>  
    <input type="password" name="password" value="<%= u.getPassword()%>"/></td></tr>  
     
    <tr><td colspan="2"><input type="submit" value="Edit User"/></td></tr>  
    </table>  
    </form>  
      
    </body>  
    </html>  