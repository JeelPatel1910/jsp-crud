<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Record book</title>

         <link href=”bootstrap/css/bootstrap.min.css” rel=”stylesheet” type=”text/css” />
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet"  type="text/css" />
         <script type=”text/javascript” src=”bootstrap/js/bootstrap.min.js”></script>
</head>
<body>
<%@page import="java.sql.*"%>
      <% 
                //  redirected after submiting data

				if (request.getParameter("submit") != null) {
				
				//getting values from the form	
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
				Connection con;
				PreparedStatement ps;
				ResultSet rs;
 
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "jeel1910");
				
				//inserting data into the database
				ps = con.prepareStatement("insert into record(stname,course,fee,gender,country,interests)values(?,?,?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, course);
				ps.setInt(3, fees);
				 ps.setString(4, gender);
				ps.setString(5,country );
				ps.setString(6, interests); 
				//performing the sql query
				ps.executeUpdate();
				%>
				<script>
				
				alert("record added...");
				</script>
				
			<% }  %>
<h1>Welcome to records</h1>

<h2>
<%   
String sname=request.getParameter("sname");  
out.print(sname);
out.print("!");
%>  
</h2>


<div class="row">
<div class="col-sm-8">
			<div class="panel-body">
				<table id="tbl-student" class="table w-auto table-responsive table-bordered" cellpadding="0"
					width=600px>
					<thead>
						<tr>
							<th>Student Name</th>
							<th>Course</th>
							<th>Fee</th>
							<th>Gender</th>
							<th>Country</th>
							<th>interests</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
				
				 <%@page import="java.sql.*"%>
				<%
						Connection con;
						PreparedStatement ps;
						ResultSet rs;

						Class.forName("com.mysql.cj.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "jeel1910");
						
						String query = "select * from record";
						Statement st =con.createStatement();
								
						rs =st.executeQuery(query);
						
						   while(rs.next())
						   {
							   String id = rs.getString("id");
						   
						   %>
						

						<tr>
							<td><%=rs.getString("stname") %></td>
							<td><%=rs.getString("course") %></td>
							<td><%=rs.getString("fee") %></td>
							<td><%=rs.getString("gender") %></td>
							<td><%=rs.getString("country") %></td>
							<td><%=rs.getString("interests") %></td>
							<td><a href ="Update.jsp?id=<%=id%>">Edit</a></td>
							<td><a href ="Delete.jsp?id=<%=id%>">Delete</a></td>
						</tr>
						
						<% }
						   %>
						
						
				</table>
			</div>
		</div>

				
</div>
<P><a href="index.jsp">Go to home page</a></p>
</body>
</html>