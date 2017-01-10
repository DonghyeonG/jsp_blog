<%@ page contentType="text/html; charset=UTF-8" %> 
 
<% 
	String root = request.getContextPath(); 
	String id=null; 
	String fname=null; 
	String mname=null; 
	String grade=null;
	id=(String)session.getAttribute("id");
	mname=(String)session.getAttribute("mname");
	fname=(String)session.getAttribute("fname");
	grade=(String)session.getAttribute("grade");
	System.out.println("id: "+id);
	System.out.println("grade: "+grade);
%> 
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
.w3-sidenav a,.w3-sidenav h4 {font-weight:bold}
.main{
	margin-left:300px;
}

</style>
<script>
//logout
function logout() {
	var url="<%=root%>/member/logout.jsp";
	if(confirm("로그아웃 하시겠습니까?")){
		location.href=url;
	}
}
// Script to open and close sidenav
function w3_open() {
// 	document.getElementById("main").style.marginLeft = "20%";
// 	document.getElementById("mySidenav").style.width = "20%";
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";  //컨텐츠부분이 투명 검정색(?)으로 
}
 
function w3_close() {
// 	document.getElementById("main").style.marginLeft = "0%";
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>
<body class="w3-Snow w3-content" style="max-width:1600px">

<!-- Sidenav/menu  (width:992px기준으로 메뉴토글이 나타남) -->
<nav class="w3-sidenav w3-collapse w3-white w3-animate-left nav" style="z-index:11;width:300px; background-color:#e6e6e6;" id="mySidenav"><br>
  <div class="w3-container w3-margin-left w3-margin-top " >
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding-5" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <%if(id==null){ %>
    	<img src="<%=root%>/menu/images/Penguins.jpg" class="main-img w3-hover-opacity img-rounded w3-margin-left" ><br><br>
    <%}else{ %>
    <img src="<%=root%>/member/storage/<%=fname %>" class="main-img w3-hover-opacity img-rounded w3-margin-left"><br><br>
    <%} %>
    <h4 class="w3-padding-0"><b>
    <%if(id!=null){%>
	 	<a href="<%=root%>/member/read.jsp?id=<%=id %>" onclick="w3_close()"><strong><%=mname%></strong> 님</a>
	 <%}else{
		 out.print("&nbsp;<strong>Guest</strong> 님");
	 } %> 
	</b></h4><br>
 
<!--   Menu list -->
    <a href="<%=root%>/index.jsp" onclick="w3_close()"	class="w3-padding w3-text-teal"><i	class="fa fa-home fa-fw w3-margin-right" ></i>홈</a>
    <%if(id==null){ %> 
	<a	href="<%=root%>/member/loginForm.jsp" onclick="w3_close()"	class="w3-padding"><i class="fa fa-key fa-fw w3-margin-right" ></i>로그인</a> 
	<a	href="<%=root%>/member/agreement.jsp" onclick="w3_close()"	class="w3-padding"><i class="fa fa-plus fa-fw w3-margin-right" ></i>회원가입</a>
	<a  href="<%=root%>/bbs/list.jsp" onclick="w3_close()"	class="w3-padding"><i class="fa fa-edit fa-fw w3-margin-right"></i>자유게시판</a>
	<a href="<%=root%>/memo/list.jsp" onclick="w3_close()"	class="w3-padding"><i class="fa fa-pencil fa-fw w3-margin-right"></i>메모</a>   
	<a href="<%=root%>/images/list.jsp" onclick="w3_close()"	class="w3-padding"><i class="fa fa fa-image fa-fw w3-margin-right"></i>이미지</a>   
	<%}else{ %> 
	<a href="<%=root%>/member/read.jsp?id=<%=id %>" onclick="w3_close()"	class="w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>나의 정보</a> 
	<a href="<%=root%>/bbs/list.jsp" onclick="w3_close()"	class="w3-padding"><i class="fa fa-edit fa-fw w3-margin-right"></i>자유게시판</a> 
	<a href="<%=root%>/memo/list.jsp" onclick="w3_close()"	class="w3-padding"><i class="fa fa-pencil fa-fw w3-margin-right"></i>메모</a> 
	<a href="<%=root%>/images/list.jsp" onclick="w3_close()"	class="w3-padding"><i class="fa fa-image fa-fw w3-margin-right"></i>이미지</a>
	<a href="<%=root%>/address/list.jsp" onclick="w3_close()"	class="w3-padding"><i class="fa fa-address-card fa-fw w3-margin-right"></i>주소록</a>
	<a href="#" onclick="logout(),w3_close()"	class="w3-padding"><i class="fa fa-power-off fa-fw w3-margin-right" ></i>로그아웃</a>
	<div><br><br></div>
	<%} %>
	<%if(id!=null && grade.equals("A")){ %>
     <div id="admin"><a href="<%=root %>/admin/list.jsp" onclick="w3_close()"	class="w3-padding"><i class="fa fa-users fa-fw w3-margin-right"></i>회원목록</a></div>
    <%}else if(id!=null){%> 
     <a href="<%=root%>/member/deleteForm.jsp?id=<%=id %>" onclick="w3_close()"	class="w3-padding"><i class="fa fa-remove fa-fw w3-margin-right"></i>회원탈퇴</a>
    <% }%>
    <br>
	 <img src="<%=root%>/menu/images/github.jpg" class="main-img w3-hover-opacity img-rounded w3-margin-left">
	 <a href="https://github.com/DonghyeonG/jsp_blog" target="_blank" onclick="w3_close()">OpenSource</a>
  </div>
  <div class="w3-section w3-padding-top w3-large">
    <a href="#" class="w3-hover-white w3-hover-text-indigo w3-show-inline-block"><i class="fa fa-facebook-official"></i></a>
    <a href="#" class="w3-hover-white w3-hover-text-purple w3-show-inline-block"><i class="fa fa-instagram"></i></a>
    <a href="#" class="w3-hover-white w3-hover-text-yellow w3-show-inline-block"><i class="fa fa-snapchat"></i></a>
    <a href="#" class="w3-hover-white w3-hover-text-red w3-show-inline-block"><i class="fa fa-pinterest-p"></i></a>
    <a href="#" class="w3-hover-white w3-hover-text-light-blue w3-show-inline-block"><i class="fa fa-twitter"></i></a>
    <a href="#" class="w3-hover-white w3-hover-text-indigo w3-show-inline-block"><i class="fa fa-linkedin"></i></a>
  </div>
 
</nav>
<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
<!-- ! CONTENT! -->
<div  class="w3-main main"  >
<!-- </div 는 bottom ! -->

<!-- Menu Button -->
<div id="button_fixed">
<span class="w3-opennav w3-hide-large w3-xxlarge  w3-hover-white" onclick="w3_open()"><i class="fa fa-bars"></i></span> 
</div>
</body>
</html>

