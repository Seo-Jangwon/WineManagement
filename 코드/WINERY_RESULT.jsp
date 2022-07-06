<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Vector" %>
<%@page import="java.lang.Exception" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>���ο� WINERY ���� ����</title>
</head>
<body>

	<%	
	Vector<String> vineyard_id_Vector=new Vector();//vineyard_id�� ������ ����
	Vector<String> winery_id_Vector=new Vector();//winery_id�� ������ ����

	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	
	String query1="select vineyard_ID from vineyard ";	
	String query2="select winery_id from winery ";
	
	Connection conn=null;
	Statement stmt=null;
	
	
	ResultSet result1=null;//query1�� ���
	ResultSet result2=null;//query2�� ���
	
	
	try {
		
	String driver="org.mariadb.jdbc.Driver";
	Class.forName(driver);
	conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
	stmt=conn.createStatement();
	result1=stmt.executeQuery(query1);
	
	while(result1.next()){
		vineyard_id_Vector.add(result1.getString(1));//���Ϳ� vineyard_id ����
	
	}
	
	result2=stmt.executeQuery(query2);
	while(result2.next()){
		winery_id_Vector.add(result2.getString(1));//���Ϳ� winery_id ����
	
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
	
	

		String winery_id=request.getParameter("winery_id").trim();
		String owner=request.getParameter("owner").trim();
		String address=request.getParameter("address").trim();
		int tel_number=Integer.parseInt(request.getParameter("tel_number").trim());
		//int inv_white=Integer.parseInt(request.getParameter("inv_white").trim());
		//int inv_red=Integer.parseInt(request.getParameter("inv_red").trim());
		int money=Integer.parseInt(request.getParameter("money").trim());
		String grade=request.getParameter("grade_id").trim();
		String vineyard_id=request.getParameter("vineyard_id");

		//winery id �ߺ��˻�
		int s_winery_id=winery_id_Vector.size();//���� ������ ����
		int winery_id_TorF=0;
		for(int i=0;i<s_winery_id;i++){
			if(winery_id_Vector.get(i).equals(winery_id)){
				winery_id_TorF=1;
				
			}else{}
		}
		if(winery_id_TorF>=1){
			try{
			throw new Exception();
			}
			catch(Exception e){
			out.println("<script>alert('winery id�� �ߺ��Ǿ����ϴ�'); history.go(-1);</script>");

			}
		}else{//���� �ߺ��� �������� �ʴ´ٸ�
		
		//vineyard id �ߺ��˻�
		int s_vineyard_id=vineyard_id_Vector.size();//���� ������ ����
		int vineyard_id_TorF=0;
		for(int i=0;i<s_vineyard_id;i++){
			if(vineyard_id_Vector.get(i).equals(vineyard_id)){
				vineyard_id_TorF=1;
			}else{}
		}
		if(vineyard_id_TorF==0){
			try{
			throw new Exception();
			}
			catch(Exception e){
			out.println("<script>alert('�ŷ��Ϸ��� vineyard�� �����ϴ�'); history.go(-1);</script>");
			
			}

		}else{//���� �ߺ��� �������� �ʴ´ٸ�
			
			//============================================================
			//================DB�� �Է�=====================================
			//============================================================
			
			//out.println("ok");
		
			String inv_id_red=winery_id.concat("_red");
			String inv_id_white=winery_id.concat("_white");
			String inv_id_blush=winery_id.concat("_blush");
			String inv_id_sparkling=winery_id.concat("_sparkling");
		
			String Insert_winery="insert into winery (winery_id, owner, address, tel_number, inv_white, inv_red, money, grade_ID, vineyard_id) values('" + winery_id + "','" + owner + "','" + address + "','" + tel_number + "','" + 0 + "','" + 0 + "','" +money + "','" + grade + "','" + vineyard_id + "');";
			
			String add_inventory_red="insert into wineinventory(wi_id, category_id, amount, winery_id)values('" + inv_id_red + "','red','0','" + winery_id + "');";
			String add_inventory_white="insert into wineinventory(wi_id, category_id, amount, winery_id)values('" + inv_id_white + "','white','0','" + winery_id + "');";
			String add_inventory_blush="insert into wineinventory(wi_id, category_id, amount, winery_id)values('" + inv_id_blush + "','blush','0','" + winery_id + "');";
			String add_inventory_sparkling="insert into wineinventory(wi_id, category_id, amount, winery_id)values('" + inv_id_sparkling + "','sparkling','0','" + winery_id + "');";
			
			try {
			
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			stmt.executeUpdate(Insert_winery);
			stmt.executeUpdate(add_inventory_red);
			stmt.executeUpdate(add_inventory_white);
			stmt.executeUpdate(add_inventory_blush);
			stmt.executeUpdate(add_inventory_sparkling);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
			try {
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
				}
			}


			//out.println("<script>alert(' �Է��Ͻ� ������\\n winery_id : "+winery_id+"\\n owner : "+owner+"\\n address : "+address+"\\n tel_number : "+tel_number+"\\n inv_white : "+inv_white+"\\n inv_red : "+inv_red+"\\n money : "+money+"\\n grade_id : "+grade+"\\n vineyard_id : "+vineyard_id+"\\n �� ���������� �����ͺ��̽��� �ԷµǾ����ϴ�.\\n MAIN �������� ���ư��ϴ�.'); location.href='MAIN.jsp';</script>");
			%>
			
			<table border="1">
	<tr>
	<td colspan = "3">���۵� �������� ����</td>
	</tr>
	<tr>
		<td><label>WINERY ID </label></td><td><%=winery_id%></td>
	</tr>
	<tr>
		<td><label>������ </label></td><td><%=owner%></td>
	</tr>
	<tr>
		<td><label>�ּ� </label></td><td><%=address%></td>
	</tr>
	<tr>
		<td><label>����ó </label></td><td><%=tel_number%></td>
	</tr>
	<tr>
		<td><label>ȭ��Ʈ ���� ��� </label></td><td><%=0%></td>
	</tr>
	<tr>
		<td><label>���� ���� ���</label></td><td><%=0%></td>
	</tr>
	<tr>
		<td><label>�ڱ�(����) </label></td><td><%=money%></td>
	</tr>
		<tr>
		<td><label>��� </label></td><td><%=grade%></td>
	</tr>
	<tr>
		<td><label>VINEYARD ID </label></td><td><%=vineyard_id%></td>
	</tr>
	</table>
			
			
			<%
		}
	
		}
		
		%>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>
		<button type="button" onclick=location.href="WINERY_INSERT.jsp">WINERY ���� �Է�����</button>
		<%
		
		
		%>
</body>
</html>