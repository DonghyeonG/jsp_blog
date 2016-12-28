<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="images.ImagesDTO"/>
<%
	String upDir = application.getRealPath("/images/storage");
	String tempDir = application.getRealPath("/images/temp");
	
	// beans
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	// paging
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String nowPage = upload.getParameter("nowPage");
	
	// 답변을 위한 부모 값
	dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
	dto.setIndent(Integer.parseInt(upload.getParameter("indent")));
	dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));
	
	// 부모글 삭제 확인
	dto.setNo(Integer.parseInt(upload.getParameter("no")));
	
	// form의 입력된 값 가져오기
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	// filename 가져오기
	FileItem fileItem = upload.getFileItem("fname");
	int filesize = (int)fileItem.getSize();
	String fname = null;
	if(filesize>0) fname = UploadSave.saveFile(fileItem, upDir);
	
	dto.setFname(fname);
	
	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	idao.upAnsnum(map);
	
	boolean flag = idao.createReply(dto);
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
function blist(){
	var url = "list.jsp";
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;
}
</script>
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-image fa-fw w3-margin-right"></i>Image</button>
</h2><br><br>
<DIV class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
<% 
	if(flag){
		out.println("답변 등록 완료");
	}else{
		out.println("답변 등록 실패");
	}
%>
<br><br>
<% 	if(flag){%>
		<input type='button' value='목록' onclick="blist()" class="btn btn-info">
<%}else{ %>		
		<input type='button' value='다시시도' onclick="history.back()" class="btn btn-warning">
		<input type='button' value='목록' onclick="blist()" class="btn btn-info">
<%} %>
 	
 	
 </DIV><br><br><br>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

