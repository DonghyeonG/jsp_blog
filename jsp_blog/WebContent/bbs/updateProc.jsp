<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<%
	//--업로드용 변수 선언(폴더명)
	String upDir="/bbs/storage";
	String tempDir="/bbs/temp";
	//절대경로
	upDir=application.getRealPath(upDir);
	tempDir=application.getRealPath(tempDir);
	UploadSave upload=new UploadSave(request,-1,-1,tempDir);
	
	String nowPage=upload.getParameter("nowPage");	
	String col=UploadSave.encode(upload.getParameter("col"));
	String word=UploadSave.encode(upload.getParameter("word"));
	String oldfile=UploadSave.encode(upload.getParameter("oldfile"));
	int bbsno=Integer.parseInt(upload.getParameter("bbsno"));
	
	dto.setBbsno(bbsno);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	FileItem fileItem=upload.getFileItem("filename");
	int filesize=(int)fileItem.getSize();
	String filename=null;
	if(filesize>0 ||UploadSave.encode(upload.getParameter("filename"))==""){
		UploadSave.deleteFile(upDir, oldfile);
		filename=UploadSave.saveFile(fileItem, upDir);  
	}
	dto.setFilename(filename);
	dto.setFilesize(filesize);
	
	
	
	Map map = new HashMap();
	map.put("bbsno", dto.getBbsno());
	map.put("passwd", dto.getPasswd());
	boolean pflag = bdao.passCheck(map);
	//수정처리
	boolean flag = false;
	if(pflag){
	flag = bdao.update(dto);
	}
 
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
	url+="?col=<%=col%>"; 
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
function read(bbsno) {
	var url="read.jsp";
	url+="?bbsno="+bbsno;
	url+="&col=<%=col%>"; 
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-edit fa-fw w3-margin-right"></i>Bulletin Board</button>
</h2><br><br> 
<div class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
<%
	if(pflag==false){
	out.print("패스워드가 일치하지 않습니다.");
	}else if(flag){
	out.print("글을 변경했습니다.");
	}else{
	out.print("글변경을 실패했습니다.");
	}
%>
<br><br>
<% if(pflag==false){%>
    <input type='submit' value='다시시도' onclick="history.back()" class="btn btn-warning">
    <input type='button' value='목록' onclick="blist()" class="btn btn-info">  
 <%}else{ %>  
    <input type='button' value='글 보기' onclick="read('<%=bbsno%>')" class="btn btn-default">
    <input type='button' value='목록' onclick="blist()" class="btn btn-info">
<%} %>
</DIV><br><br><br>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 