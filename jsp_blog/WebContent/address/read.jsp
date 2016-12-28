<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 

<%
	String nowPage= request.getParameter("nowPage");
	String col= request.getParameter("col");
	String word= request.getParameter("word");
	int no= Integer.parseInt(request.getParameter("no"));
	AddressDTO dto=adao.read(no);
	
	if(dto!=null){ //Null 아닐 떄 실행
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
function adelete(no) {
	if(confirm("삭제하시겠습니까?")){
		var url="deleteProc.jsp";
		url+="?no="+no;
		url+="&col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		location.href=url;
	}
}
function aupdate(no) {	
	var url="updateForm.jsp";
	url+="?no="+no;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;		
}
function alist() {	
	var url="list.jsp";
	url+="?col=<%=col%>";
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-address-card fa-fw w3-margin-right"></i>Address</button>
</h2><br> 
<DIV class="container">
<h2 class="text-center text-success">조회</h2><br>
	<table class="table table-bordered">
		<tr>
			<th>이름</th>
			<td><%=dto.getName() %></td>
		</tr>	
		<tr>
			<th>전화</th>
			<td><%=dto.getPhone() %></td>
		</tr>	
		<tr>
			<th>우편번호</th>
			<td><%=dto.getZipcode() %></td>
		</tr>	
		<tr>
			<th>주소<br>(우편번호)</th>
			<td><%=dto.getAddress1() %>&nbsp;,<%=dto.getAddress2() %>
			<br>&nbsp;(<%=dto.getZipcode()%>)</td>
		</tr>	
		<tr>
			<th>등록일</th>
			<td><%=dto.getWdate() %></td>
		</tr>	
	</table>
	<br>
<div class="text-center">
	<input type="button" value="수정" onclick="aupdate(<%=no%>)" class="btn btn-default">
	<input type="button" value="삭제" onclick="adelete(<%=no%>)" class="btn btn-danger">
	<input type="button" value="목록" onclick="alist()" class="btn btn-info">
</div>
</DIV>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 
<%} %>