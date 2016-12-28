<%@ page contentType="text/html; charset=UTF-8" %> 
<%  
 	String root=request.getContextPath();
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
<script type="text/javascript">
function inputCheck(f) {
	if(f.id.value==""){
		alert("아이디를 입력해주세요.");
		f.id.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력해주세요.");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("비밀번호를 확인해주세요.");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value!=f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다.");
		f.repasswd.focus();
		return false;
	}
	if(f.mname.value==""){
		alert("이름을 입력해주세요.");
		f.mname.focus();
		return false;
	}
	if(f.email.value==""){
		alert("이메일을 입력해주세요.");
		f.email.focus();
		return false;
	}
	if(f.job.value=="0"){
		alert("직업을 선택해주세요.");
		f.job.focus();
		return false;
	}
}
// 아이디중복체크
function idCheck(id) {
	if(id==""){
		alert("아이디를 입력해주세요.");
		document.frm.id.focus();
	}else{
	var url="id_proc.jsp";
	url+="?id="+id;
	
	var wr=window.open(url,"아이디검색","width=600px,height=500");  //보여줄페이지,새창 제목,크기 설정
	wr.moveTo((window.screen.width-600)/2, (window.screen.height-500)/2);

	}
}
function emailCheck(email) {
	if(email==""){
		alert("이메일을 입력해주세요.");
		document.frm.email.focus();
	}else{
	var url="email_proc.jsp";
	url+="?email="+email;
	
	var wr=window.open(url,"이메일검색","width=600px,height=500");  //보여줄페이지,새창 제목,크기 설정
	wr.moveTo(((window.screen.width-600)/2), ((window.screen.height-500)/2));

	}
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-user fa-fw w3-margin-right"></i>Create account</button>
</h2><br> 
<div class="container text-center">
<h2 class="text-success">회원 가입</h2><br>
<FORM name='frm' method='POST' action='./createProc.jsp' class="form-horizontal"
enctype="multipart/form-data" onsubmit="return inputCheck(this)">
 	<div class="form-group">
      <label class="control-label col-sm-3" for="fname">사진:</label>
      <div class="col-sm-6">
        <input type="file" name="fname" class="form-control" id="fname" accept=".jpg, .gif, .png">
      </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="id">아이디:</label>
      <div class="col-sm-2">
        <input type="text" name="id" class="form-control" id="id" placeholder="Enter id" >
      </div>
      <div class="col-sm-1">
        <input type="button" value="ID중복확인" onclick="idCheck(document.frm.id.value)" class="btn btn-primary">
       </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="passwd">비밀번호:</label>
      <div class="col-sm-6">
        <input type="password" name="passwd" class="form-control" id="passwd" placeholder="Enter password">
      </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="repasswd">비밀번호확인:</label>
      <div class="col-sm-6">
        <input type="password" name="repasswd" class="form-control" id="repasswd" placeholder="Enter password">
      </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="mname">이름:</label>
      <div class="col-sm-6">
        <input type="text" name="mname" class="form-control" id="mname" placeholder="Enter name">
      </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="tel">전화번호:</label>
      <div class="col-sm-6">
        <input type="text" name="tel" class="form-control" id="tel" placeholder="Enter phoneNumber">
      </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="email">이메일:</label>
      <div class="col-sm-4">
        <input type="text" name="email" class="form-control" id="email" placeholder="Enter E-mail" >
      </div>
      <div class="col-sm-1">
        <input type="button" value="Email중복확인" onclick="emailCheck(document.frm.email.value)" class="btn btn-primary">
      </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="zipcode">우편번호:</label>
 	 <div class="col-sm-2">
       <input type="button" value="우편번호  검색" onclick="sample6_execDaumPostcode()" id="zipcode" class="btn btn-primary">
     </div>
      <div class="col-sm-4">
       <input type="text" name="zipcode" class="form-control" id="sample6_postcode" placeholder="Enter postcode">
      </div>     
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="address1">주소:</label>
      <div class="col-sm-6">
        <input type="text" name="address1" class="form-control" id="sample6_address" placeholder="Enter address">
        <input type="text" name="address2" class="form-control" id="sample6_address2" placeholder="Enter address">
      </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="job">직업:</label>
      <div class="col-sm-6">
       <select name="job" class="form-control" id="job">
 		<option value="0">선택하세요</option>     
 		<option value="A01">회사원</option>     
 		<option value="A02">전산관련직</option>     
 		<option value="A03">연구원</option>     
 		<option value="A04">학생</option>     
 		<option value="A05">자영업</option>     
 		<option value="A06">공무원</option>     
 		<option value="A07">의료인</option>     
 		<option value="A08">법조인</option>     
 		<option value="A09">종교/언론/예술인</option>     
 		<option value="A10">etc.</option>     
      </select>
      </div>
    </div>

        <input type='submit' value='회원가입' class="btn btn-success">
  		<input type='button' value='취소' onclick="history.back()" class="btn btn-warning"> 
</FORM>
</div> 
 <jsp:include page="/menu/bottom.jsp" flush="false"/>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 