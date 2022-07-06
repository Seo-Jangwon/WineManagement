<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Vector" %>
<%@page import="java.lang.Exception" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ο� Vineyard ���� ����</title>
</head>
<body>

	<%	
		Vector<String> field_id_Vector=new Vector();//field_id�� ������ ����
		Vector<String> vineyard_id_Vector=new Vector();//vineyard_id�� ������ ����
	
		String dbName="project";
		String jdbcDriver="jdbc:mariadb://localhost:3306/project";
		String dbUser="root";
		String dbPass="asdf";
		
		
		String query1="select field_ID from field ";	
		String query2="select vineyard_ID from vineyard ";
		
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
			field_id_Vector.add(result1.getString(1));//���Ϳ� field_id ����
		
		}
		
		result2=stmt.executeQuery(query2);
		while(result2.next()){
			vineyard_id_Vector.add(result2.getString(1));//���Ϳ� vineyard_id ����
		
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
		
		
	
			String vineyard_id=request.getParameter("vineyard_id").trim();
			String owner=request.getParameter("owner").trim();
			String address=request.getParameter("address").trim();
			int tel_number=Integer.parseInt(request.getParameter("tel_number").trim());
			//int inv_white=Integer.parseInt(request.getParameter("inv_white").trim());
			//int inv_red=Integer.parseInt(request.getParameter("inv_red").trim());
			int money=Integer.parseInt(request.getParameter("money").trim());
			String field_id=request.getParameter("field_id");

			//vineyard id �ߺ��˻�
			int s_vineyard_id=vineyard_id_Vector.size();//���� ������ ����
			int vineyard_id_TorF=0;
			for(int i=0;i<s_vineyard_id;i++){
				if(vineyard_id_Vector.get(i).equals(vineyard_id)){
					vineyard_id_TorF=1;
				}else{}
			}
			if(vineyard_id_TorF>=1){
				try{
				throw new Exception();
				}
				catch(Exception e){
				out.println("<script>alert('vineyard id�� �ߺ��Ǿ����ϴ�'); history.go(-1);</script>");

				}
			}else{//���� �ߺ��� �������� �ʴ´ٸ�
			
			//field id �ߺ��˻�
			int s_field_id=field_id_Vector.size();//���� ������ ����
			int field_id_TorF=0;
			for(int i=0;i<s_field_id;i++){
				if(field_id_Vector.get(i).equals(field_id)){
					field_id_TorF=1;
				}else{}
			}
			if(field_id_TorF>=1){
				try{
				throw new Exception();
				}
				catch(Exception e){
				out.println("<script>alert('field id�� �ߺ��Ǿ����ϴ�'); history.go(-1);</script>");
				
				}

			}else{//���� �ߺ��� �������� �ʴ´ٸ�
				
				//============================================================
				//================DB�� �Է�=====================================
				//============================================================
				
				//out.println("ok");
				String Insert_vineyard="insert into vineyard (vineyard_ID, owner, address, tel_number, inv_white, inv_red, money) values('" + vineyard_id + "','" + owner + "','" + address + "','" + tel_number + "','" + 0 + "','" + 0 + "','" + money + "');";
				String Insert_field_id="insert into field(field_id, vineyard_id) values('" + field_id + "','" + vineyard_id + "');";
				
				try {
				
				String driver="org.mariadb.jdbc.Driver";
				Class.forName(driver);
				conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
				stmt=conn.createStatement();
				stmt.executeUpdate(Insert_vineyard);
				stmt.executeUpdate(Insert_field_id);

			
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
				try {
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
					}
				}


				//out.println("<script>alert(' �Է��Ͻ� ������\\n vineyard_id : "+vineyard_id+"\\n owner : "+owner+"\\n address : "+address+"\\n tel_number : "+tel_number+"\\n inv_white : "+inv_white+"\\n inv_red : "+inv_red+"\\n money : "+money+"\\n field_id : "+field_id+"\\n �� ���������� �����ͺ��̽��� �ԷµǾ����ϴ�.\\n MAIN �������� ���ư��ϴ�.'); location.href='MAIN.jsp';</script>");
				%>
				
				<table border="1">
		<tr>
		<td colspan = "3">���۵� �������� ����</td>
		</tr>
		<tr>
			<td><label>VINEYARD ID </label></td><td><%=vineyard_id%></td>
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
			<td><label>���� ���� ��� </label></td><td><%=0%></td>
		</tr>
		<tr>
			<td><label>�ڱ�(����) </label></td><td><%=money%></td>
		</tr>
		<tr>
			<td><label>FIELD ID </label></td><td><%=field_id%></td>
		</tr>
		</table>
				
				
				<%
			}
		
			}
			
			%>
			<button type="button" onclick=location.href="MAIN.jsp">��������</button>
			<button type="button" onclick=location.href="VINEYARD_INSERT.jsp">VINEYARD ���� �Է�����</button>
			<%
			
			
			%>
</body>
</html>