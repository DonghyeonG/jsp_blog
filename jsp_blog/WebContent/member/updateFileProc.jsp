<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<% 
	String upDir = application.getRealPath("/member/storage");
	String tempDir = application.getRealPath("/member/temp");
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	String id = upload.getParameter("id");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	FileItem fileItem =upload.getFileItem("fname");
	int filesize=(int)fileItem.getSize();
	String fname=null;
	if(filesize>0){
		UploadSave.deleteFile(upDir, oldfile);
		fname=UploadSave.saveFile(fileItem, upDir);
	}
	System.out.println("id: "+id);
	System.out.println("olfile: "+oldfile);
	System.out.println("filesize: "+filesize);
	boolean flag=dao.updateFile(id,fname);
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
function read() {
	var url="read.jsp";
	url+="?id=<%=id%>";
<%-- 	url+="&nowPage=<%=nowPage%>"; --%>
	location.href=url;
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
</h2><br><br>  

<div class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
<%
	if(flag){
		out.print("사진을 변경했습니다.");
	}else{
		out.print("사진변경을 실패했습니다.");
	}
%>
<br><br>
<%if(flag){ %>
  <input type='button' value='내정보보기' onclick="read()" class="btn btn-info">
<%}else{ %>  
  <input type='button' value='다시시도' onclick="history.back()" class="btn btn-warning">
<%}%> 
</DIV>
<br><br><br>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 