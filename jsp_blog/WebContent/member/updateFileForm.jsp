<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8");  
 	String root=request.getContextPath();
 	String id=request.getParameter("id");
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
.table th{
	background-color: #808080;
	color:#ffffff;
}
.imgs{
	width:400px;
	height:auto;
}
</style> 
<script type="text/javascript">
function inCheck(f) {
	if(f.fname.value==""){
		alert("사진을 선택하세요.");
		f.fname.focus();
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-user fa-fw w3-margin-right"></i>User Info</button>
</h2><br>
<DIV class="container">
<h2 class="text-center text-success">사진 변경</h2><br>
 
<FORM name='frm' method='POST' action='./updateFileProc.jsp' 
enctype="multipart/form-data" onsubmit="return inCheck(this)">
<input type="hidden" name="id" value="<%=id%>"> 
<input type="hidden" name="oldfile" value="<%=oldfile%>"> 
  <TABLE class="table table-bordered">
    <TR>
      <TH>원본파일</TH>
      <TD>
      <img src="./storage/<%=oldfile %>" class="imgs">
      원본파일명:<%=oldfile %>
      </TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD>
      <input type="file" name="fname" accept=".jpg, .gif, .png">
      </TD>
    </TR>
  </TABLE>
  
  <div class="text-center">
    <input type='submit' value='수정' class="btn btn-success" >
    <input type='button' value='뒤로가기' onclick="history.back()" class="btn btn-warning">
  </div>  
</FORM>
</DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 