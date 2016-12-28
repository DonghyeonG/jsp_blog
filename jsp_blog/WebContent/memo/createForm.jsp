<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
	request.setCharacterEncoding("utf-8"); 
	String root=request.getContextPath();
%> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<script type="text/javascript">
function input(f) {
	if(f.title.value==""){
		alert("제목을 입력하세요.");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요.");
		f.content.focus();
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-pencil fa-fw w3-margin-right"></i>Memo</button>
</h2><br>
<DIV class="container">
<h2 class="text-center text-success">메모 등록</h2><br>
 
<Form name='frm' method='POST' action='./createProc.jsp' onsubmit="return input(this)" class="form-horizontal">
<div class="form-group">
   <label class="control-label col-sm-2" for="title">제목:</label>
   <div class="col-sm-8">
     <input type="text" name="title" class="form-control" id="title" placeholder="Enter title">
   </div>
</div>
<div class="form-group">
  <label class="control-label col-sm-2" for="content">내용:</label>
  <div class="col-sm-8">
   <TEXTAREA name='content' rows='10' cols='30' class="form-control" id="content" placeholder="Enter content"></TEXTAREA>
  </div>
</div> 


 
  <DIV class="text-center" >
    <input type='submit' value='등록' class="btn btn-success">
    <input type="button" value='뒤로가기' class="btn btn-warning">
  </DIV>  
</Form>
</DIV>
 <jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 