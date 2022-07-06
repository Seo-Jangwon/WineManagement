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
<title>새로운 FIELD의 정보 제출</title>
</head>
<body>
<%	
	Vector<String> field_id_Vector=new Vector();//field_id들 저장할 벡터
	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;
	
	
	String query1="select field_ID from field ";	
	ResultSet result1=null;//query1의 결과
	
	
		String field_id=request.getParameter("field_id").trim();
		String address=request.getParameter("address").trim();
		int area=Integer.parseInt(request.getParameter("area").trim());
		String variety=request.getParameter("variety").trim();
		String vineyard_id=request.getParameter("vineyard_id");

			//============================================================
			//================DB에 입력=====================================
			//============================================================
			
			//out.println("ok");
		
			
			try {
			
			String driver="org.mariadb.jdbc.Driver";
			Class.forName(driver);
			conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
			stmt=conn.createStatement();
			
			result1=stmt.executeQuery(query1);
			
			while(result1.next()){
				field_id_Vector.add(result1.getString(1));//벡터에 vineyard_id 저장
			
			}
			
			int s_field_id=field_id_Vector.size();//벡터 사이즈 저장
			int field_id_TorF=0;
			
			for(int i=0;i<s_field_id;i++){
				if(field_id_Vector.get(i).equals(field_id)){
					field_id_TorF=1;
				}else{}
		
			}if(field_id_TorF>=1){
				try{
					throw new Exception();
					}
					catch(Exception e){
					out.println("<script>alert('field id가 중복되었습니다'); history.go(-1);</script>");

					}
			}else{
				String Insert_field="insert into field (field_id, address, area, variety, vineyard_id) values('" + field_id + "','" + address + "','" +area + "','" + variety + "','" + vineyard_id + "');";
				stmt.executeUpdate(Insert_field);
				
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


			//out.println("<script>alert(' 입력하신 데이터\\n winery_id : "+winery_id+"\\n owner : "+owner+"\\n address : "+address+"\\n tel_number : "+tel_number+"\\n inv_white : "+inv_white+"\\n inv_red : "+inv_red+"\\n money : "+money+"\\n grade_id : "+grade+"\\n vineyard_id : "+vineyard_id+"\\n 가 정상적으로 데이터베이스에 입력되었습니다.\\n MAIN 페이지로 돌아갑니다.'); location.href='MAIN.jsp';</script>");
			%>
			
			<table border="1">
	<tr>
	<td colspan = "3">전송된 데이터의 내용</td>
	</tr>
	<tr>
		<td><label>FIELD ID </label></td><td><%=field_id%></td>
	</tr>
	<tr>
		<td><label>주소 </label></td><td><%=address%></td>
	</tr>
	<tr>
		<td><label>면적 </label></td><td><%=area%></td>
	</tr>
	<tr>
		<td><label>재배 품종 </label></td><td><%=variety%></td>
	</tr>
	<tr>
		<td><label>VINEYARD ID </label></td><td><%=vineyard_id%></td>
	</tr>
	</table>
			
			
			<%
	
		
		%>
		<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
		<button type="button" onclick=location.href="FIELD_INSERT_NEW.jsp">FIELD 정보 입력으로</button>
		<%
		
		
		%>
</body>
</html>