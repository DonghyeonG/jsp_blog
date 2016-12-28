<%@page import="javax.print.DocFlavor.STRING"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%   
 	String upDir="/member/storage";
	String tempDir="/member/temp";	
	upDir=application.getRealPath(upDir);  //절대 경로 반환
	tempDir=application.getRealPath(tempDir);
	
	UploadSave upload= new UploadSave(request,-1,-1,tempDir);
	//form값을 받는다.
	String id=(UploadSave.encode(upload.getParameter("id")));
	String email=(UploadSave.encode(upload.getParameter("email")));
	String str="";
	if(dao.duplicateId(id)){
		str="중복된 아이디입니다. 중복 확인해주세요.";
	}else if(dao.duplicateEmail(email)){
		str="중복된 이메일입니다. 중복 확인해주세요.";
	}else{
		//createProc.jsp 로 이동
		request.setAttribute("upload", upload);  // upload라는 이름으로,upload객체,   객체를 저장 (request가 유지되는 동안에 사용가능)
%>		
	<jsp:forward page="/member/createProc.jsp"/>
<% }%>
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
 
<DIV class="title">아이디,이메일 중복확인</DIV>
 <div class="content">
 <%=str %>
 </div>

  
 <DIV class='bottom'>
   <input type='button' value='다시시도' onclick="history.back()">
 </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 