<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 	
	String nowPage=request.getParameter("nowPage");	
	String col=request.getParameter("col");	
	String word=request.getParameter("word");
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	String passwd=request.getParameter("passwd");
	String oldfile=request.getParameter("oldfile");
	
	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);
	boolean pflag = bdao.passCheck(map);
	boolean flag = false;
	
	
	
	if(pflag){
		flag = bdao.delete(bbsno);
		
	}
	if(flag){
		String upDir=application.getRealPath("/bbs/storage");
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
</style>
<script type="text/javascript">
function blist() {
	var url="list.jsp";
	url+="?col=<%=col%>"; 
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}</script> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-edit fa-fw w3-margin-right"></i>Bulletin Board</button>
</h2><br><br> 
<DIV class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
<%
	if(pflag==false)
		out.println("패스워드가 틀렸습니다.");
	else if(flag==true)
	out.println("삭제 완료");
	else if(flag==false)
		out.println("삭제 실패");		
%>
<br><br>
<% if(pflag==false){%>	 
    <input type='button' value='다시시도' onclick="history.back()" class="btn btn-warning">
    <input type='button' value='목록' onclick="blist()" class="btn btn-info">
 <%}else if(flag==true) {%>
    <input type='button' value='목록' onclick="blist()" class="btn btn-info">
</DIV><br><br><br>
 <%} %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 