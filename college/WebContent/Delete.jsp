<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@page import="java.sql.*"%>
    <% 
				
				                                                                          //getting values from the form
				String id =   request.getParameter("id");
				
                
				                                                                          //connecting to the database
				Connection con;
				PreparedStatement ps;
				ResultSet rs;

				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "jeel1910");
				
				                                                                         //deleting data into the database
				ps = con.prepareStatement("delete from record where id =?");
				
				ps.setString(1, id);
				
				                                                                        //performing the sql query
				ps.executeUpdate();
			
			%>                                                                     
			                                                                           <%-- alert box in java script --%>
			<script type="text/javascript">
			
			       alert("record deleted.....");
			
			</script>
			
<h2>Record deleted successfully..<h2>

<P><a href="index.jsp">Go to home page</a></p>
<P><a href="recordbook.jsp">Go to Records</a></p>

</body>
</html>