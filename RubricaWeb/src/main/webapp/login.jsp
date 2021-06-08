<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>

	body{
		background-color:#000;
	}
	form{
	    margin-top: 40px;
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
	
	.title{
		margin-top:30px;
		font-size:24px;
		font-weight:700;
		font-family:Verdana;
		font-color: #333;
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
	#login_case{
		width:40%;
		height:45%;
		position:relative;
		top:15%;
		background-color:#fff;
		left:30%;
		border-left: 6px solid #CCCCCC;
		border-top: 6px solid #CCCCCC;
		border-right: 6px solid #33333f;
		border-bottom: 6px solid #33333f;
		
	}
	#login_case_container{
		width:100%;
		height:100%;
		position: absolute;
	}
</style>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<div id="login_case_container">
		<div>
			<p class="title" style="color:#fff;">RubricaWeb - Francesco Pio Pisani</p>
		</div>
		<div id="login_case">
			<div>
				<p class="title">Insert Username & Password</p>
			</div>
			<form method="post" action="/RubricaWeb/LoginServlet">
				<p>
					<input type="text" name="username" placeholder="Username">
				</p>
				<p>
					<input type="password" name="password" placeholder="Password">
				</p>
				<div class="buttons">
					<button type="submit">Login</button>
					<button type="reset">Reset</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>