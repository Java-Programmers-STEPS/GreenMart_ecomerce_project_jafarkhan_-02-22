    <%@page import="dao.UserSignupDao"%>  
    <jsp:useBean id="u" class="bean.UserSignup"></jsp:useBean>  
    <jsp:setProperty property="*" name="u"/>  
    <%  
    int i=UserSignupDao.update(u);  
    response.sendRedirect("admincustomers.jsp");  
    %>  