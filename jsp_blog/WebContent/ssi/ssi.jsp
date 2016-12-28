<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="bbs.*" %>
<%@ page import="memo.*" %>
<%@ page import="team.*" %>
<%@ page import="address.*" %>
<%@ page import="member.*" %>
<%@ page import="images.*" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="bdao" class="bbs.BbsDAO"/>
<jsp:useBean id="mdao" class="memo.MemoDAO"/>
<jsp:useBean id="tdao" class="team.TeamDAO"/>
<jsp:useBean id="adao" class="address.AddressDAO"/>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="idao" class="images.ImagesDAO"/>
<% request.setCharacterEncoding("utf-8");  
 	String root=request.getContextPath();
%>