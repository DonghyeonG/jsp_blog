<%@page import="bbs.BbsDAO"%>
<%@page import="utility.Utility"%>
<%@page import="java.util.*"%>
<%@page import="bbs.BbsDTO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
 
<% request.setCharacterEncoding("utf-8");  
 	String root=request.getContextPath();
 	String id=(String)session.getAttribute("id");
 	String grade=(String)session.getAttribute("grade");
 	
 	BbsDAO dao=new BbsDAO();
	BbsDTO dto=new BbsDTO();
	int cnt=0;
	int nowPage=1; //현재 보고있는 페이지,변결될 수 있어요 !
	
	int recordPerPage=6;// 페이지당 5개의 레코드를 보여줌
	
	//DB에서 가져올 순번----------------------------------------------
	int sno=((nowPage-1)*recordPerPage)+1;
	int eno=nowPage*recordPerPage;
	String col="";
	String word="";
	Map map=new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);
	
	List<BbsDTO> list=dao.list(map);
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<title></title> 
<style type="text/css"> 
*{ 
  font-size: 20px; 
} 
.imgs{
	height:170px;
	width: auto;
}
</style> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function bread(bbsno) {
	var url="<%=root%>/bbs/read.jsp";
	url+="?bbsno="+bbsno;
	url+="&nowPage=1";
	url+="&col=";
	url+="&word=";
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
<%if(id!=null && grade.equals("A")){ %>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-home fa-fw w3-margin-right"></i>관리자 모드</button>
<%}else{ %>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-home fa-fw w3-margin-right"></i>DH's_Blog</button>
<%} %>
</h2> 
  <!-- Header -->
  <header class="w3-container" >
<!--     <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a> -->
<!--     <h1><b></b></h1> -->
  </header>
 
<!--     First Photo Grid -->
<h3 class="text-center text-info">New Contents </h3><br>
  <div class="w3-row-padding">
	<%dto=list.get(cnt++); %>	
    <div class="w3-third w3-container w3-margin-bottom">
    <%if(dto.getFilename()=="" || dto.getFilename()==null){ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/noimage.jpg" alt=""  class="imgs w3-hover-opacity"></a>
    <%}else{ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/<%=dto.getFilename() %>" alt=""  class="imgs w3-hover-opacity"></a>
    <%} %>  
      <div class="w3-container w3-white">
        <p><b><%=dto.getTitle() %></b></p>
        <p><%=dto.getContent() %></p>
      </div>
    </div>
    <%dto=list.get(cnt++); %>
    <div class="w3-third w3-container w3-margin-bottom">
    <%if(dto.getFilename()=="" || dto.getFilename()==null){ %>	
     <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/noimage.jpg" alt=""  class="imgs w3-hover-opacity"></a>
    <%}else{ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/<%=dto.getFilename() %>" alt=""  class="imgs w3-hover-opacity"></a>
    <%} %>
      <div class="w3-container w3-white">
         <p><b><%=dto.getTitle() %></b></p>
        <p><%=dto.getContent() %></p>
      </div>
    </div>
    <%dto=list.get(cnt++); %>
    <div class="w3-third w3-container">
    <%if(dto.getFilename()=="" || dto.getFilename()==null){ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/noimage.jpg" alt=""  class="imgs w3-hover-opacity"></a>
    <%}else{ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/<%=dto.getFilename() %>" alt=""  class="imgs w3-hover-opacity"></a>
    <%} %>
      <div class="w3-container w3-white">
         <p><b><%=dto.getTitle() %></b></p>
        <p><%=dto.getContent() %></p>
      </div>
    </div>
  </div>
  
<!--   Second Photo Grid--> 
  <div class="w3-row-padding">
    <%dto=list.get(cnt++); %>
    <div class="w3-third w3-container w3-margin-bottom">
    <%if(dto.getFilename()=="" || dto.getFilename()==null){ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/noimage.jpg" alt=""  class="imgs w3-hover-opacity"></a>
    <%}else{ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/<%=dto.getFilename() %>" alt=""  class="imgs w3-hover-opacity"></a>
    <%} %>
      <div class="w3-container w3-white">
         <p><b><%=dto.getTitle() %></b></p>
        <p><%=dto.getContent() %></p>
      </div>
    </div>
    <%dto=list.get(cnt++); %>
    <div class="w3-third w3-container w3-margin-bottom">
    <%if(dto.getFilename()=="" || dto.getFilename()==null){ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/noimage.jpg" alt=""  class="imgs w3-hover-opacity"></a>
    <%}else{ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/<%=dto.getFilename() %>" alt=""  class="imgs w3-hover-opacity"></a>
    <%} %>
      <div class="w3-container w3-white">
         <p><b><%=dto.getTitle() %></b></p>
        <p><%=dto.getContent() %></p>
      </div>
    </div>
    <%dto=list.get(cnt++); %>
    <div class="w3-third w3-container">
    <%if(dto.getFilename()=="" || dto.getFilename()==null){ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/noimage.jpg" alt=""  class="imgs w3-hover-opacity"></a>
    <%}else{ %>	
      <a href="javascript:bread('<%=dto.getBbsno() %>')"><img src="<%=root %>/bbs/storage/<%=dto.getFilename() %>" alt=""  class="imgs w3-hover-opacity"></a>
    <%} %>
      <div class="w3-container w3-white">
         <p><b><%=dto.getTitle() %></b></p>
        <p><%=dto.getContent() %></p>
      </div>
    </div>
  </div>
<hr>
<!--   <!-- Pagination --> 
<!--   <div class="w3-center w3-padding-32"> -->
<!--     <ul class="w3-pagination"> -->
<!--       <li><a class="w3-black" href="#">1</a></li> -->
<!--       <li><a class="w3-hover-black" href="#">2</a></li> -->
<!--       <li><a class="w3-hover-black" href="#">3</a></li> -->
<!--       <li><a class="w3-hover-black" href="#">4</a></li> -->
<!--       <li><a class="w3-hover-black" href="#">»</a></li> -->
<!--     </ul> -->
<!--   </div> -->

  <!-- Images of Me -->
<!--   <div class="w3-row-padding w3-padding-16" id="about"> -->
<!--     <div class="w3-col m6"> -->
<!--       <img src="/w3images/avatar_g.jpg" alt="Me" > -->
<!--     </div> -->
<!--     <div class="w3-col m6"> -->
<!--       <img src="/w3images/me2.jpg" alt="Me" > -->
<!--     </div> -->
<!--   </div> -->

<!--   <div class="w3-container w3-padding-large" > -->
<!--     <h4><b>About Page & Me</b></h4> -->
<!--     <p>JSP와 Bootstrap을 이용한</p> -->
<!--     <p>페이</p> -->
<!--     <hr> -->
  
<!--     <h4>Technical Skills</h4> -->
<!--     Progress bars / Skills -->
<!--     <p>Photography</p> -->
<!--     <div class="w3-progress-container w3-grey"> -->
<!--       <div class="w3-progressbar w3-dark-grey" style="width:15%"></div> -->
<!--     </div> -->
<!--     <p>Web Design</p> -->
<!--     <div class="w3-progress-container w3-grey"> -->
<!--       <div class="w3-progressbar w3-dark-grey" style="width:25%"></div> -->
<!--     </div> -->
<!--     <p>Photoshop</p> -->
<!--     <div class="w3-progress-container w3-grey"> -->
<!--       <div class="w3-progressbar w3-dark-grey" style="width:10%"></div> -->
<!--     </div> -->
<!--    </div>  -->
<!--    <br> -->
<!--     <p> -->
<!--       <button class="w3-btn w3-dark-grey w3-padding-large w3-margin-top w3-margin-bottom"> -->
<!--         <i class="fa fa-download w3-margin-right"></i>Download Resume -->
<!--       </button> -->
<!--     </p> -->
    <hr>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 