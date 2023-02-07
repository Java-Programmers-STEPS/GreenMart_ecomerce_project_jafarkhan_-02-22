<%@page import="dao.CreateSubCategoryDao"%>  
    <jsp:useBean id="s" class="bean.CreateSubCategory">  
    </jsp:useBean>  
    <jsp:setProperty property="*" name="s"/>

      
    <%  
    int i=CreateSubCategoryDao.register(s); 
    if(i>0)  
    out.print("You are successfully registered");  
      
    %>  