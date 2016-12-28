<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
//검색
	String col=Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word"));
	//col.  쓸수 있는 이유는 NULL체크를 했기 때문이다.
	if(col.equals("total"))  //total 체크시,검색어를 지움.
		word="";
	
	//--페이징관련
	int nowPage=1;
	if(request.getParameter("nowPage")!=null)
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	int recordPerPage=5; //페이지당 레코드 수
	
	//DB에서 가져올 순번 생성
	int totalRecord=tdao.total(col, word);
	int sno=(nowPage-1)*recordPerPage;
	int eno=nowPage*recordPerPage;
	
	
	Map map=new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<TeamDTO> list=tdao.list(map);
	Iterator<TeamDTO> iter=list.iterator();
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
.search{
	text-align: center;
  	width: 100%;
	maring: 10px auto;
} 
img#im{
	width:40px;
	height:40px;
	margin-left: auto; 
	margin-right: auto;
	 display: block;
}
</style>
<script type="text/javascript">
function update(no) {
	var url="updateForm.jsp";
	url+="?no="+no;
	url+="&col=<%=col%>"; 
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
function del(no,oldfile) {
	if(confirm("삭제하시겠습니까?")){
		var url="deleteProc.jsp";
		url+="?no="+no;
		url+="&col=<%=col%>"; 
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		url+="&oldfile="+oldfile;
		location.href=url;
	}
}
function read(no) {
	var url="read.jsp";
	url+="?no="+no;
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
<DIV class="title">팀 목록</DIV>
<div class="search">
<form method="post" action="./list.jsp">
<select name="col">
	<option value="name"<% if(col.equals("name")) out.print("selected='selected'"); %>
	>이름	</option>
	<option value="phone"<% if(col.equals("phone")) out.print("selected='selected'"); %>
	>전화번호</option>
	<option value="skill"<% if(col.equals("skill")) out.print("selected='selected'"); %>
	>보유기술</option>
	<option value="total">전체출력</option>
</select>
<input type="text" name="word" value="<%=word%>">
<input type="submit" value="검색">
<input type="button" value="등록" onclick="location.href='./createForm.jsp'">
</form>
</div>
<table>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>보유기술</th>
		<th>사진</th>
		<th>수정|삭제</th>		
	</tr>
	
		<%if(list.size()==0){ %>
		<tr>
			<td colspan="6">등록된 정보가 없습니다.</td>
		</tr>
		<%} else{ 
			while(iter.hasNext()){
			TeamDTO dto=iter.next();%>
		<tr>
		<td><%=dto.getNo() %></td>
		<td><a href="javascript:read('<%=dto.getNo()%>')"><%=dto.getName()%></a></td>
		<td><%=dto.getPhone() %></td>
		<td><%=dto.getSkillstr() %></td>
		<td><img id="im" src="./storage/<%=dto.getFilename() %>"></td>
		<td>
			<a href="javascript:update('<%=dto.getNo()%>')">수정</a>&nbsp;|
			<a href="javascript:del('<%=dto.getNo()%>','<%=dto.getFilename()%>')">삭제</a>
		</td>
		<%}
		}%>
	
</table>

<div id="bottom">
	<%=Paging.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
</div>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 