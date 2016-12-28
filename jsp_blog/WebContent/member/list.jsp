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
</style> 
<script type="text/javascript">
function read(id) {
	var url="read.jsp";
	url+="?id="+id;
	url+="&nowPage=<%=nowPage%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	location.href=url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원목록</DIV>
<form name="frm" method='post' action='./list.jsp' class="form-inline">
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
<input type="text" name="word" value="<%=word %>" class="form-control">
<input type="submit" value="검색" class="btn btn-success"> 
<input type="button" value="회원가입" onclick="location.href='./createForm.jsp'" class="btn btn-primary"> 
</form>
<%while(iter.hasNext()){ 
MemberDTO dto=iter.next();%>
  <table>
<!--   <table class="table table-striped table-bordered table-hover"> -->
  	<tr>
  	 <td rowspan='5' width="150px">
  	 <img style="width:150px; height:150px;" src='./storage/<%=dto.getFname() %>'>
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
<%} %> 	
  </table> 
<div class="bottom">  
 <%= Paging.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
 </div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 