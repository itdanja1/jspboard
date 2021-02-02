<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  <%// 자주 사용하는 인코딩 [여러나라 가능] %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 회원제 게시판 </title>
</head>
<body>
	
			<%
						

						String filename = request.getParameter("file");
						String filename2 = new String(filename.getBytes("UTF-8"),"8859_1");
						File file = new File("D:/jsp/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BBS/storage/"+filename);
						byte b[] = new byte[(int)file.length()];
						response.setHeader("Content-Disposition", "attachment;filename=" + filename2 + ";");
						               
						if (file.isFile())
						{
							BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
							BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
							int read = 0;
							while ((read = fin.read(b)) != -1){
								outs.write(b,0,read);
							}
							outs.close();
							fin.close();
						}
						
						
						%>


</body>
</html>