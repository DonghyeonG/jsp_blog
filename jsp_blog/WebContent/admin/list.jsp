<%@page import="com.sun.corba.se.impl.javax.rmi.CORBA.Util"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	//검색관련
	String col=Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word"));
	if(col.equals("total")){ //col. << 막 쓸수 있는 이유는 바로 위에서 널체크를 했기때문이다.
		word="";
	}
	//페이징관련
	int nowPage=1;
	int recordPerPage=5;
	if(request.getParameter("nowPage")!=null)
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	//DB에서 가져올 순번
	int sno=((nowPage-1)*recordPerPage)+1; //페이지의 시작
	int eno=nowPage*recordPerPage; // 페이지의 끝
	
	Map map=new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);
	
	int totalRecord=dao.total(col,word); //검색결과 전체 수 
	List<MemberDTO> list=dao.list(map);
	Iterator<MemberDTO> iter=list.iterator();
	
	
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
.imgs{
	width:170px;
	height:auto;
}
</style> 
<script type="text/javascript">
function read(id) {
	var url="<%=root%>/member/read.jsp";
	url+="?id="+id;
	url+="&nowPage=<%=nowPage%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-user-card fa-fw w3-margin-right"></i>Member List</button>
</h2><br>
<h2 class="text-success text-center">회원 목록</h2>
<div class="container">
  <%while(iter.hasNext()){ 
MemberDTO dto=iter.next();%>
  <table class="table table-bordered">

<!--   <table class="table table-striped table-bordered table-hover"> -->
  	<tr>
  	 <td rowspan='5'>
  	 <img class="imgs" src='<%=root %>/member/storage/<%=dto.getFname() %>'>
  	 </td>
  	 <th width='20%'>아이디</th> 
  	 <td><a href="javascript:read('<%=dto.getId()%>')"><%=dto.getId() %></a></td>
  	</tr>
  	<tr>
     <th>성명</th>
  	 <td><%=dto.getMname() %></td>
  	</tr>
  	<tr>
     <th>전화번호</th>
  	 <td><%=dto.getTel() %></td>
  	</tr>
  	<tr>
     <th>이메일</th>
  	 <td><%=dto.getEmail() %></td>
  	</tr>
  	<tr>
     <th>주소</th>
  	 <td><%=dto.getAddress1() %>
  	 <%=Utility.checkNull(dto.getAddress2())%>
  	 </td>
  	</tr>
  <hr>
  </table> 
<%} %> 	
<div class="bottom">  
 <%= Paging.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
 </div>
 


<form name="frm" method='post' action='./list.jsp' class="form-inline text-center">
<select name="col" class="form-control">
	<option value="mname" 
	<%if(col.equals("mname")) out.print("selected='selected'"); %> 
	>성명</option>
	<option value="email"
	<%if(col.equals("email")) out.print("selected='selected'"); %> 
	>이메일</option>
	<option value="id"
	<%if(col.equals("id")) out.print("selected='selected'"); %> 
	>아이디</option>
	<option value="total">전체출력</option>
</select>
<input type="text" name="word" value="<%=word %>" class="form-cotrol">
<input type="submit" value="검색" class="btn btn-success"> 
<input type="button" value="회원가입" onclick="location.href='./createForm.jsp'" class="btn btn-primary"> 
</form>
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 