<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
	//세션
	String grade=(String)session.getAttribute("grade");
	//검색
	String col=Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word"));
	//col.  쓸수 있는 이유는 NULL체크를 했기 때문이다.
	if(col.equals("total")){  //total 체크시,검색어를 지움.
		word="";
	}

	//페이징관련 
	int nowPage=1; //현재 보고있는 페이지,변결될 수 있어요 !
	if(request.getParameter("nowPage")!=null){ //파라미터값이 있을 경우
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage=10;// 페이지당 5개의 레코드를 보여줌
	
	//DB에서 가져올 순번----------------------------------------------
	int sno=((nowPage-1)*recordPerPage)+1;
	int eno=nowPage*recordPerPage;
		
	Map map=new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);
	
	int totalRecord=bdao.total(col,word);
	List<BbsDTO> list=bdao.list(map);
	Iterator<BbsDTO> iter=list.iterator();
	
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
.suggest{  
  width: 270px;
  height: 170px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  overflow-y: auto;
  margin:0 auto;

}
.suggest:hover{
	 border-color: #66afe9;
  	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
}
.suggestList:hover{
	color:blue;
}

</style>
<script type="text/javascript" src="../ajax/httpRequest.js"></script>
<script type="text/javascript">
    var checkFirst = false;
    var lastKeyword = '';
    var loopSendKeyword= false;
function startSuggest(){
	
if(checkFirst == false){
	//0.5초 후에 sendKeyword() 함수를 실행
	setTimeout("sendKeyword();",500);
	loopSendKeyword = true;
	}
	checkFirst = true;
}
//요청 전송
function sendKeyword() {
    // log("키가 눌렸습니다.");
    if(loopSendKeyword == false) return;
    var keyword = document.search.word.value;
    if (keyword == '') {
        lastKeyword = '';
        hide('suggest');  // suggest DIV 태그 감추기
    } else if (keyword != lastKeyword) { // 새로운 키워드 입력 여부 검사
        lastKeyword = keyword; // 새로운 키를 전역변수로 저장
        // 한글이나 특수문자를 UTF-8문자셋으로 변경
        var params = "keyword="+encodeURIComponent(keyword);
        // 요청 전송, 서블릿 주소 지정
        sendRequest("<%=root%>/suggest", params, response, 'post');
    }
    setTimeout("sendKeyword();",500);
}

// 결과 출력
function response() {
    if (httpRequest.readyState == 4) {
        if (httpRequest.status == 200) {
        
            // 응답 문자열 추출
            var resultText = httpRequest.responseText;
            
            //  3|자바001,자바002,자바003
            var result = resultText.split('|');
            
            // 갯수, 문자열을 정수로 변환
            var count = parseInt(result[0]);
            
            var keywordList = null;
            
            if (count > 0) {
                // ,를 구분한 1차원 배열 생성
                keywordList = result[1].split(',');
                
                var html = '';              

              //  alert('keywordList.length: ' + keywordList.length);
                for (var i = 0 ; i < keywordList.length ; i++) {
                
                    //log("keywordList[i]: " + keywordList[i]); 

                    // 특수 문자 표현: " --> \", \ --> \\            
                    html += "<a href=\"javascript:select('"+keywordList[i]+"')\">"+keywordList[i]+"</a><br>";
                    // alert(html);
                }
                
                // 목록을 출력할 DIV 태그
                var listView = document.getElementById('suggestList');
                
                // DIV 태그 값 저장
                listView.innerHTML = html;
                
                // 목록을 가지고 있는 DIV 태그 출력
                show('suggest');
            } else {
                hide('suggest');
            }
        } else {
            alert("에러 발생: "+req.status);
        }
    }
}

//검색된 함목을 클릭하면 검색어를 keyword 태그에 출력하고
//검색 목록은 숨겨 버립니다.
function select(selectedKeyword) {
    document.search.word.value = selectedKeyword;
    
    loopSendKeyword = false;
    checkFirst=false;
    
    hide('suggest');
    document.search.word.focus();
}

