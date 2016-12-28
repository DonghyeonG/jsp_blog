<%@ include file="/ssi/ssi.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String nowPage=request.getParameter("nowPage");
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	int no = Integer.parseInt(request.getParameter("no"));
	TeamDTO dto=tdao.read(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

img{
	width:250px;
	height:250px;
	margin-left: auto; 
	margin-right: auto;
	 display: block;

</style>
<script type="text/javascript">
function tupdate(no) {
	var url="updateForm.jsp";
	url+="?no="+no;
	url+="&col=<%=col%>"; 
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
function tlist() {
	var url="list.jsp";
	url+="?col=<%=col%>"; 
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
function imgUpdate() {
	var url="updateFileForm.jsp";
	url+="?no=<%=no%>"; 
	url+="&col=<%=col%>"; 
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	url+="&oldfile=<%=dto.getFilename()%>";
	location.href=url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<DIV class="title">조회</DIV>
	<%
		if (dto!=null) {
	%>
	<table>
		<tr>
			<td colspan="2"><img
				src='./storage/<%=dto.getFilename()%>'>
		</tr>
		<tr>
			<th>이름</th>
			<td>&nbsp;<%=dto.getName()%></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>&nbsp;<%=dto.getGender()%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>&nbsp;<%=dto.getPhone()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>&nbsp;<%=dto.getAddress1()%> ,<%=dto.getAddress2()%>
			<br>&nbsp;<%="("+dto.getZipcode()+")"%></td>
		</tr>
		<tr>
			<th>보유기술</th>
			<td>&nbsp;<%=dto.getSkillstr()%></td>
		</tr>
		<tr>
			<th>취미</th>
			<td>&nbsp;<%=dto.getHobby()%></td>
		</tr>
	</table>
	<%
		}
	%>
<div class="bottom">
<input type="button" value="수정" onclick="tupdate('<%=no%>')">
<input type="button" value="목록" onclick="tlist()">
<input type="button" value="사진변경" onclick="imgUpdate()">
<input type='button' value='다운로드' onclick="location.href='<%=root %>/download?dir=/team/storage&filename=<%=dto.getFilename()%>'">
</div>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>