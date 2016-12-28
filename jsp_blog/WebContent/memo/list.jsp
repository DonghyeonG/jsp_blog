<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %> <!--  /는 WebContent -->
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
	
	int totalRecord=mdao.total(col,word);
	List<MemoDTO> list=mdao.list(map);
	Iterator<MemoDTO> iter=list.iterator();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
/* 	font-family: gulim; */
	font-size: 20px;
}
.btn-block{
	position: relative;
    top: -55px
}
</style>
<script type="text/javascript">
function read(str){
	var url="read.jsp";
	url+="?memono="+str;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-pencil fa-fw w3-margin-right"></i>Memo</button>
</h2><br>
<div class="container">
<h2 class="text-success text-center">메모 목록</h2>
<div class="table-responsive">
  <TABLE class="table table-hover ">
		<tr class="tr-inverse">
			<th>번호</th>
			<th class="col-sm-6">제목</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		  <%
  if (list.size() == 0){
  %>
    <TR>
      <TD colspan='4'>등록된 메모가 없습니다.</TD>
    </TR>
 <%}else{
    while(iter.hasNext()){
    	MemoDTO dto=iter.next();
    %>
    <TR>
      <TD><%=dto.getMemono() %></TD>
      <td><a href="javascript:read('<%=dto.getMemono() %>')"><%=dto.getTitle() %></a>
      <%if(Utility.compareDay(dto.getWdate().substring(0,10))){ %>
      <img src="<%=root %>/menu/images/new.gif">
      </td>
      <%} %>
		<%-- <TD><%=rs.getString(2) %></TD> --%>
      <TD><%=dto.getWdate() %></TD>
      <TD><%=dto.getViewcnt() %></TD>
      
    </TR>
    
  <%
    }
  } // if END
  %>   
 </table>
</div>
</div>
<div id="bottom">
 	 <%=Paging.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
</div>
<br>

<form method="POST" action="./list.jsp" class="form-inline text-center">
<select name="col" class="form-control"><!-- 검색할 컬럼 -->
	
	<option value="title" 
	<% if(col.equals("title")) out.print("selected='selected'"); %>
	>제목</option>
	<option value="content" 
	<% if(col.equals("content")) out.print("selected='selected'"); %>
	>내용</option>
	<option value="total">전체출력</option>
</select>
<input type="text" name="word" value="<%=word%>" class="form-control"><!-- 검색어,value는 검색어 유지 -->
<input type="submit" value="검색" class="btn btn-success">
<input type='button' value='등록' onclick="location.href='./createForm.jsp'" class="btn btn-primary">
</form> 
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>