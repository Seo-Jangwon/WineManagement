<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>새로운 Vineyard 정보 입력</title>
</head>
<body>

	<form action="VINEYARD_RESULT.jsp" method="post">
		<table border="1">
		<tr>
		<td colspan = "3">새로운 VINEYARD의 정보 입력</td>
		</tr>
		<tr>
			<td><label>VINEYARD ID </label></td><td><input name="vineyard_id" type="text" required="required"/></td>
		</tr>
		<tr>
			<td><label>소유자 </label></td><td><input name="owner" type="text" required="required"/></td>
		</tr>
		<tr>
			<td><label>주소 </label></td><td><input name="address" type="text" required="required"></td>
		</tr>
		<tr>
			<td><label>연락처 </label></td><td><input name="tel_number" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required="required"/></td>
		</tr>
		
		<tr>
			<td><label>자금(리라) </label></td><td><input name="money" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required="required"/></td>
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
   			</tr>
		<tr>
		<td colspan = "3">소유할 FIELD의 ID 입력</td>
		</tr>
		<tr>
			<td><label>FIELD ID </label></td><td><input name="field_id" type="text" required="required"/></td>
		</tr>
		</table>
		<button type="submit">확인</button>
		<button type="reset">초기화</button>
		<button type="button" onclick=location.href="MAIN.jsp">메인으로</button>
	</form>
</body>
</html>