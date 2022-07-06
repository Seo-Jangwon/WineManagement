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
	LocalDate now = LocalDate.now();
	int year = now.getYear();//���� �⵵
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FIELD: <%=field_id%>�� �� ����</title>
</head>
<body>

		<table border="1">
		
		<tr>
		<td colspan = "3">FIELD: <%=field_id%>�� �� ����</td>
		</tr>
		<tr>
			<td>VINEYARD ID </td>
			<td>FIELD ID </td>
			<td>�ּ�</td>
			<td>����</td>
			<td>��� ǰ��</td>
		</tr>
<% 
 

 
	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	String vineyard_id=null;
	String variety=null;
	
	String query1="select * from field where field_id='" + field_id + "'";	
	ResultSet result1=null;//field ������
	
	
	try {
		
		String driver="org.mariadb.jdbc.Driver";
		Class.forName(driver);
		
		
		conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
		stmt=conn.createStatement();
		result1=stmt.executeQuery(query1);

		
		 while(result1.next())
         {
			 
			%>
		<tr>
            <td><%= result1.getString("vineyard_id") %></td>
            <td><%= result1.getString("field_id") %></td>
            <td><%= result1.getString("address") %></td>
            <td><%= result1.getString("area") %></td>
            <td><%= result1.getString("variety") %></td>
     	</tr>
			
			<%
			vineyard_id=result1.getString("vineyard_id");
			variety=result1.getString("variety");
         }

		%>

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
		<style>
		FORM {
		display: inline;
		}
		</style>
		<form action="EDIT_FIELD_INFO.jsp" method="post">
		<input type="hidden" name="field_id", id="field_id"  value="<%=field_id%>">
		<button type="submit">�����ϱ�</button>
		</form>
		
		<form action="PRODUCE_GRAPE_FROM_FIELD.jsp" method="post">
		<input type="hidden" name="field_id", id="field_id"  value="<%=field_id%>">
		<input type="hidden" name="vineyard_id", id="vineyard_id"  value="<%=vineyard_id%>">
		<input type="hidden" name="variety", id="variety"  value="<%=variety%>">
		<button type="submit">���� �����ϱ�</button>
		</form>
		
		<button type="button" onclick=location.href="SHOW_FIELD_LIST.jsp">���� ������</button>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>
	
</body>
</html>