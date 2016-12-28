<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<% 
	String col= request.getParameter("col");
	String word= request.getParameter("word");
	String nowPage= request.getParameter("nowPage");
	
	int no= Integer.parseInt(request.getParameter("no"));
	
	idao.upViewcnt(no);
	
	ImagesDTO dto= idao.read(no);
	
	String content= dto.getContent();	
	content= content.replaceAll("\r\n","<br>");
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
	height:250px;
	width:auto;
}
.img:hover{
	background-color:#808080;
	margin-right:0;
	border-style:solid;
	border-width: 3px;
/* 	border-color: #ffd6cc; */
}
.table th{
 	background-color: #5b94d1; 
/* 	background-color:#595959; */
  	border-color: #ffffff; 
 	 color:#ffffff;
 	 width:30%;
}

.thumbnail-table{
	max-width:50%;
	width:50%;
}
img#img_size{
	width:170px;
	height:170px;
	margin-left: auto; 
	margin-right: auto;
	display: block;
}
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript">
function readGo(no){
	var url = "./read.jsp";
	url = url +"?no="+no;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	location.href=url;
}
function warning() {
	alert("이미지가 없습니다.");
}
function idown(fname){
	var url = "<%=root%>/download";
	url += "?dir=/images/storage";
	url += "&filename="+fname;	
	
	location.href = url;
	
}
function iupdate(){
	var url= "updateForm.jsp";
	url+="?no=<%=no%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	location.href=url;
}
function ilist(){
	var url= "list.jsp";
	url+="?no=<%=no%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	location.href=url;
}
function ireply(){
	var url= "replyForm.jsp";
	url+="?no=<%=no%>";		
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	location.href=url;		
}
function idelete(){
	var url= "deleteForm.jsp";
	url+="?no=<%=no%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	url+= "&oldfile=<%=dto.getFname()%>";
	location.href=url;
}


</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-image fa-fw w3-margin-right"></i>Image</button>
</h2><br>
<DIV class="container ">
 <div class="row">
 <div class="col-sm-1"></DIV>
 <div class="col-sm-10">
 <h2 class="text-center text-success"></i>조회</h2><br>
  <TABLE class="table table-hover table-bordered">
    <TR>
      <TD colspan="2" class="text-center">
      <img class="imgs " src="<%=root %>/images/storage/<%=dto.getFname() %>" >
      
      </TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><%=dto.getContent() %></TD>
    </TR>
    <TR>
      <TH>성명</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
  </TABLE >
 </DIV>
</DIV>  
<!--   <div class="col-xs-3 col-sm-3"></div> -->
  <div class="row">
	<div class="col-sm-1"></div>
	  <%
		List list = idao.imgRead(Integer.parseInt(request.getParameter("no")));
	    String[] files = (String[])list.get(0);
	    int[] noArr = (int[])list.get(1);
	    for(int i=0;i<5;i++){
	    	if(files[i]==null){  
	  %>	 
	 	<div class="col-sm-2"><a href="javascript:warning()">
	 	<img src="<%=root %>/images/storage/noimage.jpg" id="img_size" class="img thumbnail" >
	 	</a></div> 
	  <%
	    	}else{
	    		if(noArr[i]==dto.getNo()){
	  %>	   	
	  	<div class="col-sm-2"><a href="javascript:readGo('<%=noArr[i]%>')">
	  	<img src="<%=root %>/images/storage/<%=files[i] %>" id="img_size" class="img thumbnail" >
	 	 </a></div>	 	
	  <%		
	    		}else{
	  %>	  
	  	<div class="col-sm-2"><a href="javascript:readGo('<%=noArr[i]%>')">
	  	<img src="<%=root %>/images/storage/<%=files[i] %>" id="img_size" class="img thumbnail" >
	  	</a></div>	  	  			
	  <%
	    		}
	    	 }   		
	      }
	  %>
  </div>
	<br><br>
	<div class="text-center">
<!-- 	    <input class='btn btn-primary' type='submit' value='등록' onclick="location.href='./create.do'"> -->
	    <input class='btn btn-primary' type='button' value='답글' onclick="ireply()">
	    <input class='btn btn-info' type='button' value='목록' onclick="ilist()">
	    <input class='btn btn-default' type='button' value='수정' onclick="iupdate()">
	    <input class='btn btn-danger' type='button' value='삭제' onclick="idelete()">
	    <input class='btn btn-link' type='button' value='다운로드' onclick="idown('<%=dto.getFname()%>')">
    </div>
</DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 