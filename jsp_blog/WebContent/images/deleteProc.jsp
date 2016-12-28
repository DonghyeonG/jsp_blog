<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
int no = Integer.parseInt(request.getParameter("no"));
String passwd = request.getParameter("passwd");
String oldfile = request.getParameter("oldfile");
String upDir = application.getRealPath("/image/storage");

String col = request.getParameter("col");
String word = request.getParameter("word");
String nowPage = request.getParameter("nowPage");

Map map = new HashMap();
map.put("no", no);
map.put("passwd", passwd);

boolean pflag = idao.passCheck(map);
boolean flag= false;

if(pflag){
flag=idao.delete(no);
}
if(flag){

UploadSave.deleteFile(upDir, oldfile);
}
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function ilist(){
var url = "list.jsp";
url+="?col=<%=col%>";
url+="&word=<%=word%>";
url+="&nowPage=<%=nowPage%>";

location.href=url;
}

</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-image fa-fw w3-margin-right"></i>Image</button>
</h2><br><br>
<div class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
 <%
 	if(pflag==false){
 	out.print("패스워드가 일치하지 않습니다.");
 	}else if(flag){
 	out.print("사진을 삭제 했습니다.");
 	}else{
 	out.print("사진 삭제를 실패했습니다.");
 	}
 %>
	<br><br>
  <% if(pflag==false){ %>
    <input type='button' value='다시시도' onclick="history.back()" class="btn btn-warning">
    <input type='button' value='목록' onclick="ilist()" class="btn btn-info">
	<%}else if(flag){%>
    <input type='button' value='목록' onclick="ilist()" class="btn btn-info">
	<%}else{ %>
    <input type='button' value='다시시도' onclick="history.back()" class="btn btn-warning">
    <input type='button' value='목록' onclick="ilist()" class="btn btn-info">
<%} %>
  </DIV><br><br><br>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 