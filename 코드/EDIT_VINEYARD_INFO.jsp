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
 String vineyard_id=request.getParameter("vineyard_id").trim();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>VINEYARD: <%=vineyard_id%>의 정보 수정</title>
</head>
<body>
<form action="EDIT_VINEYARD_INFO_RESULT.jsp" method="post">
		<table border="1">
		


<%
		String dbName="project";
		String jdbcDriver="jdbc:mariadb://localhost:3306/project";
		String dbUser="root";
		String dbPass="asdf";
	
		Connection conn=null;
		Statement stmt=null;

		
		String query1="select * from vineyard where vineyard_id='" + vineyard_id + "'";	
		ResultSet result1=null;//vineyard 상세정보
	
		
		
		String owner=null;
		String address=null;
		int tel_number=0;
	
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

         }
		 %>
		 
		 
		 
		 <%
		 
		 %>
		 
		<tr>
			<td colspan = "3">VINEYARD: <%=vineyard_id%>에서 수정할 정보를 입력하십시오</td>
		</tr>
		 
		 <tr>
			<td><label>소유자 </label></td><td><input name="owner" type="text" value="<%=owner%>" required="required"></td>
		</tr>
		<tr>
			<td><label>주소 </label></td><td><input name="address" type="text" value="<%=address%>" required="required"></td>
		</tr>
		<tr>
			<td><label>연락처 </label></td><td><input name="tel_number" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" value="<%=tel_number%>" required="required"></td>
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
		<input type="hidden" name="vineyard_id", id="vineyard_id"  value="<%=vineyard_id%>">
		<button type="submit">확인</button>
		<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
		</form>
		
</body>
</html>