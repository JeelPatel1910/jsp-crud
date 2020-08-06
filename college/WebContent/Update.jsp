<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update jsp page</title>                                             <%-- including bootstrap into the form --%>

<link href=”bootstrap/css/bootstrap.min.css” rel=”stylesheet”
	type=”text/css” />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<script type=”text/javascript” src=”bootstrap/js/bootstrap.min.js”></script>

</head>
<body>
<h1>Student Update</h1>
 

                                                                            <%--connecting to the database --%>
<div class="row">
<div class="col-sm-4">
			<form method="POST" action="#">
              
               <%
             //connecting to the database
				Connection con;
				PreparedStatement ps;
				ResultSet rs;

				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "jeel1910");
			
				String id= request.getParameter("id");
				                                                                 
				                                                                   //retrieving the data from the database
				ps=con.prepareStatement("select * from record where id=? ");
				ps.setString(1, id);
				rs = ps.executeQuery();
				                                                                            
				while(rs.next())
				{				
                %>
                                                                                <%--creating the form with data retrieved from the database--%>
               
				
				<div align="left">
					<label class="form-lable">Student Name</label> 
					<input type="text"class="form-control"placeholder="Student name" value="<%=rs.getString("stname") %>" name="sname" id="sname" required>
				</div>

				<div align="left">
					<label class="form-lable">course</label> 
					<input type="text"class="form-control"placeholder="course"value="<%=rs.getString("course") %>" name="course" id="course" required>
				</div>

				<div align="left">
					<label class="form-lable">Fee</label> 
					<input type="number"class="form-control"placeholder="Fee" value="<%=rs.getString("fee") %>"name="fee" id="fee" required>
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
				
				<% } %>
				</br>

				<div align="left">
					<input type="submit" id="Update" value="Update" name="Update"class="btn btn-info"> 
					
				</div>
				<div align ="lefts">
				<P><a href="index.jsp">Go to home page</a></p>
				<P><a href="recordbook.jsp">Go to Records</a></p>
				
				</div>
			</form>                                                             <%-- updating the data --%>
			
			<%@page import="java.sql.*"%>

<% 
                                                                                           //  redirected after submiting data

				if (request.getParameter("Update") != null) {
				
				//getting values from the form
				String id_1 =   request.getParameter("id");
				String name = request.getParameter("sname");
				String course = request.getParameter("course");
				String fee = request.getParameter("fee");
				int fees =Integer.parseInt(fee);
				 String gender =request.getParameter("gender");
				 String country =request.getParameter("country");
				String interests =" ";
				String a[] =request.getParameterValues("interests");		
				for(int i=0;i<a.length;i++)
				{
					interests+=a[i]+", ";
					
				}
                
				                                                                                  //connecting to the database
				Connection conn;
				PreparedStatement pst;
				ResultSet rst;

				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "jeel1910");
				
				                                                                                   //updating data into the database
				pst = conn.prepareStatement("update record set stname =? ,course=?, fee=? ,gender=? ,country=? ,interests=? where id =?");
				pst.setString(1, name);
				pst.setString(2, course);
				pst.setInt(3, fees);
				pst.setString(4, gender);
				pst.setString(5,country );
			    pst.setString(6, interests);
				pst.setString(7, id_1);
				
				//performing the sql query
				pst.executeUpdate();
				%>
			<script>
			
			alert("record updated......");
			</script>
			
			<% } %>


			
         </div>
</div>

    

</body>
</html>