<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ο� Vineyard ���� �Է�</title>
</head>
<body>

	<form action="VINEYARD_RESULT.jsp" method="post">
		<table border="1">
		<tr>
		<td colspan = "3">���ο� VINEYARD�� ���� �Է�</td>
		</tr>
		<tr>
			<td><label>VINEYARD ID </label></td><td><input name="vineyard_id" type="text" required="required"/></td>
		</tr>
		<tr>
			<td><label>������ </label></td><td><input name="owner" type="text" required="required"/></td>
		</tr>
		<tr>
			<td><label>�ּ� </label></td><td><input name="address" type="text" required="required"></td>
		</tr>
		<tr>
			<td><label>����ó </label></td><td><input name="tel_number" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required="required"/></td>
		</tr>
		
		<tr>
			<td><label>�ڱ�(����) </label></td><td><input name="money" type="number" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" required="required"/></td>
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
		<td colspan = "3">������ FIELD�� ID �Է�</td>
		</tr>
		<tr>
			<td><label>FIELD ID </label></td><td><input name="field_id" type="text" required="required"/></td>
		</tr>
		</table>
		<button type="submit">Ȯ��</button>
		<button type="reset">�ʱ�ȭ</button>
		<button type="button" onclick=location.href="MAIN.jsp">��������</button>
	</form>
</body>
</html>