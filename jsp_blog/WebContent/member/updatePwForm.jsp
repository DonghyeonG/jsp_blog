<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8");  
 	String root=request.getContextPath();
 	String id=request.getParameter("id");
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
function inCheck(f) {
	if(f.passwd.value==""){
		alert("비밀번호를 입력해주세요");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("비밀번호를 입력해주세요");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value!=f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다.");
		f.passwd.focus();
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
<h2 class="text-center text-success">패스워드 변경</h2><br>
 
<FORM name='frm' method='POST' action='./updatePwProc.jsp' 
onsubmit="return inCheck(this)" class="form-horizontal">
<input type="hidden" name="id" value="<%=id %>">
  <div class="form-group">
      <label class="control-label col-sm-4" for="passwd">비밀번호:</label>
      <div class="col-sm-5">
        <input type="password" name="passwd" class="form-control" id="passwd" placeholder="Enter password">
      </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-4" for="repasswd">비밀번호확인:</label>
      <div class="col-sm-5">
        <input type="password" name="repasswd" class="form-control" id="repasswd" placeholder="Enter password">
      </div>
    </div>
  	<br><br>
 	<div class="text-center">
	    <input type='submit' value='패스워드 수정' class="btn btn-success">
	    <input type='button' value='뒤로가기' onclick="history.back()" class="btn btn-warning">
	</div>
	<br>    
</FORM>
</DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 