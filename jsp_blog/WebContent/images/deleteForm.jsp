<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%


int no=Integer.parseInt(request.getParameter("no"));


String col=request.getParameter("col");
String word=request.getParameter("word");
String nowPage=request.getParameter("nowPage");


 	String passwd = request.getParameter("passwd");
 	boolean flag = idao.checkRefno(no);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function incheck(f){
if(f.passwd.value==""){
alert("패스워드를 입력하세요");
f.passwd.focus();
return false;
}

}
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}


</style> 
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false" />
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-image fa-fw w3-margin-right"></i>Image</button>
</h2><br>
<div class="container text-center">
<h2 class="text-success">이미지  삭제</h2><br>
<%if(flag){ 
out.print("답변있는 글이므로 삭제 할 수 없습니다.<br>");
out.print("<input type='button' value='다시시도' onclick='history.go(-2)'>");

}else{%>
<form method="post" action="deleteProc.jsp" onsubmit="return incheck(this)" class="form-horizontal">

<input type="hidden" name="no" value="<%=no%>"> 
<input type="hidden" name="col" value="<%=col %>">
<input type="hidden" name="word" value="<%=word %>">
<input type="hidden" name="nowPage" value="<%=nowPage %>">
<input type="hidden" name="oldfile"value="<%=request.getParameter("oldfile")%>">


삭제를 하면 복구 될 수 없습니다.<br>
삭제하시려면 비밀번호를 입력하시고 확인을 눌러주세요<br>
취소는 '목록'버튼을 누르세요.<br><br>

<label>비밀번호: <input type="password" name="passwd" class="" class="form-control" ></label>


<br><br>
<input type="submit" value="삭제" class="btn btn-danger">
<input type="button" value="목록" onclick="location.href='./list.jsp'" class="btn btn-info">




</form>
<%} %>
</div>
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body> 
</html> 