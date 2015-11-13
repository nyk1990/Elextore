<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- 
Simple example of jsp:useBean and manipulating properties
with jsp:setProperty and jsp:getProperty and
with explicit Java code in scriptlets and expressions. 

Taken from Core Servlets and JavaServer Pages 2nd Edition
from Prentice Hall and Sun Microsystems Press,
http://www.coreservlets.com/.
(C) 2003 Marty Hall; may be freely used or adapted.
-->

<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="mybean.*" %>
<%@page import="java.text.*" %>
<%
   
    ShoppingCart cart;
	String filePath=request.getRealPath("Data/ProductCatalog.txt");
    synchronized(session) {
    cart = (ShoppingCart)session.getAttribute("shoppingCart");
      // New visitors get a fresh shopping cart.
      // Previous visitors keep using their existing cart.
      if (cart == null) {
        cart = new ShoppingCart();
        session.setAttribute("shoppingCart", cart);
      }
      String itemID = request.getParameter("itemID");
      if (itemID != null) {
        String numItemsString =request.getParameter("numItems");
        if (numItemsString == null) {
          // If request specified an ID but no number,
          // then customers came here via an "Add Item to Cart"
          // button on a catalog page.
		  
          cart.addItem(itemID,filePath);
        } else {
          // If request specified an ID and number, then
          // customers came here via an "Update Order" button
          // after changing the number of items in order.
          // Note that specifying a number of 0 results
          // in item being deleted from cart.
          int numItems;
          try {
            numItems = Integer.parseInt(numItemsString);
			
          } catch(NumberFormatException nfe) {
            numItems = 1;
          }
          cart.setNumOrdered(itemID, numItems,filePath);
        }
      }
    }
    // Whether or not the customer changed the order, show
    
    String title = "Status of Your Order";
	synchronized(session) {
			List itemsOrdered = cart.getItemsOrdered();
			
			if (itemsOrdered.size() == 0) {
			session.setAttribute("cartItems",0);
			%>
			<%@include file="Header.jsp"%>
			<HEAD><TITLE><%= title %></TITLE></HEAD>co
                <BODY BGCOLOR="#FDF5E6">

					<div class="row">
   <div class="col-xs-4 description">
   <div class="row"><div class="col-xs-6 media">
   <img src="images/laptop/mac.jpg"  alt="" aria-hidden="true">
   </div><div class="col-xs-6 details"><div class="row">
   <div class="col-xs-12"><a href="http://www.bestbuy.com/site/Apple+-+MacBook+Air%25C2%25AE+%2528Latest+Model%2529+-+13.3%2522+Display+-+Intel+Core+i5+-+4GB+Memory+-+128GB+Flash+Storage+-+Silver/1581921.p?skuId=1581921&amp;productCategoryId=pcmcat247400050001&amp;id=1219056464137"><span class="emphasized-copy short-description">Apple - MacBook Air® (Latest Model) - 13.3" Display - Intel Core i5 - 4GB Memory - 128GB Flash Storage - Silver</span></a></div></div>
   <div class="row">
   <div class="col-xs-12"><span class="emphasized-copy">Model: </span>&nbsp;MJVE2LL/A</div></div></div></div></div>
  <div class="col-xs-12">
  <form class="form-horizontal" role="form">
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Name:</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="email" placeholder="Enter email">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Address:</label>
    <div class="col-sm-10"> 
      <input type="password" class="form-control" id="pwd" placeholder="Enter password">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Credit Card:</label>
    <div class="col-sm-10"> 
      <input type="password" class="form-control" id="pwd" placeholder="Enter password">
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
     <button type="button" class="btn btn-primary">Check Out</button>
    </div>
  </div>
</form>
	</div>		
      <%} else {
			session.setAttribute("cartItems",itemsOrdered.size());
        %>
   
    
	<%@include file="Header.jsp"%>
		<HEAD><TITLE><%= title %></TITLE></HEAD>
                <BODY BGCOLOR="#FDF5E6">
              	<div class="orders">
					<h2>Order Items in your cart</h2> 
				
		
        <%
		ItemOrder order;
        NumberFormat formatter =NumberFormat.getCurrencyInstance();
        for(int i=0; i<itemsOrdered.size(); i++) {
          order = (ItemOrder)itemsOrdered.get(i);%>
		  <div class="order"> 
		  
		  
			<img src=" <%=order.getImagePath()%> " alt="Smiley face" height="150" width="50"> 
			<div class="orderdetail">
			<h1 style="color:green"> <%=formatter.format(order.getTotalCost())%> </h1>
			<p> <b>Order Id: <%=order.getItemID()%> </b></p>
			<p> <b>Order Description : </b><%=order.getShortDescription()%></p>
			<FORM>
					<INPUT TYPE="HIDDEN" NAME="itemID" VALUE=<%=order.getItemID()%>>
					<INPUT  class="updatecount" TYPE="TEXT" NAME="numItems" VALUE=<%=order.getNumItems()%>>
             <SMALL>
             <INPUT TYPE="SUBMIT" VALUE="Update Order">
             </SMALL>
			 </FORM> </div>
			 </div>
			 
			 <%}
         %>
      <% }}
	  
	   String checkoutURL =
          response.encodeURL("/sports4hawks/PlaceOrder.jsp");
		  String backURL =
          response.encodeURL("/sports4hawks/index.jsp");
       
        // "Proceed to Checkout" button below table
		
	  %>
	
		   
		 <%@include file="footer.jsp"%>
      </BODY></HTML>
    
