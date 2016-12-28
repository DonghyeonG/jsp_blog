<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<% 	
	int memono=Integer.parseInt(request.getParameter("memono"));
	String root=request.getContextPath();
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-pencil fa-fw w3-margin-right"></i>Memo</button>
</h2><br>
<DIV class="container text-center">
<h2 class="text-success">메모 삭제</h2>

	<form name='frm' method="post" action="deleteProc.jsp" onsubmit="return input(this)">
		<input type="hidden" name="memono" value="<%=memono%>">
		<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
		<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
		<div class="content">
			삭제를 하면 복구 될 수 없습니다.<br>
			<br> 삭제하시려면 삭제버튼을 클릭하세요.<br>
			<br> <br>
			 <input type="submit" name="" value="삭제" class="btn btn-danger">
			 <input	type="button" name="" value="취소" onclick="history.back()" class="btn btn-warning">
<!-- 			 <input	type="button" name="" value="목록" onclick="location.href='./list.jsp'"> -->
		</div>
	</form>
</DIV>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 