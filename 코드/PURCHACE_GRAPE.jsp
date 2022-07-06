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
String vineyard_id=request.getParameter("vineyard_id").trim();
LocalDate now = LocalDate.now();
int year = now.getYear();//���� �⵵
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>VINEYARD: <%=vineyard_id%>�� WINERY: <%=winery_id%>���� ���� �ŷ�</title>
</head>
<body>

<form action="PURCHACE_GRAPE_RESULT.jsp" method="post">
	<table border="1">

<%	
	


	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	
	
	int money=0;
	int inv_red=0;
	int inv_white=0;
	
	int max_red=0;
	int max_white=0;
	
	
	String query_money="select money from winery where winery_ID='"+winery_id+"'";
	String query_grape_inv="select * from vineyard where vineyard_ID='"+vineyard_id+"'";
	ResultSet result_money=null;
	ResultSet result_grape=null;
	
	try {
		
		String driver="org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
		stmt=conn.createStatement();
		
		result_money=stmt.executeQuery(query_money);
		while(result_money.next()){
		money=result_money.getInt("money");
		}
		
		result_grape=stmt.executeQuery(query_grape_inv);
		while(result_grape.next()){
		inv_red=result_grape.getInt("inv_red");
		inv_white=result_grape.getInt("inv_white");
		}
		
		max_red=Math.min(money, inv_red);
		max_white=Math.min(money, inv_white);
		
		
		%>
		<tr>
			<td colspan = "3">WINERY: <%=winery_id%>�� �ڱ� ��Ȳ</td>
		</tr>
		<tr>
			<td>�ڱ�(����)</td>
		</tr>
		<tr>
			<td><%=money %></td>
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
		<td colspan = "3">VINEYARD: <%=vineyard_id%>�� ���� ��� ��Ȳ</td>
		</tr>
		<tr>
			<td>���� ���� ���</td><td><%=inv_red%></td>
		</tr>
		<tr>
			<td>������ ���� ���� ����</td>
			<td><input type="number" id= "red" name="red" required="required" value="0" min="0" max="<%=max_red%>" /></td>
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
			<td>ȭ��Ʈ ���� ���</td><td><%=inv_white%></td>
		</tr>
		<tr>
			<td>������ ȭ��Ʈ ���� ����</td>
			<td><input type="number" id= "white" name="white" required="required" value="0" min="0" max="<%=max_white%>"  /></td>
		</tr>
		<tr>
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
	<input type="hidden" name="vineyard_id", id="vineyard_id"  value="<%=vineyard_id%>">
		<input type="hidden" name="money", id="money"  value="<%=money%>">
		<button type="submit">���� �����ϱ�</button>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>
	</form>


</body>
</html>