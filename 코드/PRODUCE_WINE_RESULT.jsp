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
    String category_id=request.getParameter("category_ID").trim();
    String WP_N_WI_id=request.getParameter("wine_id").trim();
	LocalDate now = LocalDate.now();
	int year = now.getYear();//���� �⵵
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>WINERY: <%=winery_id%>���� ���� ���� Ȯ��</title>
</head>
<body>
<%	
	Vector<String> wp_id_Vector=new Vector();//wp_id�� ������ ����
	String inv_id=(winery_id.concat("_")).concat(category_id);
	String query_find_wpid="select wp_ID from wineproduction ";
	ResultSet result_find_wpid=null;//query_find_wpid�� ���
	
	//
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
		result_find_wpid=stmt.executeQuery(query_find_wpid);
		
		while(result_find_wpid.next()){
			wp_id_Vector.add(result_find_wpid.getString(1));//���Ϳ� wp_id ����
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
	


	

	
	
	int s_wp_id=wp_id_Vector.size();//���� ������ ����
	int wp_id_TorF=0;
	for(int i=0;i<s_wp_id;i++){
		if(wp_id_Vector.get(i).equals(WP_N_WI_id)){
			wp_id_TorF=1;
		}else{}
	}

	if(wp_id_TorF>=1){
		try{
		throw new Exception();
		}
		catch(Exception e){
		out.println("<script>alert('�̹� �����ϴ� ID�Դϴ�.');  history.go(-1);</script>");

		}
	}else{//���� �ߺ��� �������� �ʴ´ٸ�

			
			try {
			
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			
			String inv_update_quary=null;
			if(category_id.equals("red")){
				inv_update_quary="update winery set inv_red= inv_red - 1  WHERE winery_id = '" + winery_id + "'; ";
			}else if(category_id.equals("white")){
				inv_update_quary="update winery set inv_white= inv_white - 1  WHERE winery_id = '" + winery_id + "'; ";
			}else if(category_id.equals("sparkling")){
				inv_update_quary="update winery set inv_white= inv_white - 1, inv_red = inv_red - 2  WHERE winery_id = '" + winery_id + "'; ";
			}else if(category_id.equals("blush")){
				inv_update_quary="update winery set inv_red= inv_white - 1, inv_red = inv_red - 1  WHERE winery_id = '" + winery_id + "'; ";
			}
			stmt.executeUpdate(inv_update_quary);//winery�� ���� ��� ������Ʈ
			
			String wine_production_query="insert into wineproduction (WP_ID, category_id, year, amount, winery_ID) values('" + WP_N_WI_id + "','" + category_id + "','" + year + "','" + 1 + "','" + winery_id + "');";
			stmt.executeUpdate(wine_production_query);//gp�� �������� ����
			
			String wine_inventory_query="update wineinventory set amount= amount + 1  WHERE wi_id = '" + inv_id + "'; ";
			stmt.executeUpdate(wine_inventory_query);//gp�� �������� ����
			
			%>
		<table border="1">
		<tr>
			<td colspan = "3">WINERY: <%=winery_id%>���� ���� ���� ���� </td>
		</tr>
		
		<tr>
			<td>���� ID</td>
			<td>���� ����</td>
			<td>���� �⵵</td>
			<td>����</td>
        	<td>WINERY ID</td>
      	</tr>
			<%
	
			String show_prod="select * from wineproduction where winery_id='" + winery_id + "'";
			ResultSet result_show_prod=null;
			result_show_prod=stmt.executeQuery(show_prod);
			while(result_show_prod.next()){
				%>
		<tr>
			<td><%= result_show_prod.getString("wp_id") %></td>
			<td><%= result_show_prod.getString("category_id") %></td>
			<td><%= result_show_prod.getString("year") %></td>
			<td><%= result_show_prod.getString("amount") %></td>
            <td><%= result_show_prod.getString("winery_id") %></td>
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
			<td colspan = "3">WINERY <%=winery_id%>�� ���� ��� ��Ȳ </td>
		</tr>
		
		<tr>
			<td>���� ����</td>
			<td>���� ID</td>
			<td>����</td>
        	<td>WINERY ID</td>
      	</tr>
			
			<%
	
			String show_inv="select * from wineinventory where winery_id='" + winery_id + "'";
			ResultSet result_show_inv=null;
			result_show_inv=stmt.executeQuery(show_inv);
			while(result_show_inv.next()){
				%>
		<tr>
			<td><%= result_show_inv.getString("category_id") %></td>
			<td><%= result_show_inv.getString("wi_id") %></td>
			<td><%= result_show_inv.getString("amount") %></td>
            <td><%= result_show_inv.getString("winery_id") %></td>
          </tr>
				
			<%
			}
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
	}
	
			%>
			</table>
			<button type="button" onclick=location.href="MAIN.jsp">��������</button>
			<button type="button" onclick=location.href="SHOW_WINERY_LIST.jsp">WINERY ����Ʈ��</button>
</body>
</html>