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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FIELD: <%=field_id%>의 정보 수정</title>
</head>
<body>
<form action="EDIT_FIELD_INFO_RESULT.jsp" method="post">
		<table border="1">
		
		<tr>
		<td colspan = "3">FIELD: <%=field_id%>의 수정 가능한 정보 목록</td>
		</tr>
		<tr>
			<td>주소 </td>
			<td>면적</td>
			<td>재배 품종</td>
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

<%
		String dbName="project";
		String jdbcDriver="jdbc:mariadb://localhost:3306/project";
		String dbUser="root";
		String dbPass="asdf";
	
		Connection conn=null;
		Statement stmt=null;

		
		String query1="select * from field where field_id='" + field_id + "'";	
		ResultSet result1=null;//field 상세정보
	
		
		
		String address=null;
		int area=0;
	
	try {
		
		String driver="org.mariadb.jdbc.Driver";
		Class.forName(driver);
		
		
		conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
		stmt=conn.createStatement();
		result1=stmt.executeQuery(query1);

		
		 while(result1.next())
         {

			address=result1.getString("address");
			area=result1.getInt("area");
         }
		 %>
		 
		 
		 
		 <%
		 if(address==null){
			 address="";
		 }
		
		 %>
		 
		<tr>
			<td colspan = "3"><%=field_id%>에서 수정할 정보를 입력하십시오</td>
		</tr>
		 
		<tr>
			<td><label>주소 </label></td><td><input name="address" type="text" value="<%=address%>" required="required"></td>
		</tr>
		<tr>
			<td><label>면적 </label></td><td><input name="area" type="number" value="<%=area%>" required="required"></td>
		</tr>
		<tr>
			<td><label>재배 품종 </label></td><td><select name="variety" required="required">
			<option value="">==select==</option>
			<option value="red">red</option>
			<option value="white">white</option></select></td>
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
		<input type="hidden" name="field_id", id="field_id"  value="<%=field_id%>">
		<button type="submit">확인</button>
		<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
		</form>
</body>
</html>