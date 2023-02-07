    <%@page import="dao.UserSignupDao"%>  
    <jsp:useBean id="u" class="bean.UserSignup"></jsp:useBean>  
    <jsp:setProperty property="*" name="u"/>  
    <%  
    UserSignupDao.delete(u)  ;
    response.sendRedirect("admincustomers.jsp");  
    %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


</body>
</html>