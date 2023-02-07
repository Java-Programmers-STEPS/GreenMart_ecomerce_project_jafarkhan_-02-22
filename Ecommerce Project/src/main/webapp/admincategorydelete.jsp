    <%@page import="dao.CreateCategoryDao"%>  
    <jsp:useBean id="u" class="bean.CreateCategory"></jsp:useBean>  
    <jsp:setProperty property="*" name="u"/>  
    <%  
    CreateCategoryDao.delete(u)  ;
    response.sendRedirect("admincategory.jsp");  
    %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>deleted</title>
</head>
<body>


</body>
