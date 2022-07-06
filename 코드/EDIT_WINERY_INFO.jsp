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
<title><%=winery_id%>�� ���� ����</title>
</head>
<body>
<form action="EDIT_WINERY_INFO_RESULT.jsp" method="post">
		<table border="1">
		
		<tr>
		<td colspan = "3">WINERY: <%=winery_id%>�� ���� ������ ���� ���</td>
		</tr>
		<tr>
			
			<td>������</td>
			<td>�ּ� </td>
			<td>����ó</td>
			<td>���</td>
			<td>�ŷ� VINEYARD ID</td>
			
		</tr>

<%
		String dbName="project";
		String jdbcDriver="jdbc:mariadb://localhost:3306/project";
		String dbUser="root";
		String dbPass="asdf";
	
		Connection conn=null;
		Statement stmt=null;

		
		String query1="select * from winery where winery_id='" + winery_id + "'";	
		ResultSet result1=null;//winery ������
	
		
		
		String owner=null;
		String address=null;
		int tel_number=0;
		String grade=null;
		String vineyard_id=null;
	
	try {
		
		String driver="org.mariadb.jdbc.Driver";
		Class.forName(driver);
		
		
		conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
		stmt=conn.createStatement();
		result1=stmt.executeQuery(query1);

		
		 while(result1.next())
         {

            
           owner=result1.getString("owner");
           address=result1.getString("address");
           tel_number=Integer.parseInt(result1.getString("tel_number"));
           grade=result1.getString("grade_id");
           vineyard_id=result1.getString("vineyard_id");

         }
		 %>
		 
		 
		 
		 <%

		 %>
		 
		<tr>
			<td colspan = "3">WINERY: <%=winery_id%>���� ������ ������ �Է��Ͻʽÿ�</td>
		</tr>
		 
		 <tr>
			<td><label>������ </label></td><td><input name="owner" type="text" value="<%=owner%>" required="required"></td>
		</tr>
		<tr>
			<td><label>�ּ� </label></td><td><input name="address" type="text" value="<%=address%>" required="required"></td>
		</tr>
		<tr>
			<td><label>����ó </label></td><td><input name="tel_number" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" value="<%=tel_number%>" required="required"></td>
		</tr>
		<tr>
			<td><label>��� </label></td><td><select name="grade_id" required="required">
			<option value="<%=grade%>"><%=grade%></option>
			<option value="first">first</option>
			<option value="second">second</option>
			<option value="third">third</option></select></td>
		</tr>
		<tr>
			<td><label>�ŷ� VINEYARD ID</label></td><td><select name="vineyard_id" required="required">
			<option value="<%=vineyard_id%>"><%=vineyard_id%></option>
			<% 
			String query2="select vineyard_id from vineyard ";	
			ResultSet result2=null;
			result2=stmt.executeQuery(query2);
			while(result2.next())
			{
			%>
			<option value="<%=result2.getString("vineyard_id")%>"><%=result2.getString("vineyard_id")%></option>
			<% 
			}
			%>
			
			</select></td>
		</tr>
		 
		 
		 <%
		 

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
		<input type="hidden" name="winery_id", id="winery_id"  value="<%=winery_id%>">
		<button type="submit">Ȯ��</button>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>
		</form>
		
</body>
</html>