<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Vector" %>
<%@page import="java.lang.Exception" %>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	


String winery_id=request.getParameter("winery_id").trim();
int red_wine=Integer.parseInt(request.getParameter("red_wine").trim());
int white_wine=Integer.parseInt(request.getParameter("white_wine").trim());
int blush_wine=Integer.parseInt(request.getParameter("blush_wine").trim());
int sparkling_wine=Integer.parseInt(request.getParameter("sparkling_wine").trim());
LocalDateTime date = LocalDateTime.now();  
String formatChangeDay = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

LocalDate now = LocalDate.now();
int year = now.getYear();//현재 년도

String wt_id= winery_id.concat(formatChangeDay);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>WINERY: <%=winery_id %>의 와인을 판매 완료</title>
</head>
<body>

<%	
	


	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	
	
	
	



			
			try {
			
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			
			
			String grade=null;
			double price=0;
			String grade_query="Select grade_id from winery where winery_id='"+winery_id+"'";
			ResultSet grade_query_result=null;
			grade_query_result=stmt.executeQuery(grade_query);
			while(grade_query_result.next()){
				grade=grade_query_result.getString("grade_id");
			}
			
			if(grade.equals("first")){
				price=2.0;
			}else if(grade.equals("second")){
				price=1.0;
			}else if(grade.equals("third")){
				price=0.5;
			}
			
			int P_red=(int)(10*price);
			int P_white=(int)(10*price);
			int P_sparkling=(int)(20*price);
			int P_blush=(int)(14*price);
			
			
			if(red_wine>0){
				String id=wt_id.concat("_red");
				String query_red1="insert into winetrade (wt_id, category_id, year, amount, winery_id)values('" + id + "','red','"+year+"','" + red_wine + "','" + winery_id + "');";
				String query_red2="update wineinventory set amount=amount-"+red_wine+" where winery_id='"+winery_id+"'and category_id='red'; ";
				String query_red3="update winery set money=money + "+P_red+"  where winery_id='"+winery_id+"'; ";
				ResultSet result_red1=null;
				ResultSet result_red2=null;
				ResultSet result_red3=null;
				stmt.executeUpdate(query_red1);
				stmt.executeUpdate(query_red2);
				stmt.executeUpdate(query_red3);
			}
			
			if(white_wine>0){
				String id=wt_id.concat("_white");
				String query_white1="insert into winetrade (wt_id, category_id, year, amount, winery_id)values('" + id + "','white','"+year+"','" + white_wine + "','" + winery_id + "');";
				String query_white2="update wineinventory set amount=amount-"+white_wine+" where winery_id='"+winery_id+"'and category_id='white'; ";
				String query_white3="update winery set money=money + "+P_white+"  where winery_id='"+winery_id+"'; ";
				ResultSet result_white1=null;
				ResultSet result_white2=null;
				ResultSet result_white3=null;
				stmt.executeUpdate(query_white1);
				stmt.executeUpdate(query_white2);
				stmt.executeUpdate(query_white3);
			}
			if(blush_wine>0){
				String id=wt_id.concat("_blush");
				String query_blush1="insert into winetrade (wt_id, category_id, year, amount, winery_id)values('" + id + "','blush','"+year+"','" + blush_wine + "','" + winery_id + "');";
				String query_blush2="update wineinventory set amount=amount-"+blush_wine+" where winery_id='"+winery_id+"'and category_id='blush'; ";
				String query_blush3="update winery set money=money + "+P_blush+"  where winery_id='"+winery_id+"'; ";
				ResultSet result_blush1=null;
				ResultSet result_blush2=null;
				ResultSet result_blush3=null;
				stmt.executeUpdate(query_blush1);
				stmt.executeUpdate(query_blush2);
				stmt.executeUpdate(query_blush3);
			}
			if(sparkling_wine>0){
				String id=wt_id.concat("_sparkling");
				String query_sparkling1="insert into winetrade (wt_id, category_id, year, amount, winery_id)values('" + id + "','sparkling','"+year+"','" + sparkling_wine + "','" + winery_id + "');";
				String query_sparkling2="update wineinventory set amount=amount-"+sparkling_wine+" where winery_id='"+winery_id+"'and category_id='sparkling'; ";
				String query_sparkling3="update winery set money=money + "+P_sparkling+"  where winery_id='"+winery_id+"'; ";
				ResultSet result_sparkling1=null;
				ResultSet result_sparkling2=null;
				ResultSet result_sparkling3=null;
				stmt.executeUpdate(query_sparkling1);
				stmt.executeUpdate(query_sparkling2);
				stmt.executeUpdate(query_sparkling3);
			}
		
			String query_show_WI="Select * from wineinventory where winery_id='"+winery_id+"'";
			ResultSet result_query_show_WI=null;
			String query_show_WT="Select * from winetrade where winery_id='"+winery_id+"'";
			ResultSet result_query_show_WT=null;
			String query_show_W="Select money from winery where winery_id='"+winery_id+"'";
			ResultSet result_query_show_W=null;
			%>
			
			<table border="1">
			<tr>
				<td colspan = "3">WINERY: <%= winery_id%>의 와인 창고 현황</td>
				</tr>
		<tr>
			<td>거래 ID</td>
			<td>종류</td>
			<td>수량</td>
		</tr>
			
			<%
			
			
			
			result_query_show_WI=stmt.executeQuery(query_show_WI);
			while(result_query_show_WI.next()){
%>
		<tr>
			<td><%= result_query_show_WI.getString("wi_id")%></td>
			<td><%= result_query_show_WI.getString("category_id")%></td>
			<td><%= result_query_show_WI.getInt("amount")%></td>
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
				<td colspan = "3">WINERY: <%= winery_id%>의 와인 거래 현황</td>
				</tr>
			<tr>
				<td>거래 ID</td>
				<td>종류</td>
				<td>년도</td>
				<td>수량</td>
			</tr>
			
			<%
			
			
			result_query_show_WT=stmt.executeQuery(query_show_WT);
			while(result_query_show_WT.next()){
%>
		<tr>
			<td><%= result_query_show_WT.getString("wt_id")%></td>
			<td><%= result_query_show_WT.getString("category_id")%></td>
			<td><%= result_query_show_WT.getInt("year")%></td>
			<td><%= result_query_show_WT.getInt("amount")%></td>
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
				<td colspan = "3">WINERY: <%= winery_id%>의 현재 자금</td>
				</tr>
			<tr>
				<td>자금(리라)</td>
			</tr>
			
			<%
			
			
			result_query_show_W=stmt.executeQuery(query_show_W);
			while(result_query_show_W.next()){
%>
		<tr>
			<td><%= result_query_show_W.getString("money")%></td>
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
     	
     	%>
</table>
<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
<button type="button" onclick=location.href="SHOW_WINERY_LIST.jsp">WINERY 목록으로</button>
</body>
</html>