<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="address.AddressDTO"/>
<jsp:setProperty property="*" name="dto"/>
<% //dao.create(dto)
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false"/>
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-address-card fa-fw w3-margin-right"></i>Address</button>
</h2><br><br>
 <DIV class='container text-center'>
 <h2>처리 결과</h2><br>
<%
	if(adao.create(dto))
		out.println("등록 성공");
	else 
		out.println("등록 실패");
%>		
		<br><br>
	<input type='button' value='계속 등록' onclick="location.href='./createForm.jsp'"	class="btn btn-primary">
	<input type='button' value='목록' onclick="location.href='./list.jsp'" class="btn btn-info">	
 </div><br><br><br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 