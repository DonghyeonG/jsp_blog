<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");
	boolean flag=dao.updatePw(id, passwd);
	if(flag){
		session.invalidate();//모든 세션 제거(id, grade);	 	
	 	response.sendRedirect("../index.jsp");//go home !
	}else{
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-user fa-fw w3-margin-right"></i>User Info</button>
</h2><br><br>  
<DIV class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
	out.print("패스워드 변경을 실패했습니다.");
<br><br>  

  <input type='button' value='다시시도' onclick="history.back()" class="btn btn-warning">
  <input type='button' value='홈' onclick="location.href='../index.jsp'"class="btn btn-info">
</DIV><br> 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
<%} %>
</body>
<!-- *********************************************** -->
</html> 