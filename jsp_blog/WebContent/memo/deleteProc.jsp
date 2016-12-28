<%@ include file="/ssi/ssi.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<% 	
	String col=request.getParameter("col");
	String nowPage=request.getParameter("nowPage");
	String word=request.getParameter("word");
	int memono=Integer.parseInt(request.getParameter("memono"));
	boolean flag=mdao.delete(memono);
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
<script type="text/javascript">
function mlist() {
	var url="list.jsp";
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-pencil fa-fw w3-margin-right"></i>Memo</button>
</h2><br><br>
<div class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
<%
	if(flag){
		out.println("삭제 완료");
	}else{
		out.println("삭제 실패");
}%><br><br>
<%
	if(flag){%>
		<input type="button" value="목록" onclick="mlist()" class="btn btn-info">
	<% }else{%>
		<input type="button" value="다시시도" onclick="history.back()" class="btn btn-warning">
		<input type="button" value="목록" onclick="mlist()" class="btn btn-info">
<%} %><br><br><br><br>
	
</div>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 