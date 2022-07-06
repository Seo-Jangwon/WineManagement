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
<title>WINERY: <%= winery_id%>의 와인 판매!</title>
</head>
<body>
<form action="SELL_WINE_RESULT.jsp" method="post">
	<table border="1">
		<tr>
		<td colspan = "3">WINERY: <%= winery_id%>의 와인 재고</td>
		</tr>
		<tr>
			<td>종류</td>
			<td>수량</td>
		</tr>

<%	
	


	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	
	

	
	String query_red="select amount from wineinventory where winery_ID='"+winery_id+"' and category_id='red' ";
	String query_white="select amount from wineinventory where winery_ID='"+winery_id+"' and category_id='white' ";
	String query_blush="select amount from wineinventory where winery_ID='"+winery_id+"' and category_id='blush' ";
	String query_sparkling="select amount from wineinventory where winery_ID='"+winery_id+"' and category_id='sparkling' ";
	
	ResultSet result_red=null;
	ResultSet result_white=null;
	ResultSet result_blush=null;
	ResultSet result_sparkling=null;

	int red=0;
	int white=0;
	int blush=0;
	int sparkling=0;
			
			try {
			
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			
			result_red=stmt.executeQuery(query_red);
			while(result_red.next()){
			red=result_red.getInt("amount");
			}
			
			result_white=stmt.executeQuery(query_white);
			while(result_white.next()){
			white=result_white.getInt("amount");
			}
			
			result_blush=stmt.executeQuery(query_blush);
			while(result_blush.next()){
			blush=result_blush.getInt("amount");
			}
			
			result_sparkling=stmt.executeQuery(query_sparkling);
			while(result_sparkling.next()){
			sparkling=result_sparkling.getInt("amount");
			}
		%>	

		<tr>
			<td>RED WINE</td>
			<td><%=red %></td>
		</tr>
		<tr>
			<td>WHITE WINE</td>
			<td><%=white %></td>
		</tr>
		<tr>
			<td>BLUSH WINE</td>
			<td><%=blush %></td>
		</tr>
		<tr>
			<td>SPARKLING WINE</td>
			<td><%=sparkling %></td>
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
		<td colspan = "3">판매할 와인 수량 입력</td>
		</tr>
		<tr>
			<td><label>RED WINE</label></td><td><input name="red_wine" type="number" required="required" value="0" min="0" max="<%=red%>" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/></td>
		</tr>
		<tr>
			<td><label>WHITE WINE</label></td><td><input name="white_wine" type="number" required="required" value="0" min="0" max="<%=white%>" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/></td>
		</tr>
		<tr>
			<td><label>BLUSH WINE</label></td><td><input name="blush_wine" type="number" required="required" value="0" min="0" max="<%=blush%>" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/></td>
		</tr>
		<tr>
			<td><label>SPARKLING WINE</label></td><td><input name="sparkling_wine" type="number" required="required" value="0" min="0" max="<%=sparkling%>" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/></td>
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
     	<button type="submit">판매하기</button>
		<button type="reset">초기화</button>
		<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
     	</form>
</body>
</html>