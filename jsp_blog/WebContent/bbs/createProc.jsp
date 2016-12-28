<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!-- useBean 기본 객체생성.. -->
<jsp:useBean id="dto" class="bbs.BbsDTO"/>

<%	
//--업로드용 변수 선언(폴더명)
	String upDir="/bbs/storage";
	String tempDir="/bbs/temp";
	//절대경로
	upDir=application.getRealPath(upDir);  //절대 경로 반환
	tempDir=application.getRealPath(tempDir);
	
	UploadSave upload=new UploadSave(request,-1,-1,tempDir);
// 	UploadSave.encode() is static Method;
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	FileItem fileItem=upload.getFileItem("filename");
	int filesize=(int)fileItem.getSize();
	String filename=null;
	if(filesize>0)
	filename=UploadSave.saveFile(fileItem, upDir);
	
	dto.setFilesize(filesize);
	dto.setFilename(filename);
 	boolean flag=bdao.create(dto);
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
function blist() {
	var url="list.jsp";
	location.href=url;
}</script> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-edit fa-fw w3-margin-right"></i>Bulletin Board</button>
</h2><br><br>
<DIV class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
<%
	if(flag)
		out.print("글이 등록되었습니다.");
	else
		out.print("글 등록 실패하셨습니다.");
%>
<br><br>
<%if(flag){ %> 
    <input type='button' value='계속 등록' onclick="location.href='./createForm.jsp'" class="btn btn-primary" >
    <input type='button' value='목록' onclick="blist()" class="btn btn-info">
<%}else{ %>    
  	<input type='button' value='뒤로가기' onclick="history.back()" class="btn btn-warning">
    <input type='button' value='목록' onclick="blist()" class="btn btn-info">
<%} %>  
  </DIV><br><br><br>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 