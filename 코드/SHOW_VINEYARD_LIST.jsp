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
<title>VINEYARD 리스트와 정보</title>
</head>
<body>

<form action="SHOW_VINEYARD_INFO.jsp" method="post">
		<table border="1">
		
		<tr>
		<td colspan = "3">VINEYARD 리스트와 정보</td>
		</tr>
		<tr>
			<td>VINEYARD ID </td>
			<td>소유자</td>
			<td>주소</td>
			<td>연락처</td>
		</tr>
<%	
	
	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	
	
	String query1="select* from vineyard ";	
	ResultSet result1=null;//query1의 결과
	ResultSet result2=null;//query1의 결과
		
			
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
            <td><%= result1.getString("owner") %></td>
            <td><%= result1.getString("address") %></td>
            <td><%= result1.getString("tel_number") %></td>

				<%
			}
			String query2="select* from vineyard ";	
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
			<td colspan = "3">VINEYARD 선택</td>
			</tr>
			<tr>
			<td><label>VINEYARD ID </label></td><td><select name="vineyard_id" required="required">
			<option value="">==select==</option>
			<%
			
			while(result2.next()){
			
			%>
			<option value="<%=result2.getString("vineyard_id") %>"><%= result2.getString("vineyard_id") %></option>
		
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
		<button type="submit">상세정보 보기</button>
		<button type="reset">초기화</button>
		<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
	</form>
	
</body>
</html>