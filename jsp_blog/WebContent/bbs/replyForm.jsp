<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%  
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto=bdao.readReply(bbsno);
	String mname=(String)session.getAttribute("mname");
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-edit fa-fw w3-margin-right"></i>Bulletin Board</button>
</h2><br>

<div class="container text-center">
  <h2 class="text-success">답변 글쓰기</h2><br>
<FORM name='frm' method='POST' action='./replyProc.jsp' enctype="multipart/form-data"class="form-horizontal">
 <input type="hidden" name="grpno" value="<%=dto.getGrpno() %>"> 
<input type="hidden" name="indent" value="<%=dto.getIndent() %>"> 
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>"> 
<!-- 페이지와 검색유지를 위해서 -->
<input type="hidden" name="col" value="<%=request.getParameter("col")%>" >
<input type="hidden" name="word" value="<%=request.getParameter("word")%>" >
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>" >
<!-- 부모글 삭제를 막기 위해서 -->
<input type="hidden" name="bbsno" value=<%=bbsno %>>
<input type="hidden" name="wname" value="<%=mname%>">
<!--     <div class="form-group"> -->
<!--       <label class="control-label col-sm-2" for="name">성명:</label> -->
<!--       <div class="col-sm-8"> -->
<%--         <input type="text" name="${sse }" class="form-control" id="name" placeholder="Enter name"> --%>
<!--       </div> -->
<!--     </div> -->
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-8">
        <input type="text" name="title" class="form-control" id="title" placeholder="Enter title" value="${dto.title}">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-8">
       <textarea rows="10" cols="45" name="content" class="form-control" id="content" 
       placeholder="Enter content" ></textarea> 
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-8">          
        <input type="password" name="passwd" class="form-control" id="pwd" placeholder="Enter password">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="file">파일:</label>
      <div class="col-sm-8">          
        <input type="file" name="filename" class="form-control" id="file" placeholder="Select File">
      </div>
    </div>
    <input type="submit" class="btn btn-success" value="답변">
        <input type="button" class="btn btn-warning" onclick=" history.back()" value="뒤로가기">
  </form>
</div>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 