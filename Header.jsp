<%@page import="mybean.UserBean" %>
<html>
<TITLE>elexTore</TITLE>
<head>

<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="themes/1/js-image-slider.js" type="text/javascript"></script>
 <script type="text/javascript" src="JS/javascript.js"></script>

<link href="css/generic.css" rel="stylesheet" type="text/css" />
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.5-dist/css/bootstrap-theme.css">	
 -->
</head>


<body onload='init()'; background="images/mainpage/image2.jpg">
	<%
	String cartItems="";
	try{
		cartItems = session.getAttribute("cartItems").toString();
		if (cartItems == null){
			session.setAttribute("cartItems","0");
			cartItems = "0";
		}
	}
	catch(Exception e){
		cartItems = "0";
	}
	UserBean usrBean=null;
	String userName="";
	try{
		usrBean = (UserBean)session.getAttribute("usrbean");

		if (usrBean == null){
			userName = "Guest";
		}
		else{
			userName=usrBean.getFirstName();
			
		}
	}
	catch(Exception e){
		cartItems = "0";
	}
	
	%>

	<div id="container">
	
		<div class="header">
		
			<div class="logo">

			</div>
			<div class="links">
			
				<ul>
					<li><a href="signup.jsp" class="acolor" style="color:#30A2DE" >Sign Up</a></li>
						<%if(userName.equals("Guest")){%>
					<li><a href="login.jsp" class="acolor" style="color:#30A2DE">Log In</a></li>
					<%}%>
					<li><a href="/elextore/OrderPage.jsp" class="acolor" style="color:#30A2DE">Checkout</a></li>
					<li><a href="viewOrders.jsp" class="acolor" style="color:#30A2DE">Your Orders</a></li>
					<li><b><i><a style="color:#1F4255"  href="">Welcome <%= userName%></a></i></b></li>
					<%if(!(userName.equals("Guest"))){%>
					<li><a href="/elextore/LogOutServlet" class="acolor" style="color:#30A2DE">Log Out</a></li>
					<%}%>
				</ul>
				
				<% if(cartItems.equals("0")) { %>
				
				<div class="cart" onclick="window.location ='/elextore/OrderPage.jsp';">
				
				<% } else { %>
				
				<div class="cart_full" onclick="window.location ='/elextore/OrderPage.jsp';">
				
				<% } %>
				
				</div>
				<p><%=cartItems%></p>
			
			</div>
		</div>
		&nbsp

		<div class="navigatation">
			<ul>
				<li><a href="/elextore/index.jsp">Home</a></li>
				

				<li><a href="aboutus.jsp">About Us</a></li>

				<li><a href="/elextore/contactus.jsp">Contact Us</a></li>
			</ul>
			
			
			
			
			
			<div class="search" style="right:50px">
			
			<div class="right-inner-addon " >
    <i class="icon-search"></i>
    <input type="search"
           class="form-control" 
           placeholder="Search" />
           <button>search</button>	
          
</div>
		 		
			</div>


<div class="search" style="float:right">
			</div>


		</div>
		<br><br><br><br><br><br><br>
		<div id="sliderFrame">
					<div id="slider">
					<a href="images/mainpage/image1.jpg" target="_blank">
						<img src="images/mainpage/image1.jpg" alt="Welcome to elexTore.com" />
					</a>
					<img src="images/mainpage/image2.jpg" alt="" />
					<img src="images/mainpage/image3.jpg" alt="" />
					</div>
		</div>
		<br><br>

		
			<TABLE BORDER="0" WIDTH="100%">
			<tr>
				<td ALIGN="LEFT" WIDTH="23%" style="padding-left:20px">
				
				<h2 style="height: 44px; width: 200px;">Product Categories</h2>
				<a href="Products.jsp?category=casuals" class="products" >Appliances</a>
				<br>
				<a href="Products.jsp?category=Equipments" class="products" >TV & Home Theater</a>
				<br>
				<a href="Products.jsp?category=footwear" class="products" >Computers & Tablets</a>
				<br>
				<a href="Products.jsp?category=men" class="products" >Cameras & Camcorders</a>
				<br>
				<a href="Products.jsp?category=women" class="products" >Audio</a>
				<br>
							
				</td>
				
				<td ALIGN="center" WIDTH="80%">
				<div class="itemgrid">
				<h2>Featured Products</h2>
				
				<div class="items" style="margin-left:20px">
				<ul>

				
                <li>
                <img src="images/mainpage/image4.jpg" alt="No Image found for this product" width="250" height="238">
                <h4>Whirlpool Washing Machine</h4>
                <p><b>$800 <a href="/elextore/OrderPage.jsp?itemID=4"> Add To Cart </a></b></p>
                </li>
                <li>
                <img src="images/mainpage/image5.jpg" alt="No Image found for this product" width="250" height="238">
                <h4>Samsung LED TV</h4>
                <p><b>$999 <a href="/elextore/OrderPage.jsp?itemID=5"> Add To Cart </a></b></p>
                </li>
                <li>
                <img src="images/mainpage/image6.jpg" alt="No Image found for this product" width="250" height="238">
                <h4>Apple MacBook Pro</h4>
                <p><b>$1999 <a href="/elextore/OrderPage.jsp?itemID=6"> Add To Cart </a></b></p>
                </li>
                </ul>

				</div>

				</td>


			</tr>

			</TABLE>
			
			<div class="footer">
				
				<p>elexTore powered by Sabya Mitesh Deepansha Snehal Nikhil</p>
				
				</div>
				</div>

</body>			
