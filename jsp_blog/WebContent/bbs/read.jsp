<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
	String nowPage=request.getParameter("nowPage");
	String col=request.getParameter("col");	
	String word=request.getParameter("word");
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	bdao.upViewcnt(bbsno);
	BbsDTO dto=bdao.read(bbsno);
	
	String content=dto.getContent();
	content=content.replaceAll("\r\n", "<br>");
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
.table th{
	background-color: #5b94d1;
  	border-color: #ffffff; 
 	 color:#ffffff;
 	 border-radius: 4px;
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
function bupdate(bbsno) {
	var url="updateForm.jsp";
	url+="?bbsno="+bbsno;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
// function bdelete() {  파라미터없이 하는것
// 	var url="deleteForm.jsp";	
<%-- 	url+="?bbsno="+<%=bbsno%>;  --%>
<%-- 	url+="&col=<%=col%>"; --%>
<%-- 	url+="&word=<%=word%>"; --%>
<%-- 	url+="&nowPage=<%=nowPage%>"; --%>
<%-- 	url+="&filename=<%=dto.getFilename()%>";	 --%>
// 	location.href=url;
// }
function bdelete(bbsno) {
	var url="deleteForm.jsp";	
	url+="?bbsno="+bbsno;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	url+="&oldfile=<%=dto.getFilename()%>";	
	location.href=url;
}
function breply(bbsno) {
	var url="replyForm.jsp";
	url+="?bbsno="+bbsno;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
function down(filename) {
	var url="<%=root%>/download";
	url+="?dir=/bbs/storage";
	url+="&filename="+filename;
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
</h2><br> 
<div class="container">
<h2 class="text-center text-success">조회 </h2><br>

<TABLE class="table table-bordered">
    <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><%=dto.getContent() %></TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
    <TR>
      <TH>조회수</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
    <TR>
      <TH>등록일</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
    <tr>
      <th>파일</th>
    <td>
    <%if(dto.getFilename()==null) {
    	out.print("파일없음");
    }else{ %>
    	<%=dto.getFilename()%>(<%=dto.getFilesize()/1024 %> KB) 
        <a  href="javascript:down('<%=dto.getFilename()%>')"><span class="glyphicon glyphicon-download-alt"></span></a>
    <%} %>
    </td> 
    </tr>
  </TABLE>
  <br><br>
  <DIV class='text-center'>
    <input type='button' value='등록' onclick="location.href='./createForm.jsp'" class="btn btn-primary">
    <input type='button' value='목록' onclick="blist()" class="btn btn-info">
    <input type='button' value='수정' onclick="bupdate('<%=bbsno%>')" class="btn btn-default">
    <input type='button' value='삭제' onclick="bdelete('<%=bbsno%>')" class="btn btn-danger">
    <input type='button' value='답변' onclick="breply('<%=bbsno%>')" class="btn btn-primary">
 </DIV>  
</div>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 