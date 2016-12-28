<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8");  
 	String root=request.getContextPath();
 	String oldfile=request.getParameter("oldfile");
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
img{
	width:300px;
	height:300px;
} 
</style>
<script type="text/javascript">
function incheck(f) {
	if(f.filename.value==""){
		alert("파일을 선택해주세요")
		return false;
	}else
		alert(aaaa);
	return true;
}
</script> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진 변경</DIV>
 
<FORM name='frm' method='POST' action='./updateFileProc.jsp' 
onsubmit="return incheck(this)"   enctype="multipart/form-data">
<input type="hidden" name="no" value="<%=request.getParameter("no") %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<input type="hidden" name="oldfile" value="<%=oldfile %>">
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD><img src="./storage/<%=oldfile%>">
      원본파일:<%=oldfile %>
      </TD>
    </TR>
    <TR>
      <TH>변경 파일</TH>
      <TD><input type="file" name="filename" accept=".gif, .jpg, .png"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='뒤로가기' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 