<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<%	
//검색 관련
	String col=Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word"));
	//col.  쓸수 있는 이유는 NULL체크를 했기 때문이다.
	if(col.equals("total")){  //total 체크시,검색어를 지움.
		word="";
	}
	
	//페이지 관련
	int nowPage=1; //현재 페이지
	if(request.getParameter("nowPage")!=null)
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	int recordPerPage=8; //페이지당 레코드수
	
	//DB에서 읽어올 시작과 끝
	int sno=((nowPage-1)*recordPerPage)+1;
	int eno=nowPage*recordPerPage;
	
	Map map=new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);
	
	int totalRecord=adao.total(col,word);
	List<AddressDTO> list=adao.list(map);
	Iterator<AddressDTO> iter=list.iterator();
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
.search{
	text-align: center;
  	width: 100%;
	maring: 10px auto;
} 
</style>
<script type="text/javascript">
function aread(no){
	var url="read.jsp";
	url+="?no="+no;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	
	location.href=url;
}
function aupdate(no){
	var url="updateForm.jsp";
	url+="?no="+no;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	
	location.href=url;
}
function adelete(no){
	if(confirm("삭제하시겠습니까?")){
		var url="deleteProc.jsp";
		url+="?no="+no;
		url+="&col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		location.href=url;
	}
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-address-card fa-fw w3-margin-right"></i>Address</button>
</h2><br>
<DIV class="container">
<h2 class="text-center text-success">주소 목록</h2><br>

<div class="table-responsive">
  <TABLE class="table table-hover ">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>등록일</th>
			<th>등록 / 수정</th>
		</tr>
  <%
  if (list.size()==0){
  %>
    <TR>
      <TD colspan='4'>등록된 메모가 없습니다.</TD>
    </TR>
  <%
  }else{
   while(iter.hasNext()){
	  AddressDTO dto=iter.next();
    %>
    <TR>
      <td><%=dto.getNo() %></td>
	  <td><a href="javascript:aread('<%=dto.getNo() %>')"><%=dto.getName() %></a>
	  	<%if(Utility.compareDay(dto.getWdate().substring(0,10))) {%>
	 	 <img src="<%=root %>/menu/images/new.gif">
	  </td> 
	  <%} %>
      <TD><%=dto.getWdate() %></TD>
      <td>
      	&nbsp; <a href="javascript:aupdate('<%=dto.getNo()%>')">수정</a>&nbsp;/
		<a href="javascript:adelete('<%=dto.getNo()%>')">삭제</a>
      </td>    
    </TR>
    
  <%
    }//for end
  } // if END
  %>   
	</table>
</div>


	<%=Paging.paging3(totalRecord, nowPage, recordPerPage, col, word) %>

<br>

<form method="post" action="./list.jsp" class="form-inline text-center">
<select name="col" class="form-control">
	<option value="name"<% if(col.equals("name")) out.print("selected='selected'"); %>
	>이름	</option>
	<option value="wdate"<% if(col.equals("wdate")) out.print("selected='selected'"); %>
	>등록일</option>
	<option value="total">전체출력</option>
</select>
<input type="text" name="word" value="<%=word%>" class="form-control">
<input type="submit" value="검색" class="btn btn-success">
<input type="button" value="등록" onclick="location.href='./createForm.jsp'" class="btn btn-primary">
</form>
</div>
 <!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 