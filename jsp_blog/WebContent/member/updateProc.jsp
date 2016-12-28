<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	boolean flag=dao.update(dto);
	String id=(String)session.getAttribute("id");
	String grade=(String)session.getAttribute("grade");

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
function read() {
	var url="read.jsp";
	url+="?id=<%=request.getParameter("id")%>";
	url+="&col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
function mlist(nowPage) {
	var url="<%=root%>/admin/list.jsp"
	if(nowPage=="null"){
		location.href=url;		
	}else{
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage="+nowPage;
	
	location.href=url;
	}
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-user fa-fw w3-margin-right"></i>User Info</button>
</h2><br><br>
<div class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
<%
if(flag){
	out.print("정보수정을 했습니다.");
}else{
	out.print("정보수정을 실패했습니다.");
}
%>
<br><br>
	<%if(id!=null && grade.equals("A")){ %>
	<input type="button" value="정보확인" onclick="read()" class="btn btn-info">
	<%}else{ %>
	<input type="button" value="정보확인" onclick="read()" class="btn btn-info">
	<input type="button" value="다시시도" onclick="history.back()" class="btn btn-warning">
	<%} %>
</div><br><br><br>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 