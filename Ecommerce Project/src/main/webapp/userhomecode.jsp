<%@page import="dao.UserSignupDao"%>
<%@page import="dao.UserSignupDao"%>  
    <jsp:useBean id="user" class="bean.UserSignup">  
    </jsp:useBean>  
    <jsp:setProperty property="*" name="user"/>

      
    <%  
    int i=UserSignupDao.register(user); 
    if(i>0)  
    out.print("You are successfully registered");  
      
    %>  