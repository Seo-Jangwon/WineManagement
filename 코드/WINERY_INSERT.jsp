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
<title>새로운 WINERY 정보입력</title>
</head>
<body>

	<form action="WINERY_RESULT.jsp" method="post">
		<table border="1">
		<tr>
		<td colspan = "3">새로운 WINERY의 정보 입력</td>
		</tr>
		<tr>
			<td><label>WINERY ID </label></td><td><input name="winery_id" type="text" required="required"/></td>
		</tr>
		<tr>
			<td><label>소유자 </label></td><td><input name="owner" type="text" required="required"/></td>
		</tr>
		<tr>
			<td><label>주소 </label></td><td><input name="address" type="text" required="required"></td>
		</tr>
		<tr>
			<td><label>연락처 </label></td><td><input name="tel_number" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required="required"/></td>
		</tr>
		
		<tr>
			<td><label>자금(리라) </label></td><td><input name="money" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required="required"/></td>
		</tr>
		<tr>
			<td><label>등급</label></td><td><select name="grade_id" required="required">
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
	ResultSet result1=null;//query1의 결과
		
			
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
		<td colspan = "3">거래 할 VINEYARD의 ID 입력</td>
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
		<button type="submit">확인</button>
		<button type="reset">초기화</button>
		<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
	</form>
</body>
</html>