<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
//검색============================================
	String col= Utility.checkNull(request.getParameter("col"));
	String word= Utility.checkNull(request.getParameter("word"));
	
	
	if(col.equals("total")){
		word="";
	}
	//paging 관련=======================================
	int nowPage= 1;//현재 보고 있는 페이지
	if(request.getParameter("nowPage")!=null){
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage= 8;//한 페이지 보여줄 갯수
	
	//DB에서 가져올 순번=====================================
	int sno= ((nowPage-1)*recordPerPage)+1;
	int eno= nowPage*recordPerPage;
	
	
	Map map= new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	int total=idao.total(col, word);
	List<ImagesDTO> list= idao.list(map);
	Iterator<ImagesDTO> iter= list.iterator();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function read(no){
	var url= "read.jsp";
	url+= "?no="+no;
	url+= "&col=<%=col%>";
	url+= "&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	
	location.href=url;
}

</script>
<style type="text/css">
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 

.img{
	width:120px;
	max-height:160px;
}

</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
	<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-image fa-fw w3-margin-right"></i>Image</button>
</h2><br>
<DIV class="container">
<div class="table-responsive">
<h2 class="text-center text-success">게시판 목록</h2><br>
<TABLE class="table table-hover">
    <TR>
         <TH>번호</TH>
         <TH>사진</TH>
         <TH>제목</TH>
         <TH>성명</TH>
         <TH>조회수</TH>
         <TH>등록일</TH>       
         <TH>파일명</TH>             
    </TR> 
       <%if(list.size()==0){%>
    <tr>
    	<td colspan="7">등록된 글이 없습니다</td>
    </tr>
    <%  } else{ 
    	while(iter.hasNext()){
    		ImagesDTO dto=iter.next();
    %>
    <tr>
    	<Td><%=dto.getNo() %></Td>
    	<td class="text-center">
    	<%if(dto.getFname()=="" || dto.getFname()==null){ %>	
     	<img class="img" src="<%=root %>/images/storage/noimage.jpg" alt="" >
     	<%}else{ %>
    	<img class="img" src="./storage/<%=dto.getFname() %>"></td>
    	<%} %>
    	<Td>
    	<% for(int i=0; i<dto.getIndent();i++){
    		out.print("&nbsp;&nbsp;");
    	}
    	
    	if(dto.getIndent()>0){ %>
    		<img src="./storage/re.jpg">
    		<%} %>
    	<a href="javascript:read('<%=dto.getNo() %>')"
    	><%=dto.getTitle() %>
    	</a>
    	<% if (Utility.compareDay(dto.getWdate().substring(0, 10))){ %>
    	<img src="./storage/new.gif">
    	<% } %>
    	</Td>
    	<Td><%=dto.getWname() %></Td>
    	<Td><%=dto.getViewcnt() %></Td>
        <Td><%=dto.getWdate().substring(0,10) %></Td>    
        <Td>
        <%if(dto.getFname()==null){ 
        	out.print("파일 없음");
        }else{
        	out.print("<span class='glyphicon glyphicon-download-alt'></span>");
        }
        %>
        
        </Td> 
    </tr>
 <%
     } //while 
   } //if
 %> 
</TABLE>
</div>    

<%=Paging.paging3(total, nowPage, recordPerPage, col, word) %><br>
  <FORM method='POST' action='./list.jsp' class="form-inline text-center">
	
	<select name="col" class="form-control">
<!-- 검색할 컬럼 -->
	<option value="wname"
		<%if(col.equals("wname")) out.print("selected='selected'"); %>>성명</option>
		<option value="title"
		<%if(col.equals("title")) out.print("selected='selected'"); %>>제목</option>
		<option value="content"
		<%if(col.equals("cotent")) out.print("selected='selected'"); %>>내용</option>
		<option value="total">전체</option>
	</select>
		<input type="text" name="word" value="<%=word%>" class="form-control"> 
		<input type='submit' value='검색' class="btn btn-success"> 
		<input type='button' value='등록' onclick="location.href='./createForm.jsp'" class="btn btn-primary">
	</FORM>
</DIV>
	<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>
