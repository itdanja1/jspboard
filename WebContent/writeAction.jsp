<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="bbs.BbsDAO" %>
   <%@ page import="java.io.PrintWriter" %>	
   <% request.setCharacterEncoding("UTF-8");%>


   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 게시판</title>
</head>
<body>

	<%

	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("storage");

	MultipartRequest multi = new MultipartRequest( request,realFolder,10 * 1024 * 1024,"UTF-8",new DefaultFileRenamePolicy());
	
	String filename = multi.getFilesystemName("file");
	//String originFileName = multi.getOriginalFileName("file");

	//File file = multi.getFile("file");

	
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
		
	}else{
		
		if( multi.getParameter("bbsTitle").equals(null) || multi.getParameter("bbsContent").equals(null)  ) {
				
				PrintWriter script =response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
				
				
			}else{
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write( multi.getParameter("bbsTitle"), userID , multi.getParameter("bbsContent") , filename );
				
				if( result == -1){
					
					PrintWriter script =response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패 했습니다')");
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