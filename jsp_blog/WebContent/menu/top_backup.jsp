<%@ page contentType="text/html; charset=UTF-8" %> 
 
<% String root = request.getContextPath(); %>
 
<html>
<head>
<style type="text/css">
ul#menu li{
/* float:left; */
display : inline;
}
ul#menu{
text-align: center;
}
ul#menu li a{
background-color: black;
color:white;
pading : 10px 20px;
text-decoration:none;
border-radius:4px 4px 0 0;
}
ul#menu li a:hover{
background-color: orange;
}
.toptable{
	width:100%;
}
img#im{
	width:100%;
	height:70%;
}
</style>
</head>
<body>
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table class="toptable">
  <tr>
    <td>
        <img id="im" src="<%=root %>/menu/images/main-03.jpg" width='80%' height='80%'>
    </td>
  </tr>
  
  <tr>
    <td>
    <ul id="menu">
     <li><a href="<%=root %>/index.jsp">홈</a></li>    
     <li><a href="<%=root %>/bbs/list.jsp">게시판목록</a></li>    
     <li><a href="<%=root %>/bbs/createForm.jsp">게시판생성</a></li>    
     <li><a href="<%=root %>/memo/list.jsp">메모목록</a></li>
     <li><a href="<%=root %>/memo/createForm.jsp">메모등록</a></li>
     <li><a href="<%=root %>/team/list.jsp">팀목록</a></li>
     <li><a href="<%=root %>/team/createForm.jsp">팀생성</a></li>   
     <li><a href="<%=root %>/address/list.jsp">주소목록</a></li>
     <li><a href="<%=root %>/address/createForm.jsp">주소생성</a></li>
    </ul>
    </td> 
  </tr>
 
</table>
</div>
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">
