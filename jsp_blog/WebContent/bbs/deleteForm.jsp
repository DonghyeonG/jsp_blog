<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% request.setCharacterEncoding("utf-8");  
 	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
 	boolean flag=bdao.checkRefno(bbsno);
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
function incheck(form) {
	if(form.passwd.value==""){
		alert("패스워드를 입력하세요.");
		form.passwd.focus();
		return false;
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-edit fa-fw w3-margin-right"></i>Bulletin Board</button>
</h2><br> 
<div class="container text-center">
<h2 class="text-success">게시판 글 삭제</h2><br>
<%if(flag) {
	out.print("답변있는 글이므로 삭제할 수 없습니다.<br>");%>
	<input type="button" value="뒤로가기" onclick="history.go(-2)">  
<!-- 	history.go(-2) , 뒤로가기 X 2 -->
<%}else{%>
<FORM name='frm' method='POST' action='./deleteProc.jsp'
onsubmit="return incheck(this)" class="form-horizontal">
<input type="hidden" value="<%=bbsno %>" name="bbsno">
 <input type="hidden" name="col" value="<%=request.getParameter("col")%>" >
 <input type="hidden" name="word" value="<%=request.getParameter("word")%>" >
 <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>" >
 <input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>" >
 
  <div class="form-group">
  <label class="control-label col-sm-4" for="passwd">패스워드:</label>
      <div class="col-sm-4">
        <input type="password" name="passwd" class="form-control" id="passwd" placeholder="Enter passwd">
        <p>삭제하면 복구할 수 없습니다.</p><br>
      </div>
  </div>
    <input type='submit' value='확인' class="btn btn-danger">
    <input type='button' value='취소' onclick="history.back()" class="btn btn-warning">

</FORM>
<%} %>
</div><br><br>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 