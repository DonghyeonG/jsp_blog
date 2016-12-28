<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");
	
	boolean flag=dao.loginCheck(id,passwd);
	String grade =null;
	String mname =null;
	String fname =null;
	if(flag){
		Map map=dao.getInfo(id);
		grade=(String)map.get("grade");
		mname=(String)map.get("mname");
		fname=(String)map.get("fname");
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		session.setAttribute("mname", mname);
		session.setAttribute("fname", fname);
	}
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-key fa-fw w3-margin-right"></i>Login</button>
</h2><br><br>  
<div class="container text-center">
<h2 class="text-success">처리 결과</h2><br>
<% 
if(flag){
    session.setAttribute("id", id);
    session.setAttribute("grade", grade);
    out.print("로그인이 되었습니다.");
    // ---------------------------------------------- 
    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
    // ---------------------------------------------- 
    Cookie cookie = null; 
       
    String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 (체크박스 체크여부)
       
    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
      cookie.setMaxAge(3600);               // 유지시간  3600초=1시간
      response.addCookie(cookie);          // 쿠키 기록 
   
      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
      cookie.setMaxAge(3600);               // 1시간 유지 
      response.addCookie(cookie);          // 쿠키 기록  
         
    }else{ 
      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
      cookie.setMaxAge(0); 
      response.addCookie(cookie); 
         
      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
      cookie.setMaxAge(0); 
      response.addCookie(cookie); 
    } 
    // --------------------------------------------- 
 
    
}else{
    out.print("id와 passwd가 일치하지 않습니다.");    
}
%>
<br><br><br>
</div> 

<DIV class='bottom'>
  <input type="button" value='홈' onclick="location.href='../index.jsp'" class="btn btn-success">
<%if(!flag){ %>
  <input type='button' value='다시시도' onclick="history.back()" class="btn btn-warning">
  <%} %>
</DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 