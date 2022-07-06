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
<title>WINERY: <%= winery_id%>의 상세 정보</title>
</head>
<body>

		<table border="1">
		
		<tr>
		<td colspan = "3">WINERY: <%= winery_id%>의 상세 정보</td>
		</tr>
		<tr>
			<td>WINERY ID </td>
			<td>소유자 </td>
			<td>주소 </td>
			<td>연락처 </td>
			<td>자금(리라)</td>
			<td>화이트 포도 재고량</td>
			<td>레드 포도 재고량</td>
			<td>등급</td>
			<td>거래중인 VINEYARD ID</td>
		</tr>
<% 
 

 
	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;


	
	
	String vineyard_id=null;
	String query1="select * from winery where winery_id='" + winery_id + "'";	
	ResultSet result1=null;//winery 상세정보
	
	
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
            <td><%= result1.getString("owner") %></td>
            <td><%= result1.getString("address") %></td>
            <td><%= result1.getString("tel_number") %></td>
            <td><%= result1.getString("money") %></td>
            <td><%= result1.getString("inv_white") %></td>
            <td><%= result1.getString("inv_red") %></td>
            <td><%= result1.getString("grade_Id") %></td>
            <td><%= result1.getString("vineyard_id") %></td>
    
           

     	</tr>
			
			<%
			vineyard_id=result1.getString("vineyard_id");
         }
		
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
			<td>WINERY: <%=winery_id%>의 와인 총 재고량</td>
		</tr>
		<tr>
	            <td>종류</td>
	            <td>수량(병)</td>
			</tr>
		<%
		String query2="select category_id, amount from wineinventory where winery_ID= '" + winery_id + "'";
		ResultSet result2=null;
		result2=stmt.executeQuery(query2);
		 while(result2.next()){
			 
			 %>
			<tr>
	            <td><%= result2.getString("category_ID") %></td>
	            <td><%= result2.getInt("amount") %></td>
			</tr>
		<%
		 }
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
			<td>WINERY: <%=winery_id%>의 와인 총 생산량</td>
		</tr>
		<tr>
	            <td>종류</td>
	            <td>수량(병)</td>
			</tr>
		 
		 <%
		String query2_1="select category_id, sum(amount) from wineproduction where winery_ID= '" + winery_id + "'group by category_id" ;
		ResultSet result2_1=null;
		result2_1=stmt.executeQuery(query2_1);
		 while(result2_1.next()){
			 
			 %>
			<tr>
	            <td><%= result2_1.getString("category_ID") %></td>
	            <td><%= result2_1.getInt("sum(amount)") %></td>
			</tr>
		<%
		 }
		%><tr>
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
			<td>WINERY: <%=winery_id%>의 와인 총 판매량</td>
		</tr>
		<tr>
	            <td>종류</td>
	            <td>수량(병)</td>
			</tr>
		 
		 <%
		String query2_2="select category_id, sum(amount) from winetrade where winery_ID= '" + winery_id + "'group by category_id";
		ResultSet result2_2=null;
		result2_2=stmt.executeQuery(query2_2);
		 while(result2_2.next()){
			 
			 %>
			<tr>
	            <td><%= result2_2.getString("category_ID") %></td>
	            <td><%= result2_2.getInt("sum(amount)") %></td>
			</tr>
		<%
		 }
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
			<td>WINERY: <%=winery_id%>의  <%=year%>년 와인  생산 목록</td>
		</tr>
		<tr>
				<td>생산 ID</td>
	            <td>종류</td>
	            <td>수량(병)</td>
		</tr>
		<%
		String query3="select * from wineproduction where year='"+year+"' and winery_ID= '" + winery_id + "'";
		ResultSet result3=null;
		result3=stmt.executeQuery(query3);
		 while(result3.next()){
			 %>
		 
		 	<tr>
	            
	            <td><%= result3.getString("wp_id") %></td>
	            <td><%= result3.getString("category_ID") %></td>
	            <td><%= result3.getInt("amount") %></td>
			</tr>
		 
		 <%
		 }
		 
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
			<td>WINERY: <%=winery_id%>의 <%=year%>년 와인 판매 목록</td>
		</tr>
		<tr>
				<td>거래 ID</td>
	            <td>종류</td>
	            <td>수량(병)</td>
		</tr>
		 <%
		 String query4="select * from winetrade where year='"+year+"' and winery_ID= '" + winery_id + "'";
			ResultSet result4=null;
			result4=stmt.executeQuery(query4);
			 while(result4.next()){
				 %>
			 
			 	<tr>
		            
		            <td><%= result4.getString("wt_id") %></td>
		            <td><%= result4.getString("category_ID") %></td>
		            <td><%= result4.getInt("amount") %></td>
				</tr>
			 
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
	
	
	
	
	//===============================아랫부분 수정필요
		%>	
	
	
		</table>
		<style>
		FORM {
		display: inline;
		}
		</style>
		<form action="EDIT_WINERY_INFO.jsp" method="post">
		<input type="hidden" name="winery_id", id="winery_id"  value="<%=winery_id%>">
		<button type="submit">수정하기</button>
		</form>
		
		<form action="PRODUCE_WINE.jsp" method="post">
		<input type="hidden" name="winery_id", id="winery_id"  value="<%=winery_id%>">
		<button type="submit">생산하기</button>
		</form>
		
		<form action="PURCHACE_GRAPE.jsp" method="post">
		<input type="hidden" name="winery_id", id="winery_id"  value="<%=winery_id%>">
		<input type="hidden" name="vineyard_id", id="vineyard_id"  value="<%=vineyard_id%>">
		<button type="submit">포도 구매하기</button>
		</form>
		
		<form action="SELL_WINE.jsp" method="post">
		<input type="hidden" name="winery_id", id="winery_id"  value="<%=winery_id%>">
		<button type="submit">와인 판매하기</button>
		</form>
		
		<button type="button" onclick=location.href="SHOW_WINERY_LIST.jsp">이전 페이지</button>
		<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>

</body>
</html>