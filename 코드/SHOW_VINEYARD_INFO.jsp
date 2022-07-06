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
	LocalDate now = LocalDate.now();
	int year = now.getYear();//���� �⵵
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>VINEYARD: <%=vineyard_id%>�� �� ����</title>
</head>
<body>
<form action="EDIT_VINEYARD_INFO.jsp" method="post">
		<table border="1">
		
		<tr>
		<td colspan = "3">VINEYARD: <%=vineyard_id%>�� �� ����</td>
		</tr>
		<tr>
			<td>VINEYARD ID </td>
			<td>������ </td>
			<td>�ּ� </td>
			<td>����ó </td>
			<td>�ڱ�(����) </td>
			<td>ȭ��Ʈ ���� ���</td>
			<td>���� ���� ���</td>
			
		</tr>
<% 
 

 
	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;

	
	String query1="select * from vineyard where vineyard_id='" + vineyard_id + "'";	
	ResultSet result1=null;//vineyard ������
	
	
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
            <td><%=result1.getString("money") %></td>
            <td><%= result1.getString("inv_white") %></td>
            <td><%= result1.getString("inv_red") %></td>
    
           

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
			<td>VINEYARD: <%=vineyard_id%>�� ������ FIELD�� ID</td>
		</tr>
		<%
	
		String query2="select field_id from field where vineyard_id='" + vineyard_id + "'";
		ResultSet result2=null;//field_id ã��
		result2=stmt.executeQuery(query2);
		while(result2.next())
		{
		
		%>
		<tr>
			<td><%= result2.getString("field_id") %></td>
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
			<td>VINEYARD: <%=vineyard_id%>�� ������ FIELD�� <%=year%>�⵵ �� ���귮</td>
		</tr>
		<%
		
		String query3="select sum(amount) from grapeproduction where year='" +  year + "'and field_id in(select field_id from field where vineyard_id='" + vineyard_id + "')";
		ResultSet result3=null;//2021 grape production ã��
		result3=stmt.executeQuery(query3);
		while(result3.next())
		{
				
		%>
		<tr>
			<td><%= result3.getInt(1) %>��</td>
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
		<input type="hidden" name="vineyard_id", id="vineyard_id"  value="<%=vineyard_id%>">
		<button type="submit">�����ϱ�</button>
		<button type="button" onclick=location.href="SHOW_VINEYARD_LIST.jsp">���� ������</button>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>
	</form>
</body>
</html>