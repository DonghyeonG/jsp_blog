<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%   
	String id=request.getParameter("id");
	String grade=(String)session.getAttribute("grade");
	if(id==null){
		id=(String)session.getAttribute("id");
	}
 	MemberDTO dto=dao.read(id);
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
img#im{
	width:auto;
	height:200px;
	margin-left: auto; 
	margin-right: auto;
	 display: block;
}
th{
	background-color: #808080;
	color:#ffffff;
}
</style> 
<script type="text/javascript">
function updateFile() {
	var url="updateFileForm.jsp"
	url+="?id=<%=id%>";
	url+="&oldfile=<%=dto.getFname()%>";
	location.href=url;
}
function updatePw() {
	var url="updatePwForm.jsp"
	url+="?id=<%=id%>";
	location.href=url;
}
function update() {
	var url="updateForm.jsp"
	url+="?id=<%=id%>";
	url+="&col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
function mlist() {
	var url="<%=root%>/admin/list.jsp"
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
}
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-user fa-fw w3-margin-right"></i>User Info</button>
</h2><br>
<div class="container"> 
<h2 class="text-center text-success"><%=dto.getMname() %>'s Info</h2>
<br>  

<table class="table table-bordered">
  <tr>
    <td colspan="2">
    <img id="im" src="./storage/<%=dto.getFname() %>">
    </td>
  </tr>
  <tr>
    <th>아이디</th>
    <td><%=dto.getId() %></td>
  </tr>
  <tr>
    <th>이름</th>
    <td><%=dto.getMname()%></td>
  </tr>
  <tr>
    <th>전화번호</th>
    <td><%=dto.getTel()%></td>
  </tr>
  <tr>
    <th>이메일</th>
    <td><%=dto.getEmail()%></td>
  </tr>
  <tr>
    <th>주소</th>
    <td><%=dto.getAddress1()%>,&nbsp;<%=Utility.checkNull(dto.getAddress2())%></td>
  </tr>
  <tr>
    <th>우편번호</th>
    <td><%=dto.getZipcode() %></td>
  </tr>
  <tr>
    <th>직업</th>
    <td><%=Utility.getCodeValue(dto.getJob()) %>
    </td>
  </tr>
  <tr>
    <th>날짜</th>
    <td><%=dto.getMdate() %></td>
  </tr>
</TABLE>
  
  <DIV class='text-center'>
    <input type="button" value='정보수정' onclick="update()" class="btn btn-default">
    <%if(id!=null &&grade.equals("A")){%>
        <input type="button" value='목록' onclick="mlist()" class="btn btn-info">
    <%}else{ %>    
    <input type='button' value='사진수정' onclick="updateFile()" class="btn btn-default">
    <input type="button" value='패스워드변경' onclick="updatePw()" class="btn btn-default">
    <input type='button' value='다운로드' class="btn btn-link"
    onclick="location.href='<%=root %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'"> 
    <%} %>
  </DIV>
</div> 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 