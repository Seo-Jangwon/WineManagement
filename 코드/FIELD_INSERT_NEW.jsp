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
<title>���ο� FIELD�� ���� �Է�</title>
</head>
<body>
	<form action="FIELD_RESULT_NEW.jsp" method="post">
		<table border="1">
		<tr>
		<td colspan = "3">���ο� FIELD�� ���� �Է�</td>
		</tr>
		<tr>
			<td><label>FIELD ID </label></td><td><input name="field_id" type="text" required="required"/></td>
		</tr>
		<tr>
			<td><label>�ּ� </label></td><td><input name="address" type="text" required="required"></td>
		</tr>
		<tr>
			<td><label>���� </label></td><td><input name="area" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required="required"/></td>
		</tr>
		<tr>
			<td><label>��� ǰ��</label></td><td><select name="variety" required="required">
			<option value="">==select==</option>
			<option value="red">red</option>
			<option value="white">white</option></select></td>
		</tr>
		<tr>
			<td><label>VINEYARD ID</label></td><td><select name="vineyard_id" required="required">
			<option value="">==select==</option>
			
			
			
			<% 
			String dbName="project";
			String jdbcDriver="jdbc:mariadb://localhost:3306/project";
			String dbUser="root";
			String dbPass="asdf";
			String query="select vineyard_ID from vineyard ";	
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
		try{
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(query);
	
			  while(rs.next())
     		 {
	%>
			<option value="<%=rs.getString("vineyard_id") %>"><%= rs.getString("vineyard_id") %></option>
	<%
     		}
			  
		}
		catch(Exception e) {
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
		<button type="submit">Ȯ��</button>
		<button type="reset">�ʱ�ȭ</button>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>
	</form>


</body>
</html>