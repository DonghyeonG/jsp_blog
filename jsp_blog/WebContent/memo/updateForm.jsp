<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
<% 
	int memono=Integer.parseInt(request.getParameter("memono"));
	MemoDTO dto=mdao.read(memono);
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

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-pencil fa-fw w3-margin-right"></i>Memo</button>
</h2><br>
<DIV class="container">
<h2 class="text-center text-success">메모 수정</h2><br>
<%if(dto!=null){%> 
<Form name='frm' method='POST' action='./updateProc.jsp' onsubmit="return input(this)" class="form-horizontal">
<input type="hidden" name="memono" value="<%=memono%>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
<div class="form-group">
   <label class="control-label col-sm-2" for="title">제목:</label>
   <div class="col-sm-8">
     <input type="text" name="title" class="form-control" id="title"
      placeholder="Enter title" value="<%=dto.getTitle()%>">
   </div>
</div>
<div class="form-group">
  <label class="control-label col-sm-2" for="content">내용:</label>
  <div class="col-sm-8">
   <TEXTAREA name='content' rows='10' cols='30' class="form-control" id="content"  placeholder="Enter content">
   <%=dto.getContent() %></TEXTAREA>
  </div>
</div> 

  <DIV class="text-center" >
    <input type='submit' value='수정' class="btn btn-success">
    <input type="button" value='뒤로가기' class="btn btn-warning">
  </DIV>  
</Form>
</DIV>
</body>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</html> 
<% } %>