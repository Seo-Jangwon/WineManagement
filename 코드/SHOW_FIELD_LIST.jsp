<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Vector" %>
<%@page import="java.lang.Exception" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FIELD ����Ʈ�� ����</title>
</head>
<body>

<form action="SHOW_FIELD_INFO.jsp" method="post">
		<table border="1">
		
		<tr>
		<td colspan = "3">VINEYARD�� FIELD ����Ʈ</td>
		</tr>
		<tr>
			<td>VINEYARD ID</td>
			<td>FIELD ID</td>
		</tr>
<%	
	
	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	
	
	String query1="select vineyard_id, field_id from field  ";	
	ResultSet result1=null;//query1�� ���
	ResultSet result2=null;//query2�� ���
		
			
			try {
			
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			
			result1=stmt.executeQuery(query1);
			while(result1.next()){
				%>
		<tr>
            <td><%= result1.getString("vineyard_id") %></td>
            <td><%= result1.getString("field_id") %></td>
				<%
			}
			String query2="select field_id from field  ";	
			result2=stmt.executeQuery(query2);
			%>
			</tr>
			<tr>
			</tr>
   			<tr>
   			</tr>
   			<tr>
   			</tr>
   			<tr>
   			</tr>
   			<tr>
   			</tr>
			<tr>
			</tr>
   			<tr>
   			</tr>
   			<tr>
   			</tr>
   			<tr>
   			</tr>
   			<tr>
   			</tr>
			<tr>
			<td colspan = "3">FIELD ����</td>
			</tr>
			<tr>
			<td><label>FIELD ID</label></td><td><select name="field_id" required="required">
			<option value="">==select==</option>
			<%
			
			while(result2.next()){
			
			%>
			<option value="<%=result2.getString("field_id") %>"><%= result2.getString("field_id") %></option>
		
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
			
			</select></td>
			
		</tr>
	</table>

		<button type="submit">������ ����</button>
		<button type="reset">�ʱ�ȭ</button>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>
	</form>
	
</body>
</html>