<%@include file="Header.jsp" %>


		<html>
<TITLE>elexTore</TITLE>
<head>

<link rel="stylesheet" type="text/css" href="css/style.css">


	
</head>

		
			<TABLE BORDER="0" WIDTH="100%">
			<tr>

				

				
				<td>
				
				<div id="container">
				<div id="wrapper">

        <form action="submitTicket.jsp" method="post" name="contactus" >
            <fieldset align="center">
                <legend>Customer Support</legend>

				
				<div>
					<div class="small">First Name: </div>
                    <input type="text" name="firstname" placeholder="First Name"/>
                </div>
				
				<div>
					<div class="small">Last Name: </div>
                    <input type="text" name="lastname" placeholder="Last Name"/>
                </div>
                <div>
					<div class="small">Email ID: </div>
                    <input type="text" name="email_id" placeholder="Emaid Address"/>
                </div>
                
                <div>
					
                    <div class="small">Query: </div>
                    <textarea name="query" placeholder="Write your Query"></textarea>
                </div>    
                <input type="submit" value="Send"/>
            </fieldset>    
        </form>
		</div>
    </div>
	<h3 align="left"> Submit your ticket here </h3>
				</td>
			</tr>
			</table>
	</div>
</body>
</html>
