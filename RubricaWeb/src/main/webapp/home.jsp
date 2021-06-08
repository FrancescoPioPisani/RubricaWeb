<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="it.rdev.rubrica.dto.User" %>
<%@ page import="it.rdev.rubrica.model.entities.Contact" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	
	body{
		margin:0;
		background-color:#000;
	}
	
	thead{
		font-size:20px;
		font-weight:600;
	}
	
	.title{
	    margin-top: 60px;
    	margin-bottom: 0;
		font-size:24px;
		font-weight:700;
		
		text-align:center;
		font-family:Verdana;
		font-color: #333;
	}
	
	td {
		padding: 10px;
	}
	
	.value{
		font-size:15px;
		font-weight:600;
		font-family: sans-serif;
	}
	
	.buttons_container {
		margin-top: 20px;
		text-align:center;
	}
	
	.button {
	 	background-color:#333;
	    border-color:#333;
		color:#fff;
		width:30%;
		margin:10px;
		padding:5px;
		font:500 15px Arial;
		border-left: 3px solid #CCCCCC;
		border-top: 3px solid #CCCCCC;
		border-right: 3px solid #000;
		border-bottom: 3px solid #000;
		text-decoration:none;
		letter-spacing:.7px;
	}
	
	.table_container{
		width:100%;
		height:100%;
		position:absolute;
		padding-bottom: 200px;
	}
	
	.table{
		width:40%;
		padding: 50px;
		padding-top: 30px;
		height:auto;
		position:relative;
		top:15%;
		background-color:#fff;
		left:25%;
		border-left: 6px solid #CCCCCC;
		border-top: 6px solid #CCCCCC;
		border-right: 6px solid #33333f;
		border-bottom: 6px solid #33333f;
	}
	
	#crud_txt{
	    text-align: center;
	    position: relative;
	    left: 110px;
	}
	
</style>
<meta charset="ISO-8859-1">
<title>HOME</title>
</head>
<body>
	
<%-- 	<%=user.getUsername()  + " " + user.getPassword() %> --%>
	<%  
		List<Contact> users = (List<Contact>) request.getAttribute("users");
		HttpSession sess = request.getSession();
 	%>
 	<div class="table_container">
 		<div>
			<p class="title" style="color:#fff;">RubricaWeb - Home Page</p>
		</div>
	 	<div class="table">
			<table>
			<thead>
				<tr><td>USERNAME</td><td>SURNAME</td><td id="crud_txt">CRUD OP.</td></tr>
			</thead>
			<tbody>
	<%
	if(sess.getAttribute("user").equals("admin")){
		System.out.println("Sei loggato come amministratore.");
	}else{
		System.out.println("Sei loggato come utente normale.");
	}
	for (int i=0; i<users.size();i++){
	%>
				<tr>
					<td class="value"><%= users.get(i).getName() %></td>
					<td class="value"><%= users.get(i).getSurname() %></td>
					<td class="value"><a href="CrudServlet?action=DETAILS&id="<%=users.get(i).getId() %> class="button">Details</a></td> 
					<td class="value"><a href="CrudServlet?action=UPDATE&id="<%=users.get(i).getId() %> class="button">Update</a></td> 
					<td class="value"><a href="CrudServlet?action=add?action=DELETE&id="<%=users.get(i).getId() %> class="button">Delete</a></td> 
				</tr>
	<%	}  %>
	
<%-- 	<c:forEach items="${users}" var="u"> --%>
<!-- 		<tr> -->
			
<%-- 			<td><c:out value="${u.username }"></c:out></td> --%>
<%-- 			<td><c:out value="${u.password }"></c:out></td> --%>
<!-- 			<td><a href="/RubricaWeb/CrudOperation?action=details" class="button">Details</a></td> -->
<!-- 			<td><a href="/RubricaWeb/CrudOperation?action=update" class="button">Update</a></td> -->
<!-- 			<td><a href="/RubricaWeb/CrudOperation?action=delete" class="button">Delete</a></td> -->
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>


					</tbody>
				</table>
			<div class="buttons_container">
				<a href="SecureResourceServlet" class="button">Risorsa Protetta</a>
				<a href="CrudServlet?action=INSERT" class="button"> Inserisci Nuovo Contatto </a>
			</div>
		</div>
	</div>
	
</body>
</html>