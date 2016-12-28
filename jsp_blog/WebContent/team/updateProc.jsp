<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="team.TeamDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	String nowPage=request.getParameter("nowPage");
	String col=request.getParameter("col");
	String word=request.getParameter("word");
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
function tlist() {
	var url="list.jsp";
	url+="?col=<%=col%>"; 
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}</script> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<!-- <DIV class="title">게시판 목록</DIV> -->
<div class="bottom">
	<%
		if(tdao.update(dto))
			out.println("수정 완료");
		else 
			out.println("수정 실패");
	%><br><br>
	<input type="button" value="목록" onclick="tlist()">
</div>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 