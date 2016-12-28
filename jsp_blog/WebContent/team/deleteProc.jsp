<%@ include file="/ssi/ssi.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%
	String oldfile=request.getParameter("oldfile");
	String nowPage=request.getParameter("nowPage");
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	int no=Integer.parseInt(request.getParameter("no"));
	boolean flag=tdao.delete(no);
	if(flag){
		String upDir=application.getRealPath("/team/storage");
		UploadSave.deleteFile(upDir, oldfile);
	}
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
div{
	text-align: center;
	margin-top:20px;
	margin-bottom: 20px;
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
	<div>
		<%
			if(flag)
				out.println("삭제 완료");
			else
				out.println("삭제 실패");
		%>
		<br><input type="button" value="목록" onclick="tlist()">
	</div>
<jsp:include page="/menu/bottom.jsp" flush="false"/> 
</body> 
</html> 