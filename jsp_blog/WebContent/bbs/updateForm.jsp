<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%  

	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.read(bbsno);

%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function incheck(f){
	if(f.wname.value==""){
	alert("이름을 입력하세요");
	f.wname.focus();
	return false;
	}


	if(f.title.value==""){
	alert("제목을 입력하세요");
	f.title.focus();
	return false;
	}


	if(f.content.value==""){
	alert("내용을 입력하세요");
	f.content.focus();
	return false;
	}

	if(f.passwd.value==""){
	alert("암호을 입력하세요");
	f.passwd.focus();
	return false;
	}
}
</script>
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
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
<div class="container">
  <h2 class="text-center text-success">게시글 수정</h2><br>
<FORM name='frm' method='POST' action='./updateProc.jsp' enctype="multipart/form-data"class="form-horizontal">
 <input type="hidden" name="bbsno" value="<%=bbsno%>" >
 <input type="hidden" name="oldfile" value="<%=dto.getFilename()%>">
 <input type="hidden" name="col" value="<%=request.getParameter("col")%>" >
 <input type="hidden" name="word" value="<%=request.getParameter("word")%>">
 <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">성명:</label>
      <div class="col-sm-10">
        <input type="text" name="wname" class="form-control" id="name" placeholder="Enter name" value=<%=dto.getWname() %>>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-10">
        <input type="text" name="title" class="form-control" id="title" placeholder="Enter title" value="<%=dto.getTitle()%>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-10">
       <textarea rows="10" cols="45" name="content" class="form-control" id="content" 
       placeholder="Enter content" ><%=dto.getContent()%></textarea> 
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" name="passwd" class="form-control" id="pwd" placeholder="Enter password">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="file">파일:</label>
      <div class="col-sm-10">          
        <input type="file" name="filename" class="form-control" id="file" placeholder="Select File">( <%=Utility.checkNull(dto.getFilename()) %> )
      </div>
    </div>
    <br>
    <div class="text-center">
        <input type="submit" class="btn btn-success" value="수정">
        <input type="button" class="btn btn-warning" onclick=" history.back()" value="뒤로가기">
	</div>        
  </form>
</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
