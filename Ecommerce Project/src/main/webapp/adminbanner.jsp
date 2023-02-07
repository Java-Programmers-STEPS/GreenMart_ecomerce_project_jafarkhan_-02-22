
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>      

<script>
$(document).ready(function(){
    $('#myselection').on('change', function(){
    	var demovalue = $(this).val(); 
        $("div.myDiv").hide();
        $("#show"+demovalue).show();
    });
});
</script> 
<style type="text/css">


/* .myDiv{
	display:none;
    padding:10px;
    margin-top:20px;
} */  </style>



<title>Insert title here</title>
</head>
<body style="background: linear-gradient(109.2deg, rgb(249, 174, 240) 6.5%, rgb(139, 144, 250) 97.1%); " >


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a style="color:red" class="navbar-brand" href="#">Nexin</a>
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
      <li><a href="adminorders.jsp">Orders</a></li>
      <li><a href="adminbanner.jsp">Banner</a></li>
      <li><a href="#">Payments</a></li>
      <li><a href="admincustomers.jsp">Customers</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <!-- <li class="active"><a href="#">Home</a></li> -->
     
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Setting <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="adminprofile.html">Profile</a></li>
          <li><a href="logout.jsp">Log Out</a></li>
          
        </ul>
      </li>
    </ul>
  </div>
</nav>






<section>

<div  class="container"></div>
<div class ="col" id="addbanner">
<form style="padding-left: 25%; padding-right: 25%" action="">

<div id="addbanners">
<div style="padding: 40px;box-shadow:0 8px 16px 0  rgba(0,0,0,0.2);" class="card">

<div class="card-body">
<h2>Add Banner</h2><hr style="">
<label for="bannertype">Type :</label>
<select
						class="form-control " id="myselection">
						<option value="SelectDefault">select Default</option>
						<option value="One">Category</option>
						<option value="Two">product</option>
						
						<option value="Three">url</option>
						
					</select><br>
					<div id="showOne" class="myDiv">
					<label for="bannertype">Select Category</label>
<select
						class="form-control " id="bannerselectcategory">
						<option value="Selectcategory">Select Category</option>
						<option value="Fruits">Fruits</option>
						<option value="Grocery">Grocery</option>
						<option value="Personal Care">Personal Care</option>
						
					</select></div>
					<br>
					<div id="showTwo" class="myDiv">
					<label for="bannertype">Select Product</label>
<select
						class="form-control " id="bannerselectproduct">
						<option value="selectproduct">Select Product</option>
						<option value="apple">Apple</option>
						<option value="orange">Orange</option>
						<option value="grape">Grape</option>
						
					</select></div><br>

<div id="showThree" class="myDiv"><label for="bannertype">Url :</label>

<input class="form-control" type="text" id="bannerurl" name="bannertype" placeholder="Enter Url"></div><br>
<label for="bannertype">Upload Image :</label>
<input class="form-control" type="file" id="bannertype" name="bannertype" placeholder="Upload"><br>



									<button type="button" class="btn btn-success"
										id="UploadBanner" name="locateButton">Upload Banner</button>








</div>

</div>

</div>




</form>





</div>

</section>






</body>
</html>