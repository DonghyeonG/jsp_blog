<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	String mname=(String)session.getAttribute("mname"); 
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>



<script type="text/javascript">

function inputCheck(f) {
if(f.wname.value==""){
alert("이름을 입력하세요.");
f.wname.focus();
return false;
}

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

if(f.passwd.value==""){
alert("비밀번호 확인을 입력하세요.");
f.password.focus();
return false;
}

if(f.repasswd.value==""){
alert("비밀번호 확인을 입력하세요.");
f.repasswd.focus();
return false;
}

if(f.passwd.value!=f.repasswd.value){
alert("비밀번호가 일치하지 않습니다.");
f.passwd.focus();
return false;
}


if(f.fname.value==""){
alert("사진을 등록하세요.");
f.fname.focus();
return false;
}

}	

</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 

table{
margin: 0 auto;
border-collapse: collapse;

}

table, th, td{
border: 1px solid black;
}

.title{
text-align: center;
}

th, td{
text-align: left;
}

.div{
text-align: center;
}
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false" />
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-image fa-fw w3-margin-right"></i>Image</button>
</h2><br>
<div class="container">
  <h2 class="text-center text-success">사진 등록</h2>
<FORM name='frm' method='POST' action='./createProc.jsp' enctype="multipart/form-data"class="form-horizontal">
<input type="hidden" name="wname" value="<%=mname %>">
<!--     <div class="form-group"> -->
<!--       <label class="control-label col-sm-2" for="name">성명:</label> -->
<!--       <div class="col-sm-8"> -->
<!--         <input type="text" name="wname" class="form-control" id="name" placeholder="Enter name"> -->
<!--       </div> -->
<!--     </div> -->
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-8">
        <input type="text" name="title" class="form-control" id="title" placeholder="Enter title">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-8">
       <textarea rows="10" cols="45" name="content" class="form-control" id="content" 
       placeholder="Enter content" ></textarea> 
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-8">          
        <input type="password" name="passwd" class="form-control" id="pwd" placeholder="Enter password">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="file">파일:</label>
      <div class="col-sm-8">          
        <input type="file" name="fname" class="form-control" id="file" placeholder="Select File">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8" style="text-align: center;padding:15px">
        <input type="submit" value="등록" class="btn btn-success">
        <input type="button" value="취소" class="btn btn-warning" onclick=" history.back()">
      </div>
    </div>
  </form>
</div>
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>

</html> 