<%@ page contentType="text/html; charset=UTF-8" %> 
<%  
    String root = request.getContextPath();
	request.setCharacterEncoding("utf-8"); 
	String c_id="";//id저장여부
	String c_id_val="";//id저장변수
	 
	Cookie[] cookies = request.getCookies();
	Cookie cookie = null;
	if(cookies!=null){
	for(int i=0; i<cookies.length; i++){
	   cookie = cookies[i];
	   if(cookie.getName().equals("c_id")){
	       c_id = cookie.getValue();
	   }else if(cookie.getName().equals("c_id_val")){
	       c_id_val = cookie.getValue();
	   }
	}
}
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
/*   font-family: gulim;  */
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body> 
<!-- *********************************************** -->
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-key fa-fw w3-margin-right"></i>Login</button>
</h2><br><br>  
<div class="container" >
<FORM name='frm' method='POST' action='<%=root %>/member/loginProc.jsp' class="form-horizontal">
  <div class="form-group">
  <div class="row">
  <h2 class="text-center text-success">DH's Blog</h2>
  <br>
   </div>	
  <div class="form-group">
   <label class="control-label col-sm-4" for="id">아이디:</label>
   <div class="col-sm-4">
     <input type="text" name="id"  value="<%=c_id_val%>" id="id" class="form-control">
   </div>
    
      <label><input type="checkbox" name="c_id" value="Y"  
     <% if(c_id.equals("Y")){%>checked="checked"
     <%}else{ %>
     <%} %>
     >ID저장</label>
     
     <% if(c_id.equals("Y")){%> 
     <script type="text/javascript">
		    	window.onload=function(){document.frm.passwd.focus();}			    	
	 </script>	
	 <%} %>	
	</div>	 
 </div>
 
 <div class="form-group">
   <label class="control-label col-sm-4" for="title">패스워드:</label>
   <div class="col-sm-4">
     <input type="password" name="passwd"  class="form-control" id="title">
   </div>
 </div>
 <br>
<div class="col-sm-5"></div>
    <input type='submit' value='로그인' class="btn btn-success">
    <input type='button' value='회원가입' onclick="location.href='agreement.jsp'" class="btn btn-info">
<br><br><br>
</FORM>
</div>  
    
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 