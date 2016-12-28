<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
#idcss{
  color: #FF0000;             /* 빨간색 */
  background-color: #FFFF00;  /* 노란색 */
  font-size: 50px;
  text-align: center;
  width: 35%;
  margin: 0 auto;
}
</style>
<link href="./style.css" rel="Stylesheet" type="text/css"> 
</head> 
<body> 
<DIV class='title'>게시판 version 2.0</DIV>
  
  <DIV class='content'>내용</DIV>
  
  <TABLE class='table'>
    <TR>
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>내용</TH>
    </TR>
    <TR>
      <TD>1</TD>
      <TD>월요일</TD>
      <TD>첫눈</TD>
    </TR>
    <TR>
      <TD>2</TD>
      <TD>화요일</TD>
      <TD>메모장 제작</TD>
    </TR>
    <TR>
      <TD>3</TD>
      <TD>수요일</TD>
      <TD>메모장 테스트</TD>
    </TR>
  </TABLE>
 
  <DIV class='content'>
    <A href='http://www.kma.go.kr'>기 상 청</A><br>
  </DIV>  
  
  <DIV id='idcss'>
    <br>
    고유한 CSS 적용
    <br><br>
  </DIV>
  <DIV class='bottom'>하단 메뉴</DIV>
</body> 
</html> 
