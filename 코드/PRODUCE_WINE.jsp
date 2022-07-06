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
	LocalDate now = LocalDate.now();
	int year = now.getYear();//현재 년도
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>WINERY: <%=winery_id%>에서 와인 생산</title>
</head>
<body>
<form action="PRODUCE_WINE_RESULT.jsp" method="post">
<table border="1">
		<tr>
			<td colspan = "3">WINERY <%=winery_id%>에서 포도 재고량 </td>
		</tr>

<%	
	
	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	
	int inv_white=0;
	int inv_red=0;
	
	
	String query1="select * from winery where winery_id='" + winery_id + "'";	
	int max_prod=0;
	ResultSet result1=null;//query1의 결과

		
			
			try {
			
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			
			result1=stmt.executeQuery(query1);
			while(result1.next()){
				inv_white=result1.getInt("inv_white");
				inv_red=result1.getInt("inv_red");
			}

			
			Vector<String> possible_production=new Vector();//생산 가능한 와인들 저장할 벡터
			int s_p_p=0;		
			if(inv_white>=1){
				possible_production.add("white");
			}
			if(inv_red>=1){
				possible_production.add("red");
			}
			if(inv_white>=1&&inv_red>=1){
				possible_production.add("blush");
			}
			if(inv_white>=1&&inv_red>=2){
				possible_production.add("sparkling");
			}
			
			s_p_p=possible_production.size();
			%>
		
			<tr>
				<td>화이트 포도 재고</td><td><%=inv_white%></td>
			</tr>
			<tr>
				<td>레드 포도 재고</td><td><%=inv_red%></td>
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
			<td colspan = "3">생산 가능한 와인 목록</td>
		</tr>
		<tr>
			<td><label>와인종류 </label></td><td><select name="category_ID" required="required">
			<option value="">==select==</option>
		<% 
			for(int i=0;i<s_p_p;i++){
		%>
		<option value="<%=possible_production.get(i)%>"><%=possible_production.get(i)%></option>
			<%
			}
		
		%>
		</select></td>
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
			<td>와인 생산 ID 입력</td>
		</tr>
		 <tr>
			<td><input name="wine_id" type="text" required="required"></td>
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
	<input type="hidden" name="winery_id", id="winery_id"  value="<%=winery_id%>">
		<button type="submit">확인</button>
		<button type="reset">초기화</button>
		<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
	</form>
</body>
</html>