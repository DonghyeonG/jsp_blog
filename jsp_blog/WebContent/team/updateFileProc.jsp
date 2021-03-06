<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
	String upDir=application.getRealPath("/team/storage");
	String tempDir=application.getRealPath("/team/temp");
	UploadSave upload=new UploadSave(request,-1,-1,tempDir);
	
	String nowPage=upload.getParameter("nowPage");
	String col=upload.getParameter("col");
	String word=UploadSave.encode(upload.getParameter("word"));
	String oldfile=UploadSave.encode(upload.getParameter("oldfile"));
	int no=Integer.parseInt(upload.getParameter("no"));
	
	//수정할 사진 받기
	FileItem fileItem=upload.getFileItem("filename");
	int filesize=(int)fileItem.getSize();
	String filename=null;
	if(filesize>0){
		filename=UploadSave.saveFile(fileItem, upDir);
		UploadSave.deleteFile(upDir, oldfile);
	}
	Map map=new HashMap();
	map.put("no", no);
	map.put("filename", filename);
	boolean flag=tdao.updateFile(map);
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
function tread() {
	var url="read.jsp";
	url+="?no=<%=no%>"; 
	url+="&col=<%=col%>"; 
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진변경</DIV>
<div class="content">
<%
	if(flag)
		out.print("사진을 변경했습니다.");
	else		
		out.print("사진 변경을 실패했습니다.");
	
%>
</div>
 


 <DIV class='bottom'>
 <%if(flag) {%>
    <input type='button' value='조회' onclick="tread()">
 <%}else{ %>   
    <input type='button' value='조회' onclick="tread()">
    <input type='button' value='다시시도' onclick="history.back()">
 <%} %>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 