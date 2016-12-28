<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
	String nowPage= request.getParameter("nowPage");
	String col= request.getParameter("col");
	String word= request.getParameter("word");
	int no=Integer.parseInt(request.getParameter("no")); //dao.delete(no)
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
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-address-card fa-fw w3-margin-right"></i>Address</button>
</h2><br><br>
<div class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
<%
	if(adao.delete(no))
		out.println("삭제 완료");
	else
		out.println("삭제 실패");
%><br><br>
<%	if(adao.delete(no)){%>
			<input type="button" value="목료" onclick="location.href='list.jsp'" class="btn btn-info">
<%}else{ %>		
			<input type="button" value="다시시도" onclick="history.back()" class="btn btn-warning">
			<input type="button" value="목료" onclick="location.href='list.jsp'" class="btn btn-info">
<%} %>	
</div><br><br><br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 