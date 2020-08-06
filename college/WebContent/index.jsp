<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP page</title>

                                                                           <%-- including bootstrap into the form --%>


<link href=”bootstrap/css/bootstrap.min.css” rel=”stylesheet”
	type=”text/css” />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<script type=”text/javascript” src=”bootstrap/js/bootstrap.min.js”></script>
</head>
<body>
	<h1>Student registration system using crud-jsp</h1>
	</br>

	<div class="row">
		<div class="col-sm-4">
			<form method="POST" action="recordbook.jsp">

                                                                             <%--creating the form --%>
               
				<div align="left">
					<label class="form-lable">Student Name</label> 
					<input type="text"class="form-control"placeholder="Student name" name="sname" id="sname" required>
				</div>

				<div align="left">
					<label class="form-lable">course</label> 
					<input type="text"class="form-control"placeholder="course" name="course" id="course" required>
				</div>

				<div align="left">
					<label class="form-lable">Fee</label> 
					<input type="number"class="form-control"placeholder="Fee" name="fee" id="fee" required>
				</div>
				
				<div align="left">
				    <lable class="form-lable">Gender:</lable></br>
					<input type="radio"  value="male" name="gender" class="form-check-lable">male
					<input type="radio"  value="female" name="gender" class="form-check-lable"> female
				</div>
				</br>
				  <label for="country">Country:</label>
                <select name="country" id="country">
                <option value="INDIA">INDIA</option>
                <option value="USA">USA</option>
                <option value="CANADA">CANADA</option>
                
                </select>
                </br>
                </br> 
				
				
				<div align="left" class="custom-control custom-checkbox">
				    <lable class="form-lable">Interests:</lable></br>
					<input type="checkbox"  value="Machine learning " name="interests" class="form-check-input">Machine learning</br>
					<input type="checkbox"  value="Web developement" name="interests" class="form-check-input">Web development 
				</div>
				</br>
				
				  

			    <div align="left">
					<input type="submit" id="submit" value="submit" name="submit" class="btn btn-info"> 
				</div>
				</form>
			</div>
			</div>
</body>
</html>