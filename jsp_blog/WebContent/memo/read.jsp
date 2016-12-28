<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	String nowPage=request.getParameter("nowPage");
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	int memono= Integer.parseInt(request.getParameter("memono"));
	
	MemoDTO dto=mdao.read(memono);
// 	조회수 ++
	mdao.upViewcnt(memono);
// 	조회수++ End
	

// 	조회
	String content="";
	if(dto!=null){  
		content=dto.getContent();
		content = content.replaceAll("\r\n", "<br>"); ///개행 문자 대체.
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
</style> 
<script type="text/javascript">
function mcreate() {
	var url="createForm.jsp";
	location.href=url;
}
</script>
<script type="text/javascript">
function mupdate(memono) {
	var url="updateForm.jsp"
	url+="?memono="+memono;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
</script>
<script type="text/javascript">
function mdelete(memono) {
	var url="deleteForm.jsp";
	url+="?memono="+memono;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
</script>
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
</h2><br>
<DIV class="container">
<h2 class="text-success text-center">조회</h2><br>
<table class="table table-bordered">
	<tr>
		<th>제목</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><%=content%></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=dto.getViewcnt() %></td>
	</tr>
	<tr>
		<th>등록일</th>
		<td><%=dto.getWdate() %></td>
	</tr>
	
</table>
<div class="text-center">
<input type="button" value="등록" onclick="mcreate()" class="btn btn-primary">
<input type="button" value="수정" onclick="mupdate('<%=dto.getMemono()%>')" class="btn btn-default">
<input type="button" value="삭제" onclick="mdelete('<%=dto.getMemono()%>')" class="btn btn-danger">
<input type="button" value="목록" onclick="mlist()" class="btn btn-info">
</div>
</DIV>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 