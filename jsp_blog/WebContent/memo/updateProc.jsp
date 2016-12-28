<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	String nowPage=request.getParameter("nowPage");
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	boolean flag=mdao.update(dto);	
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
	if(flag)
		out.println("수정 완료");
	else
		out.println("수정 실패");
%><br><br>
<%	if(flag){%>
		<input type="button" value="목록" onclick="mlist()" class="btn btn-info">
	<%}else{ %>
		<input type="button" value="목록" onclick="mlist()" class="btn btn-info">
		<input type="button" value="다시시도" onclick="history.back()" class="btn btn-warning">
<%} %>

</div><br><br><br>
</body> 
<jsp:include page="/menu/bottom.jsp" flush="false"/> 
</html> 
