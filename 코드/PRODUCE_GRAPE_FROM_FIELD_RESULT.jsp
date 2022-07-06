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
    String gp_id=request.getParameter("gp_id").trim();
 	String field_id=request.getParameter("field_id").trim();
    String vineyard_id=request.getParameter("vineyard_id").trim();
    String variety=request.getParameter("variety").trim();
    int prod_amount=Integer.parseInt(request.getParameter("prod_amount").trim());
	LocalDate now = LocalDate.now();
	int year = now.getYear();//���� �⵵
	
	
	//out.println(gp_id);
	//out.println("	");
	//out.println(field_id);
	//out.println("	");
	//out.println(vineyard_id);
	//out.println("	");
	//out.println(variety);
	//out.println("	");
	//out.println(prod_amount);
	//out.println("	");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FIELD: <%=field_id%>���� ���� ���� Ȯ��</title>
</head>
<body>

<table border="1">
		
		<tr>
		<td colspan = "3">FIELD: <%=field_id%>���� ���� ���� Ȯ��</td>
		</tr>
		<tr>
			<td>VINEYARD ID</td>
			<td>���� ID</td>
			<td>������</td>
			<td>���� ���� ���</td>
			<td>ȭ��Ʈ ���� ���</td>
		</tr>

<%	
	Vector<String> gp_id_Vector=new Vector();//gp_id�� ������ ����
	
	String query_find_gpid="select gp_ID from grapeproduction ";
	ResultSet result_find_gpid=null;//query_find_gpid�� ���
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
		result_find_gpid=stmt.executeQuery(query_find_gpid);
		
		while(result_find_gpid.next()){
			gp_id_Vector.add(result_find_gpid.getString(1));//���Ϳ� field_id ����
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
	


	

	
	
	int s_gp_id=gp_id_Vector.size();//���� ������ ����
	int gp_id_TorF=0;
	for(int i=0;i<s_gp_id;i++){
		if(gp_id_Vector.get(i).equals(gp_id)){
			gp_id_TorF=1;
		}else{}
	}
	if(gp_id_TorF>=1){
		try{
		throw new Exception();
		}
		catch(Exception e){
		out.println("<script>alert('����_ID�� �ߺ��Ǿ����ϴ�');  history.go(-1);</script>");

		}
	}else{//���� �ߺ��� �������� �ʴ´ٸ�
		
			
			try {
			
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			
			String produce_query="insert into grapeproduction (GP_ID, year, amount, field_ID) values('" + gp_id + "','" + year + "','" + prod_amount + "','" + field_id + "');";
			stmt.executeUpdate(produce_query);//gp�� �������� ����
			
		
			String inv_var=null;
			if(variety.equals("white")){
				inv_var="inv_white";
			}else{
				inv_var="inv_red";
			}
			//out.println(inv_var);
			String update_inv="update vineyard set "+inv_var+"=" + inv_var + "+" +prod_amount+ "  WHERE vineyard_id = '" + vineyard_id + "'; ";
			stmt.executeUpdate(update_inv);
	
			String show_inv="select * from vineyard where vineyard_id='" + vineyard_id + "'";
			ResultSet result_show_inv=null;
			result_show_inv=stmt.executeQuery(show_inv);
			while(result_show_inv.next()){
				%>
		<tr>
			<td><%= result_show_inv.getString("vineyard_id") %></td>
			<td><%= gp_id %></td>
			<td><%= result_show_inv.getString("owner") %></td>
			<td><%= result_show_inv.getString("inv_red") %></td>
            <td><%= result_show_inv.getString("inv_white") %></td>
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
			<button type="button" onclick=location.href="SHOW_FIELD_LIST.jsp">FIELD ����Ʈ��</button>
</body>
</html>