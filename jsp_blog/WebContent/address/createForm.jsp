<%@ page contentType="text/html; charset=UTF-8" %> 
<%	request.setCharacterEncoding("utf-8");  
	String root=request.getContextPath();%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>

<script type="text/javascript">
function input(f) {
	if(f.name.value==""){
		alert("이름을 입력하세요.");
		f.name.focus();
		return false;
	}
	if(f.phone.value==""){
		alert("전화번호를 입력하세요.");
		f.phone.focus();
		return false;
	}
	if(f.zipcode.value==""){
		alert("우편번호를 입력하세요.");
		f.zipcode.focus();
		return false;
	}
	if(f.address1.value==""){
		alert("주소를 입력하세요.");
		f.address1.focus();
		return false;
	}
	if(f.address2.value==""){
		alert("상세주소를 입력하세요.");
		f.address2.focus();
		return false;
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
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2>
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-address-card fa-fw w3-margin-right"></i>Address</button>
</h2><br> 
<div class="container text-center">
<h2 class="text-success">주소 등록</h2><br>
<FORM name='frm' method='POST' action='./createProc.jsp' class="form-horizontal" onsubmit="return input(this)">
 	<div class="form-group">
      <label class="control-label col-sm-3" for="name">이름:</label>
      <div class="col-sm-6">
        <input type="text" name="name" class="form-control" id="name" placeholder="Enter name">
      </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="phone">전화번호:</label>
      <div class="col-sm-6">
        <input type="text" name="phone" class="form-control" id="phone" placeholder="Enter phoneNumber">
      </div>
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="zipcode">우편번호:</label>
 	 <div class="col-sm-2">
       <input type="button" value="우편번호 검색" onclick="sample6_execDaumPostcode()" id="zipcode" class="btn btn-primary">
     </div>
      <div class="col-sm-4">
       <input type="text" name="zipcode" class="form-control" id="sample6_postcode" placeholder="Enter zipcode">
      </div>     
    </div>
 	<div class="form-group">
      <label class="control-label col-sm-3" for="address1">주소:</label>
      <div class="col-sm-6">
        <input type="text" name="address1" class="form-control" id="sample6_address" placeholder="Enter address">
        <input type="text" name="address2" class="form-control" id="sample6_address2" placeholder="Enter address">
      </div>
    </div>

        <input type='submit' value='등록' class="btn btn-success">
  		<input type='button' value='취소' onclick="history.back()" class="btn btn-warning"> 
</FORM>
</div> 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 