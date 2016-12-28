<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	ImagesDTO dto = idao.readReply(no);
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
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-image fa-fw w3-margin-right"></i>Image</button>
</h2><br>
<div class="container">
  <h2 class="text-center text-success">사진 답변 등록</h2>
<FORM name='frm' method='POST' action='./replyProc.jsp' enctype="multipart/form-data"class="form-horizontal">
	<!-- 답변 등록을 위한 태그 -->
	<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
	<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
	<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
	<!-- 페이지와 검색 유지를 위한 태그 -->
	<input name="col" value="<%=request.getParameter("col") %>" type="hidden">
	<input name="word" value="<%=request.getParameter("word") %>" type="hidden">
	<input name="nowPage" value="<%=request.getParameter("nowPage") %>" type="hidden">
	<!-- 부모글 삭제를 막기 위한 태그 -->
	<input name="no" value="<%=no %>" type="hidden">
<input type="hidden" name="wname" value="<%=mname %>">
<!--     <div class="form-group"> -->
<!--       <label class="control-label col-sm-2" for="name">성명:</label> -->
<!--       <div class="col-sm-8"> -->
<!--         <input type="text" name="wname" class="form-control" id="name" placeholder="Enter name"> -->
<!--       </div> -->
<!--     </div> -->
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-8">
        <input type="text" name="title" class="form-control" id="title" placeholder="Enter title">
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
        <input type="file" name="fname" class="form-control" id="file" placeholder="Select File">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8" style="text-align: center;padding:15px">
        <input type="submit" value="답변" class="btn btn-success">
        <input type="button" value="취소" class="btn btn-warning" onclick=" history.back()">
      </div>
    </div>
  </form>
</div>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

