<%@page import="bbs.Bbs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="bbs.BbsDAO" %>
   <%@ page import="java.io.PrintWriter" %>	
   <% request.setCharacterEncoding("UTF-8");%>
   <jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
   <jsp:setProperty property="bbsTitle" name="bbs"/>
   <jsp:setProperty property="bbsContent" name="bbs"/>

   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 게시판</title>
</head>
<body>

	<%
	
	String userID = null;
	
	if( session.getAttribute("userID") !=null ){
		userID =(String) session.getAttribute("userID");
	}
	
	if( userID == null ){
		
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 해주세요')");
		script.println("location.href ='login.jsp'");
		script.println("</script>");
		
	}
	
	int bbsID = 0;
	
	if( request.getParameter("bbsID") !=null ){
		
		bbsID = Integer.parseInt(request.getParameter("bbsID") );
		
	}
	if( bbsID ==0 ){
		
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 글입니다')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");

	}
	
	
	Bbs bbs2 = new BbsDAO().getBbs(bbsID);
	
	if( !userID.equals(bbs2.getUserID()) ){
		
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");

	}
	else{
		
		if( bbs.getBbsTitle() == null || bbs.getBbsContent()== null  ) {
				
				PrintWriter script =response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
				
				
			}else{
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.update(  bbsID , bbs.getBbsTitle() , bbs.getBbsContent() );
				
				if( result == -1){
					
					PrintWriter script =response.getWriter();
					script.println("<script>");
					script.println("alert('글수정 에 실패 했습니다')");
					script.println("history.back()");
					script.println("</script>");

				}
				else{
					
					
					PrintWriter script =response.getWriter();
					script.println("<script>");
					script.println("location.href ='bbs.jsp'");
					script.println("</script>");

				}

				
			}
		
	}
	


	%>

</body>
</html>