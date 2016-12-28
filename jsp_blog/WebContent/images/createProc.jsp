<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="images.ImagesDTO"/>
<%  

String tempDir = application.getRealPath("/images/temp");
String upDir = application.getRealPath("/images/storage");

UploadSave upload = new UploadSave(request,-1,-1,tempDir);

dto.setWname(UploadSave.encode(upload.getParameter("wname")));
dto.setTitle(UploadSave.encode(upload.getParameter("title")));
dto.setContent(UploadSave.encode(upload.getParameter("content")));
dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

FileItem fileItem = upload.getFileItem("fname");
int size = (int)fileItem.getSize();
String fname = null;
if(size>0) fname = upload.saveFile(fileItem, upDir);

dto.setFname(fname);

boolean flag = idao.create(dto);

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
<jsp:include page="/menu/top.jsp" flush="false" />
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-image fa-fw w3-margin-right"></i>Image</button>
</h2><br><br> 
<div class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
<% 
if(flag){
out.print("등록성공");
}else{
out.print("등록실패");
}

%>

<br><br>
<% if(flag){ %>
    <input type="button" value='새로운 사진등록' onclick="location.href='./createForm.jsp'" class="btn btn-primary">
    <input type='button' value='목록' onclick="location.href='./list.jsp'" class="btn btn-info">
  <% }else{ %>
    <input type="button" value='다시시도' onclick="history.back()" class="btn btn-warning">
    <input type='button' value='목록' onclick="location.href='./list.jsp'" class="btn btn-info">
  <% } %>
</div><br><br>
<br>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html> 