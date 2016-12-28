<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="team.TeamDTO"/>
<% 
	String upDir=application.getRealPath("/team/storage");
	String tempDir=application.getRealPath("/team/storage");
	
	UploadSave upload=new UploadSave(request,-1,-1,tempDir);
	
	//form의 값을 가져옵니다.
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setGender(UploadSave.encode(upload.getParameter("gender")));
	dto.setPhone(upload.getParameter("phone"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setHobby(UploadSave.encode(upload.getParameter("hobby")));
	dto.setSkill((upload.getParameterValues("skill")));
	
	//filename 가져오기
	FileItem fileItem=upload.getFileItem("filename");
	int filesize=(int)fileItem.getSize();
	String filename=null;
	if(filesize>0)
		filename=UploadSave.saveFile(fileItem, upDir);
	else
		filename="member.jpg";
	
	dto.setFilename(filename);
	
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
div{
	text-align: center;
	margin-top:100px;
}
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<!-- <DIV class="title">게시판 목록</DIV> -->
<% if(tdao.create(dto))
	out.println("등록 했습니다.");
	else
	out.println("등록 실패했습니다.");%>
	<br>
	<input type="button" value="계속 등록" onclick="location.href='./teamTable.html'">
	<input type="button" value="목록" onclick="location.href='./list.jsp'">


</body> 
<jsp:include page="/menu/bottom.jsp" flush="false"/> 
</html> 