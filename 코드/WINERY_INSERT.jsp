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
<title>���ο� WINERY �����Է�</title>
</head>
<body>

	<form action="WINERY_RESULT.jsp" method="post">
		<table border="1">
		<tr>
		<td colspan = "3">���ο� WINERY�� ���� �Է�</td>
		</tr>
		<tr>
			<td><label>WINERY ID </label></td><td><input name="winery_id" type="text" required="required"/></td>
		</tr>
		<tr>
			<td><label>������ </label></td><td><input name="owner" type="text" required="required"/></td>
		</tr>
		<tr>
			<td><label>�ּ� </label></td><td><input name="address" type="text" required="required"></td>
		</tr>
		<tr>
			<td><label>����ó </label></td><td><input name="tel_number" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required="required"/></td>
		</tr>
		
		<tr>
			<td><label>�ڱ�(����) </label></td><td><input name="money" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required="required"/></td>
		</tr>
		<tr>
			<td><label>���</label></td><td><select name="grade_id" required="required">
			<option value="">==select==</option>
			<option value="first">first</option>
			<option value="second">second</option>
			<option value="third">third</option></select></td>
		</tr>
		<%	
	
	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	
	
	String query1="select vineyard_id from vineyard ";	
	ResultSet result1=null;//query1�� ���
		
			
			try {
			
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			%>
		
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
		<td colspan = "3">�ŷ� �� VINEYARD�� ID �Է�</td>
		</tr>
		<td><label>VINEYARD ID </label></td><td><select name="vineyard_id" required="required">
			<option value="">==select==</option>
		<%
			result1=stmt.executeQuery(query1);
			while(result1.next()){
				%><option value="<%=result1.getString("vineyard_id") %>"><%= result1.getString("vineyard_id") %></option>
		
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
		<button type="submit">Ȯ��</button>
		<button type="reset">�ʱ�ȭ</button>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>
	</form>
</body>
</html>