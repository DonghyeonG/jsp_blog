<%@ page contentType="text/html; charset=UTF-8" %> 
<%  
	request.setCharacterEncoding("utf-8"); 
	String root = request.getContextPath();
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
<script type="text/javascript" 	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
	};
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-edit fa-fw w3-margin-right"></i>Bulletin Board</button>
</h2><br> 
<div class="container">
  <h2 class="text-success text-center">자유게시판 글쓰기</h2>
<FORM name='frm' method='POST' action='./createProc.jsp' enctype="multipart/form-data" class="form-horizontal">
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
        <input type="file" name="filename" class="form-control" id="file" placeholder="Select File">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8" style="text-align: center;padding:15px">
        <button type="submit" class="btn btn-success">글쓰기</button>
        <button type="button" class="btn btn-warning" onclick=" history.back()">취소</button>
      </div>
    </div>
  </form>
</div>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 