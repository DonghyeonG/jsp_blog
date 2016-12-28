<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	ImagesDTO dto = idao.read(no);
	String mname=(String)session.getAttribute("mname");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Images - updateForm</title>
<script type="text/javascript">
function inputCheck(f) {
if (f.wname.value == "") {
alert("이름이 없음");
f.wname.focus();
return false;
}
if (f.title.value == "") {
alert("제목이 없음");
f.title.focus();
return false;
}
if (f.content.value == "") {
alert("내용이 없음");
f.content.focus();
return false;
}
if (f.passwd.value == "") {
alert("암호가 없음");
f.passwd.focus();
return false;
}
if (f.fname.value == "") {
alert("사진이 없음");
f.fname.focus();
return false;
}
}
</script>
<style type="text/css">
* {
font-family: gulim;
font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush="false" />
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-image fa-fw w3-margin-right"></i>Image</button>
</h2><br>
<div class="container">
  <h2 class="text-center text-success">사진 수정</h2><br>
<FORM name='frm' method='POST' action='./updateProc.jsp' enctype="multipart/form-data"class="form-horizontal">
	<input type="hidden" name="wname" value="<%=mname %>">
	<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
	<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
	<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
	<input name="no" value="<%=no%>" type="hidden">
	<input name="col" value="<%=request.getParameter("col")%>" type="hidden">
	<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
	<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">
	<input name="oldfile" value="<%=dto.getFname()%>" type="hidden">
<!--     <div class="form-group"> -->
<!--       <label class="control-label col-sm-2" for="name">성명:</label> -->
<!--       <div class="col-sm-8"> -->
<!--         <input type="text" name="wname" class="form-control" id="name" placeholder="Enter name"> -->
<!--       </div> -->
<!--     </div> -->
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-8">
        <input type="text" name="title" class="form-control" id="title" 
        placeholder="Enter title" value="<%=dto.getTitle() %>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-8">
       <textarea rows="10" cols="45" name="content" class="form-control" id="content" 
       placeholder="Enter content" ><%=dto.getContent() %></textarea> 
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
        <%
		if (dto.getFname() != null) {
		%>
		<%=Utility.checkNull(dto.getFname())%><br>
		<%
		}
		%>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8" style="text-align: center;padding:15px">
        <input type="submit" value="수정" class="btn btn-success">
        <input type="button" value="취소" class="btn btn-warning" onclick=" history.back()">
      </div>
    </div>
  </form>
</div>


<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>