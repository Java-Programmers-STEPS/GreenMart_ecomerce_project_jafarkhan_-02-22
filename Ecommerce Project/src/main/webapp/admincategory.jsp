<!DOCTYPE html>
<html lang="en">
<head>
  <title>admin</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
 
  
  
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript"> $(document).ready(function () {
	    $('#searchtable').DataTable();
  });</script>
  <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">  -->

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css">
 
 
  
   <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
  
</head>
<body style="background: linear-gradient(109.2deg, rgb(249, 174, 240) 6.5%, rgb(139, 144, 250) 97.1%);">

<%

String user=(String)session.getAttribute("currentuser");

//out.print(user);



%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a style="color:red" class="navbar-brand" href="#">Green Mart</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="adminhome.jsp">Home</a></li>
     <!--  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
    -->
      
      
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Category<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="admincategory.jsp">Manage Category</a></li>
								<li><a href="adminsubcategory.jsp">Manage Sub Category</a></li>
							</ul></li>
      

       <li><a href="adminproduct.jsp">Product</a></li>
      <li><a href="#">Inventory</a></li>
      <li><a href="#">Orders</a></li>
      <li><a href="adminbanner.jsp">Banner</a></li>
      <li><a href="#">Payments</a></li>
      <li><a href="admincustomers.jsp">Customers</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <!-- <li class="active"><a href="#">Home</a></li> -->
      <li><a href="#"><%= user %></a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Setting <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="adminmyprofile.html">Profile</a></li>
          <li><a href="logout.jsp">Log Out</a></li>
          
        </ul>
      </li> 
    </ul>
  </div>
</nav>
 <form  action="addcategorycode.jsp" class="add"  onsubmit="return alert('Successfully Added')">
          

          
            
            
       
             <div style="padding-left: 5px" class="form-group">
    <label for="exampleInputEmail1">  Add New Category :</label>
    <input style="width: 25%" type="text" class="form-control" id="createcategory" name="createcategory" aria-describedby="emailHelp" placeholder="Create Category">




		</div>
           
            <div class="field btn">
              <div class="btn-layer"></div>
              <input   type="submit" class="btn btn-success" id="createc" name="createc"  value="Create" onsubmit="">
              
            
              
              
            </div>
          </form>
            

  
<%@page import="dao.CreateCategoryDao,bean.CreateCategory,java.util.*"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
      <%  
    List<CreateCategory> list=CreateCategoryDao.getAllRecords();  
    request.setAttribute("list",list);  
    %>  
    
    <form  action="" style="padding-right: 1%;padding-left: 1%;">
    <div style="padding: 40px;box-shadow:0 8px 16px 0  rgba(0,0,0,0.2);background-color: white" class="card">
    <div class="card-body">
 
<table id="searchtable" class="table table-striped" style="width:100%">
        <thead>
           <tr>
						<th>ID</th>
						<th>CATEGORY</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
        </thead>
       <c:forEach items="${list}" var="u">
						<tr>
							<td>${u.getId()}</td>
							<td>${u.getCreatecategory()}</td>
							

							<td><a class="btn btn-primary" href="categoryeditformadmin.jsp?id=${u.getId()}">Edit</a></td>
							<td><a class="btn btn-danger" href="admincategorydelete.jsp?id=${u.getId()}" onclick="return confirm('Are you sure to delete?')">Delete</a></td>
							
						</tr>
					</c:forEach>
				</table>
				</div>
	
				</div></form>

</body>
</html>
