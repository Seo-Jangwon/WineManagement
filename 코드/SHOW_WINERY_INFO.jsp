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
	int year = now.getYear();//���� �⵵
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>WINERY: <%= winery_id%>�� �� ����</title>
</head>
<body>

		<table border="1">
		
		<tr>
		<td colspan = "3">WINERY: <%= winery_id%>�� �� ����</td>
		</tr>
		<tr>
			<td>WINERY ID </td>
			<td>������ </td>
			<td>�ּ� </td>
			<td>����ó </td>
			<td>�ڱ�(����)</td>
			<td>ȭ��Ʈ ���� ���</td>
			<td>���� ���� ���</td>
			<td>���</td>
			<td>�ŷ����� VINEYARD ID</td>
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
	ResultSet result1=null;//winery ������
	
	
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
			<td>WINERY: <%=winery_id%>�� ���� �� ���</td>
		</tr>
		<tr>
	            <td>����</td>
	            <td>����(��)</td>
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
			<td>WINERY: <%=winery_id%>�� ���� �� ���귮</td>
		</tr>
		<tr>
	            <td>����</td>
	            <td>����(��)</td>
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
			<td>WINERY: <%=winery_id%>�� ���� �� �Ǹŷ�</td>
		</tr>
		<tr>
	            <td>����</td>
	            <td>����(��)</td>
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
			<td>WINERY: <%=winery_id%>��  <%=year%>�� ����  ���� ���</td>
		</tr>
		<tr>
				<td>���� ID</td>
	            <td>����</td>
	            <td>����(��)</td>
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
			<td>WINERY: <%=winery_id%>�� <%=year%>�� ���� �Ǹ� ���</td>
		</tr>
		<tr>
				<td>�ŷ� ID</td>
	            <td>����</td>
	            <td>����(��)</td>
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
	
	
	
	
	//===============================�Ʒ��κ� �����ʿ�
		%>	
	
	
		</table>
		<style>
		FORM {
		display: inline;
		}
		</style>
		<form action="EDIT_WINERY_INFO.jsp" method="post">
		<input type="hidden" name="winery_id", id="winery_id"  value="<%=winery_id%>">
		<button type="submit">�����ϱ�</button>
		</form>
		
		<form action="PRODUCE_WINE.jsp" method="post">
		<input type="hidden" name="winery_id", id="winery_id"  value="<%=winery_id%>">
		<button type="submit">�����ϱ�</button>
		</form>
		
		<form action="PURCHACE_GRAPE.jsp" method="post">
		<input type="hidden" name="winery_id", id="winery_id"  value="<%=winery_id%>">
		<input type="hidden" name="vineyard_id", id="vineyard_id"  value="<%=vineyard_id%>">
		<button type="submit">���� �����ϱ�</button>
		</form>
		
		<form action="SELL_WINE.jsp" method="post">
		<input type="hidden" name="winery_id", id="winery_id"  value="<%=winery_id%>">
		<button type="submit">���� �Ǹ��ϱ�</button>
		</form>
		
		<button type="button" onclick=location.href="SHOW_WINERY_LIST.jsp">���� ������</button>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>

</body>
</html>