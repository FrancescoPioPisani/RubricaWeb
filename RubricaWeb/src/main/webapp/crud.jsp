<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="it.rdev.rubrica.dto.User" %>
<%@ page import="it.rdev.rubrica.model.entities.Contact" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	
	body{
		margin:0;
	}
	
	.crud_block_container{
		width:100%;
		height:100%;
		position: absolute;
		background-color: #000;
		
	}
	.crud_block{
		width:40%;
		padding:20px;
		height:auto;
		position:relative;
		top:15%;
		background-color:#fff;
		left:30%;
		border-left: 6px solid #CCCCCC;
		border-top: 6px solid #CCCCCC;
		border-right: 6px solid #33333f;
		border-bottom: 6px solid #33333f;
	}

	.title{
		margin-top:30px;
		font-size:24px;
		font-weight:700;
		font-family:Verdana;
		font-color: #333;
	}


	p{
		margin: 10px;
		text-align:center;
	}
	
	input {
		font-size: 18px;
	    border-radius: 5px;
	    height: 30px;
	    width: 70%;
	}
	
	.buttons {
		text-align:center;
	}
	
	button {
	    background-color:#333;
	    border-color:#333;
		color:#fff;
		width:30%;
		margin:10px;
		padding:5px;
		font: bold 15px Arial;
		border-left: 3px solid #CCCCCC;
		border-top: 3px solid #CCCCCC;
		border-right: 3px solid #000;
		border-bottom: 3px solid #000;
	}
	
	.but {
		background-color:#333;
	    border-color:#333;
		color:#fff;
		width:30%;
		margin:10px;
		padding:5px;
		font: bold 15px Arial;
		border-left: 3px solid #CCCCCC;
		border-top: 3px solid #CCCCCC;
		border-right: 3px solid #000;
		border-bottom: 3px solid #000;
		text-decoration:none;
	}

</style>
<meta charset="ISO-8859-1">
<title>Crud Operation</title>
</head>
<body>

	<% 
	HttpSession sess = request.getSession();
	if (request.getAttribute("action").equals("details")){
		Contact c =(Contact) sess.getAttribute("user");
	%>
	
	<div class="crud_block_container">
		<div>
			<p class="title" style="color:#fff;">RubricaWeb - <%=request.getAttribute("action") %></p>
		</div>
		<div class="crud_block">
			<div id="crud_case">
					<p>Username: <%=c.getName() %></p>
					<p>Surname: <%=c.getSurname() %></p>
					<p>Emails: <%=c.getEmails() %></p>
					<p>Phones: <%=c.getPhones() %></p>
			</div>
		</div>
	</div>
	
	<% } %>

	<% 
	if (request.getAttribute("action").equals("update")){
		Contact c =(Contact) sess.getAttribute("user");
	%>
	<div class="crud_block_container">
		<div>
			<p class="title" style="color:#fff;">RubricaWeb - <%=request.getAttribute("action") %></p>
		</div>
		<div class="crud_block">
			<div id="crud_case">
				<form method="post" action="secure/CrudServlet?action=insert">
					<p>
						<input type="text" name="new_username" value="<%=c.getName() %>">
					</p>
					<p>
						<input type="text" name="new_password" value="<%=c.getSurname() %>">
					</p>
					<p>
						<input type="text" name="new_email" value="<%=c.getEmails() %>">
					</p>
					<p>
						<input type="text" name="new_phone" value="<%=c.getPhones() %>">
					</p>
					<div class="buttons">
						<button type="submit">Update Contact</button>
						<button  type="reset">Reset Information</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<% 
	} 
	if (request.getAttribute("action").equals("INSERT")){
		Contact c =(Contact) sess.getAttribute("user");
	%>
	<div class="crud_block_container">
		<div>
			<p class="title" style="color:#fff;">RubricaWeb - <%=request.getAttribute("action") %></p>
		</div>
		<div class="crud_block">
			<div id="crud_case">
				<div style="margin-bottom:25px;">
					<p class="title">Insert New Information</p>
				</div>
				<form  method="post" action="secure/CrudServlet?action=new_insert">
					<p>
						<input type="text" name="new_username" placeholder="New Username">
					</p>
					<p>
						<input type="text" name="new_surname" placeholder="New Surname">
					</p>

					<p>
						<input type="text" name="new_email" placeholder="New Email">
					</p>
					
					<p>
						<input type="text" name="new_phone" placeholder="New Phone">
					</p>
					<div class="buttons">
						<button type="submit">Update Contact</button>
						<button  type="reset">Reset Information</button>
						<a href="http://localhost:8080/RubricaWeb/LoginServlet?username=<%=c.getName()%>&password<%=c.getSurname()%>" class="but">Back</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<% 
	} 
	
	if (request.getAttribute("action").equals("new_insert")){
		Contact c =(Contact) sess.getAttribute("user");
	%>
	<div class="crud_block_container">
		<div>
			<p class="title" style="color:#fff;">RubricaWeb - Insert </p>
		</div>
		<div class="crud_block">
			<div id="crud_case">
				<div style="margin-bottom:25px;">
					<p class="title">Insert Complete.</p>
				</div>
			<a href="http://localhost:8080/RubricaWeb/LoginServlet?username=<%=c.getName()%>&password<%=c.getSurname()%>" class="but">Return</a>
			</div>
		</div>
	</div>
	
	<% } %>
	

</body>
</html>