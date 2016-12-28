<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<% 
	//--업로드용 변수 선언(폴더명)
	String upDir="/test/storage";
	String tempDir="/test/temp";	
	upDir=application.getRealPath(upDir);  //절대 경로 반환
	tempDir=application.getRealPath(tempDir);
	
	UploadSave upload= (UploadSave)request.getAttribute("upload");
	//form값을 받는다.
	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setTel(upload.getParameter("tel"));
	dto.setEmail(UploadSave.encode(upload.getParameter("email")));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setJob(UploadSave.encode(upload.getParameter("job")));
	//form의 선택한 파일
	FileItem fileItem=upload.getFileItem("fname");
	int filesize=(int)fileItem.getSize();
	String fname=null;
	if(filesize>0){
		fname=UploadSave.saveFile(fileItem, upDir);
	}else
		fname="member.jpg";
	dto.setFname(fname);
	
	boolean flag=dao.create(dto);
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
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-user fa-fw w3-margin-right"></i>Create account</button>
</h2><br><br> 
<DIV class="title"></DIV>
<div class="content">
<% if(flag) {
	out.print("회원가입을 했습니다.");
}else{
	out.print("회원가입을 실패했습니다.");
} %>
</div>
<br><br>
<DIV class='bottom'>
<%if(flag){ %>
   <input type='button' value='로그인' onclick="location.href='loginForm.jsp'">
   <input type='button' value='홈' onclick="location.href='../index.jsp'">
<%}else{ %>
   <input type='button' value='다시시도' onclick="history.back()">
   <input type='button' value='홈' onclick="location.href='../index.jsp'">
<%}%>
</DIV><br><br><br>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 