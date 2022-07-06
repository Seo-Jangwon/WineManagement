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
    String vineyard_id=request.getParameter("vineyard_id").trim();
    String variety =request.getParameter("variety").trim();
	LocalDate now = LocalDate.now();
	int year = now.getYear();//���� �⵵
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FIELD: <%=field_id%>���� ���� ����</title>
</head>
<body>
<form action="PRODUCE_GRAPE_FROM_FIELD_RESULT.jsp" method="post">
		<table border="1">
		

<%	
	
	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	
	
	String query1="select area from field where field_id='" + field_id + "'";	
	int max_prod=0;
	ResultSet result1=null;//query1�� ���

		
			
			try {
			
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			
			result1=stmt.executeQuery(query1);
			while(result1.next()){
				max_prod=result1.getInt(1);
			}

			%>
			<tr>
			<td colspan = "3">FIELD: <%=field_id%>���� ���� ID �Է� </td>
			</tr>
			<tr>
			<td><input type="text" name="gp_id" required="required" /></td>
			</tr>
			<tr>
			<td colspan = "3">FIELD: <%=field_id%>���� ���� ���� ���� �Է�( �ִ� ���� ���� ����: <%=max_prod%> )</td>
			</tr>
			<tr>
			<td><input type="number" min="0" name="prod_amount" max="<%=max_prod%>" required="required" /></td>
			</tr>
			
			<%
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
			
			
			
		
	</table>
	<input type="hidden" name="field_id", id="field_id"  value="<%=field_id%>">
	<input type="hidden" name="vineyard_id", id="vineyard_id"  value="<%=vineyard_id%>">
	<input type="hidden" name="variety", id="variety"  value="<%=variety%>">
		<button type="submit">Ȯ��</button>
		<button type="reset">�ʱ�ȭ</button>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>
	</form>
</body>
</html>