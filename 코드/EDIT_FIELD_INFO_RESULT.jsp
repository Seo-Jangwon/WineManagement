<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Vector" %>
<%@page import="java.lang.Exception" %>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%	
 String field_id=request.getParameter("field_id").trim();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수정된 FIELD: <%=field_id%>의 정보 확인</title>
</head>
<body>

<%	
		String dbName="project";
		String jdbcDriver="jdbc:mariadb://localhost:3306/project";
		String dbUser="root";
		String dbPass="asdf";

		
		Connection conn=null;
		Statement stmt=null;

		
		
		
			String address=request.getParameter("address").trim();
			String variety=request.getParameter("variety").trim();
			int area=Integer.parseInt(request.getParameter("area").trim());


				try {
				
				String driver="org.mariadb.jdbc.Driver";
				Class.forName(driver);
				conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
				stmt=conn.createStatement();
				
				
				
				String query1="update field set variety='" + variety + "',address='" + address + "',area='" + area + "'  WHERE field_id = '" + field_id + "'; ";
				stmt.executeUpdate(query1);
				
				String query2="select * from field where field_id='" + field_id + "'";	
				ResultSet result1=null;//vineyard 상세정보
				result1=stmt.executeQuery(query2);

			%>
		<table border="1">
		
		<tr>
		<td colspan = "3">수정된 FIELD: <%=field_id%>의 정보 확인</td>
		</tr>
		<tr>
			<td>VINEYARD ID</td>
			<td>FIELD ID</td>
			<td>면적 </td>
			<td>주소 </td>
			<td>재배 품종 </td>
		</tr>
		<% 
		while(result1.next())
         {
			%>
		<tr>
            <td><%= result1.getString("vineyard_id") %></td>
            <td><%= result1.getString("field_id") %></td>
            <td><%= result1.getString("area") %></td>
            <td><%= result1.getString("address") %></td>
            <td><%= result1.getString("variety") %></td>
    
           

     	</tr>
			
			<%
         }
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
				try {
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
					}
				}


			%>
		</table>
		<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
</body>
</html>