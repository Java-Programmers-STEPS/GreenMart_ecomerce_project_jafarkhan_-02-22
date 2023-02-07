<%@page import="dao.CreateCategoryDao"%>
 
    <jsp:useBean id="s" class="bean.CreateCategory">  
    </jsp:useBean>  
    <jsp:setProperty property="*" name="s"/>

      
    <%  
    int i=CreateCategoryDao.register(s); 
    if(i>0)  
      
    %>  
    
    <jsp:include page="admincategory.jsp"></jsp:include>