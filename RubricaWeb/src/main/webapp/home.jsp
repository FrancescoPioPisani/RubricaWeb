<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="it.rdev.rubrica.dto.User" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	tr, td {
		margin:3px;
	}
	.button {
	  font: bold 11px Arial;
	  text-decoration: none;
	  background-color: #EEEEEE;
	  color: #333333;
	  padding: 2px 6px 2px 6px;
	  border-top: 1px solid #CCCCCC;
	  border-right: 1px solid #333333;
	  border-bottom: 1px solid #333333;
	  border-left: 1px solid #CCCCCC;
	}
	
</style>
<meta charset="ISO-8859-1">
<title>HOME</title>
</head>
<body>
<%-- 	<jsp:useBean id="user" scope="request" class="it.rdev.rubrica.dto.User"> --%>
<%-- 		<jsp:setProperty name="user" property="*"/> --%>
<%-- 	</jsp:useBean> --%>
	
<%-- 	<%=user.getUsername()  + " " + user.getPassword() %> --%>
	<%  
		List<User> users = (List<User>) request.getAttribute("users");
 	%>
	<table>
	<thead>
		<tr><td>Username</td><td>Password</td></tr>
	</thead>
	<tbody>
	<%
	HttpSession sess = request.getSession();
	if(sess.getAttribute("admin").equals("admin")){
		System.out.println("<div>Sei un amministratore.</div>");
		for (int i=0; i<users.size();i++){
	%>
			<tr>
				<td><%= users.get(i).getUsername() %></td>
				<td><%= users.get(i).getPassword() %></td>
				<td><a href="/RubricaWeb/CrudOperation?action=details" class="button">Details</a></td> 
				<td><a href="/RubricaWeb/CrudOperation?action=update" class="button">Update</a></td> 
				<td><a href="/RubricaWeb/CrudOperation?action=delete" class="button">Delete</a></td> 
			</tr>
	<%
		}
	}else{
		System.out.println("Sei un utente.");
		for (int i=0; i<users.size();i++){	
	%>
	
	<tr>
		<td><%= users.get(i).getUsername() %></td>
		<td><%= users.get(i).getPassword() %></td>
		<td><a href="/RubricaWeb/CrudOperation?action=details" class="button">Details</a></td> 
		<td><a href="/RubricaWeb/CrudOperation?action=update" class="button">Update</a></td> 
		<td><a href="/RubricaWeb/CrudOperation?action=delete" class="button">Delete</a></td> 
	</tr>
	
	<% 
		} 
	}
	%>
	
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

<a href="secure/SecureResourceServlet">Risorsa Protetta</a>
</body>
</html>