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
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>WINE 등급과 카테고리 저장</title>
</head>
<body>
<% 
 

 
	String dbName="project";
	String jdbcDriver="jdbc:mariadb://localhost:3306/project";
	String dbUser="root";
	String dbPass="asdf";
	
	Connection conn=null;
	Statement stmt=null;


	
	
	
	String category_query1="insert into winecategory (category_ID, title, standard_price) select'red', 'red wine', 10 from dual where not exists(select * from winecategory where category_ID='red' and title= 'red wine' and standard_price= 10)";	
	String category_query2="insert into winecategory (category_ID, title, standard_price) select'white', 'white wine', 10 from dual where not exists(select * from winecategory where category_ID='white' and title= 'white wine' and standard_price= 10)";
	String category_query3="insert into winecategory (category_ID, title, standard_price) select'blush', 'blush wine', 14 from dual where not exists(select * from winecategory where category_ID='blush' and title= 'blush wine' and standard_price= 14)";
	String category_query4="insert into winecategory (category_ID, title, standard_price) select'sparkling', 'sparkling wine', 20 from dual where not exists(select * from winecategory where category_ID='sparkling' and title= 'sparkling wine' and standard_price= 20)";
	
	String grade_query1="insert into winegrade (grade_ID, title, ratio) select'first', '1st grade', 2.0 from dual where not exists(select * from winegrade where grade_ID='first' and title= '1st grade' and ratio= 2.0)";	
	String grade_query2="insert into winegrade (grade_ID, title, ratio) select'second', '2nd grade', 1.0 from dual where not exists(select * from winegrade where grade_ID='second' and title= '2nd grade' and ratio= 1.0)";	
	String grade_query3="insert into winegrade (grade_ID, title, ratio) select'third', '3rd grade', 0.5 from dual where not exists(select * from winegrade where grade_ID='third' and title= '3rd grade' and ratio= 0.5)";

	
	try {
		
		String driver="org.mariadb.jdbc.Driver";
		Class.forName(driver);
		
		
		conn=DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
		stmt=conn.createStatement();
		
		stmt.executeUpdate(category_query1);
		stmt.executeUpdate(category_query2);
		stmt.executeUpdate(category_query3);
		stmt.executeUpdate(category_query4);
		stmt.executeUpdate(grade_query1);
		stmt.executeUpdate(grade_query2);
		stmt.executeUpdate(grade_query3);
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	out.println("<script>alert('카테고리와 등급을 생성했습니다.');  location.href='MAIN.jsp';</script>");
%>
</body>
</html>