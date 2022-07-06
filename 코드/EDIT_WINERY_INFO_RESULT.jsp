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
 String winery_id=request.getParameter("winery_id").trim();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수정된 WINERY: <%=winery_id%>의 정보 확인</title>
</head>
<body>

<%	
		String dbName="project";
		String jdbcDriver="jdbc:mariadb://localhost:3306/project";
		String dbUser="root";
		String dbPass="asdf";

		
		Connection conn=null;
		Statement stmt=null;

		
		
		
			String owner=request.getParameter("owner").trim();
			String address=request.getParameter("address").trim();
			int tel_number=Integer.parseInt(request.getParameter("tel_number").trim());
			String grade_id=request.getParameter("grade_id").trim();
			String vineyard_id=request.getParameter("vineyard_id").trim();

				try {
				
				String driver="org.mariadb.jdbc.Driver";
				Class.forName(driver);
				conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
				stmt=conn.createStatement();
				
				
				
				String query1="update winery set owner='" + owner + "',address='" + address + "',tel_number='" + tel_number + "',grade_id='" + grade_id + "' ,vineyard_id='" + vineyard_id + "'   WHERE winery_id = '" + winery_id + "'; ";
				stmt.executeUpdate(query1);
				
				String query2="select * from winery where winery_id='" + winery_id + "'";	
				ResultSet result1=null;//winery 상세정보
				result1=stmt.executeQuery(query2);

			%>
		<table border="1">
		
		<tr>
		<td colspan = "3">수정된 WINERY: <%=winery_id%>의 정보 확인</td>
		</tr>
		<tr>
			<td>WINERY ID</td>
			<td>소유자 </td>
			<td>주소 </td>
			<td>연락처</td>
			<td>화이트 포도 재고량</td>
			<td>레드 포도 재고량</td>
			<td>자금(리라)</td>
			<td>등급</td>
			<td>거래 VINEYARD ID</td>
		</tr>
		<% 
		while(result1.next())
         {
			%>
		<tr>
            <td><%= result1.getString("winery_id") %></td>
            <td><%= result1.getString("owner") %></td>
            <td><%= result1.getString("address") %></td>
            <td><%= result1.getString("tel_number") %></td>
            <td><%= result1.getString("inv_white") %></td>
            <td><%= result1.getString("inv_red") %></td>
            <td><%= result1.getString("money") %></td>
            <td><%= result1.getString("grade_id") %></td>
            <td><%= result1.getString("vineyard_id") %></td>
    
           

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