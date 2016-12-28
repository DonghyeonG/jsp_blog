<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<%	
	String upDir=application.getRealPath("/bbs/storage");
	String tempDir=application.getRealPath("/bbs/temp");
	UploadSave upload=new UploadSave(request,-1,-1,tempDir);
	
	//페이징과 검색을 위한 값
	String nowPage=upload.getParameter("nowPage");	
	String col=UploadSave.encode(upload.getParameter("col"));	//영어라서 encode 안써도 되긴함 !
	String word=UploadSave.encode(upload.getParameter("word"));
	//답변을 위한 부모의 값
	int grpno=Integer.parseInt(upload.getParameter("grpno"));
	int indent=Integer.parseInt(upload.getParameter("indent"));
	int ansnum=Integer.parseInt(upload.getParameter("ansnum"));
	//부모글 삭제를 제한하기 위해서	
	int bbsno=Integer.parseInt(upload.getParameter("bbsno"));
	//form의 입력된 갑가져오기
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	dto.setGrpno(grpno);
	dto.setIndent(indent);
	dto.setAnsnum(ansnum);
	dto.setBbsno(bbsno);
	//filename 가져오기
	FileItem fileItem=upload.getFileItem("filename");
	int filesize=(int)fileItem.getSize();
	String filename=null;
	if(filesize>0){
		filename=UploadSave.saveFile(fileItem, upDir);
	}
	dto.setFilename(filename);
	dto.setFilesize(filesize);
		
	/*테스트영역*/
	System.out.println("이름:"+UploadSave.encode(upload.getParameter("wname")));
	System.out.println("제목:"+UploadSave.encode(upload.getParameter("title")));
	System.out.println("내용:"+UploadSave.encode(upload.getParameter("content")));
	System.out.println("비밀번호:"+UploadSave.encode(upload.getParameter("passwd")));
	System.out.println("grp:"+grpno);
	System.out.println("indent:"+indent);	
	System.out.println("ansnum:"+ansnum);
	System.out.println("bbsno:"+bbsno);
	System.out.println("파일명:"+filename);
	System.out.println("파일사이즈:"+filesize);
	/*테스트영역*/
	Map map=new HashMap();
	map.put("grpno",dto.getGrpno());
	map.put("ansnum",dto.getAnsnum());
	bdao.upAnsnum(map);  //미리 ansnum+1 해주고
	boolean flag=bdao.createReply(dto); //새로운 답변 grpno는 동일, ansnum=1, 	
	
	
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
function breply(bbsno) {
	var url="replyForm.jsp";
	url+="?bbsno="+bbsno;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
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
		out.print("답변글이 등록되었습니다.");
	else
		out.print("답변글 등록을 실패하셨습니다.");
%>

<br><br> 
<%if(flag){ %>
    <input type='button' value='계속 등록' onclick="breply('<%=bbsno %>')" class="btn btn-primary">
    <input type='button' value='목록' onclick="blist()" class="btn btn-info">
 <%}else{ %> 
    <input type='button' value='다시쓰기' onclick="history.back()" class="btn btn-warning">
    <input type='button' value='목록' onclick="blist()"class="btn btn-info">
 <%} %>
</DIV><br><br>
<br>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 