function frmSend(f){
    f.submit();
}        

function read(bbsno) {
	var url="read.jsp";
	url+="?bbsno="+bbsno;
	url+="&col=<%=col%>"; 
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url	
}
function down(filename) {
	var url="<%=root%>/download";
	url+="?dir=/bbs/storage";
	url+="&filename="+filename;
	location.href=url;
}
function create(grade) {
	var url="./createForm.jsp";
	if(grade==("A")||grade==("H")){
		location.href=url;		
	}else {	
		if(confirm("회원만 사용할 수 있습니다.\n로그인 하시겠습니까?")){	
			url="<%=root%>/member/loginForm.jsp";
			location.href=url;
		}
	}
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
	<button class="text-left btn-block btn-inverse btn-lg"><i class="fa fa-edit fa-fw w3-margin-right"></i>Bulletin Board</button>
</h2><br>
<div class="container">
<h2 class="text-center text-success">게시판 목록</h2><br>
<div class="table-responsive">
  <TABLE class="table table-hover">
    <TR>
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>성명</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>      
      <TH>파일명</TH>      
           
    </TR>
    <tr>
    <td colspan="8" class="text-danger text-center">공지: 욕설 금지 !</td>
    </tr>
    <%if(list.size()==0){%>
    	<tr>
    		<td colspan="8">등록된 글이 없습니다.</td>
    	</tr>
    <%}else{
    while(iter.hasNext()){
    	BbsDTO dto=iter.next();
    %>
    <tr>
    	<td><%=dto.getBbsno() %></td>
    <td><% 
	for(int i=0;i<dto.getIndent();i++){
		out.print("&nbsp;");
	}
    if(dto.getIndent()>0)
    	out.print("┗Re:");
//     <img src="../images/reply.JPG">
    %>
    	<a href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle() %></a>
    	<%if(Utility.compareDay(dto.getWdate().substring(0,10))){ %>
    	<img src="<%=root %>/menu/images/new.gif">
    	<% }%>
    	</td>
    	
    	<td><%=dto.getWname() %></td>
    	<td><%=dto.getViewcnt() %></td>
    	<td><%=dto.getWdate().substring(0,10) %></td>
    	<td>
    	<%if(dto.getFilename()==null){ 
    		out.print("파일없음");
    	}else{%>
    		<a  href="javascript:down('<%=dto.getFilename()%>')">&nbsp; <span class="glyphicon glyphicon-download-alt"></span>&nbsp;</a>
    	<%}%>
    	</td>  	
    </tr>
    <%} 
  }%>
  </TABLE>
</div> 

    <%=Paging.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
    <br>

<form  name="search" method="POST" action="./list.jsp" class="form-inline text-center">
<select name="col" class="form-control"><!-- 검색할 컬럼 -->
	<option value="wname" 
	<% if(col.equals("wname")) out.print("selected='selected'"); %>
	> 성명</option>
	<option value="title" 
	<% if(col.equals("title")) out.print("selected='selected'"); %>
	>제목</option>
	<option value="content" 
	<% if(col.equals("content")) out.print("selected='selected'"); %>
	>내용</option>
	<option value="total">전체출력</option>
</select>
	<input type="text" name="word" value="<%=word%>"  onkeydown="startSuggest()" size="40" class="form-control"><!-- 검색어,value는 검색어 유지 -->
	<input type="submit" value="검색" class="btn btn-success">
	<input type='button' value='글쓰기' onclick="create('<%=grade%>')" class="btn btn-primary">	

	<!-- 서버로부터 검색된 목록 출력 -->
	

	<div class="row">	
	<div class="text-center"></div>	
		<div class="suggest" id="suggest" style="display:none;" >
	    	<div class="text-center " id="suggestList"></div>
		</div>
	</div>
</form>
</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 