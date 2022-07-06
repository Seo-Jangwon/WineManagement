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
String vineyard_id=request.getParameter("vineyard_id").trim();
int white=Integer.parseInt(request.getParameter("white").trim());
int red=Integer.parseInt(request.getParameter("red").trim());
int money=Integer.parseInt(request.getParameter("money").trim());
LocalDateTime date = LocalDateTime.now();  
String formatChangeDay = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

int total_minus_money=white+red;

LocalDate now = LocalDate.now();
int year = now.getYear();//현재 년도

String gt_id_red= ((((winery_id.concat("-")).concat(formatChangeDay)).concat("_")).concat(vineyard_id)).concat("_red");
String gt_id_white= ((((winery_id.concat("-")).concat(formatChangeDay)).concat("_")).concat(vineyard_id)).concat("_white");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>VINEYARD: <%=vineyard_id%>와 WINERY: <%=winery_id%>간의 포도 거래 확인</title>
</head>
<body>
	<%	
	if((white+red)>money){
		out.println("<script>alert('구매 가능 수량을 초과하였습니다.'); history.go(-1);</script>");
	}else{


	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	
	
	
	String update_vineyard="update vineyard set money = money +'" + total_minus_money + "',inv_red = inv_red -'" + red + "',inv_white = inv_white -'" + white + "'WHERE vineyard_id = '" + vineyard_id + "'; ";
	String update_winery="update winery set money = money -'" + total_minus_money + "',inv_red = inv_red +'" + red + "',inv_white = inv_white +'" + white + "'WHERE winery_id = '" + winery_id + "'; ";
	String insert_grapeTrade_red="insert into grapetrade (gt_id, year, variety, amount, vineyard_id, winery_id) values('" + gt_id_red + "','" + year + "',' red', '" +red + "','" + vineyard_id + "','" + winery_id + "');";
	String insert_grapeTrade_white="insert into grapetrade (gt_id, year, variety, amount, vineyard_id, winery_id) values('" + gt_id_white + "','" + year + "', 'white', '" +white + "','" + vineyard_id + "','" + winery_id + "');";

	
	
	try {
		
		String driver="org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
		stmt=conn.createStatement();
		
		stmt.executeUpdate(update_vineyard);
		stmt.executeUpdate(update_winery);
		
		if(white>0){
		stmt.executeUpdate(insert_grapeTrade_white);
		}
		if(red>0){
		stmt.executeUpdate(insert_grapeTrade_red);
		}
		
		
		String show_winery="select * from winery where winery_id='"+winery_id+"'";
		String show_vineyard="select * from vineyard where vineyard_id='"+vineyard_id+"'";
		String show_grapetrade="select * from grapetrade where winery_id='"+winery_id+"'";
		ResultSet result_show_winery=null;
		ResultSet result_show_vineyard=null;
		ResultSet result_show_grapetrade=null;
		%>
		<table border="1">
		<tr>
			<td colspan = "3">WINERY: <%=winery_id%> 현황</td>
		</tr>
		<tr>
			<td>화이트 포도 재고량</td>
			<td>레드 포도 재고량</td>
			<td>자금(리라)</td>
		</tr>
		<%
		result_show_winery=stmt.executeQuery(show_winery);
		while(result_show_winery.next()){
			%>
			<td><%=result_show_winery.getString("inv_white") %></td>
			<td><%=result_show_winery.getString("inv_red") %></td>
			<td><%=result_show_winery.getString("money") %></td>
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
		<table border="1">
		<tr>
			<td colspan = "3">VINEYARD: <%=vineyard_id%> 현황</td>
		</tr>
		<tr>
			<td>화이트 포도 재고량</td>
			<td>레드 포도 재고량</td>
			<td>자금(리라) </td>
		</tr>
		<%
		result_show_vineyard=stmt.executeQuery(show_vineyard);
		while(result_show_vineyard.next()){
			%>
			<td><%=result_show_vineyard.getString("inv_white") %></td>
			<td><%=result_show_vineyard.getString("inv_red") %></td>
			<td><%=result_show_vineyard.getString("money") %></td>
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
		<table border="1">
		<tr>
			<td colspan = "3">WINERY: <%=winery_id%>의 VINEYARD: <%=vineyard_id%>와의 포도 거래 현황</td>
		</tr>
		<tr>
			<td>거래 ID</td>
			<td>년도</td>
			<td>품종</td>
			<td>수량</td>
		</tr>
		<%
		result_show_grapetrade=stmt.executeQuery(show_grapetrade);
		while(result_show_grapetrade.next()){
			%>
			<td><%=result_show_grapetrade.getString("gt_id") %></td>
			<td><%=result_show_grapetrade.getString("year") %></td>
			<td><%=result_show_grapetrade.getString("variety") %></td>
			<td><%=result_show_grapetrade.getString("amount") %></td>
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
	}
	
	%>
		


	</table>
	<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
	<button type="button" onclick=location.href="SHOW_WINERY_LIST.jsp">WINERY 목록으로</button>
</body>
</html>