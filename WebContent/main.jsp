<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title> 깃허브 업데이트 후 입니다</title>
</head>
<body>


	<% 
		
		String userID = null;
		if( session.getAttribute("userID") !=null){
			
			userID = (String) session.getAttribute("userID");
			
		}
			
			
	
	%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <!-- 메뉴 오른쪽 아이콘 바 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 교육용 게시판</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a>
				<li><a href="bbs.jsp">게시판</a>
			</ul>
			
			<%
			
				if( userID ==null){
			%>		
					<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
					
					
			<%		
				}else{
			%>	
					<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>

						</ul>
					</li>
				</ul>
				
					<%		
				}
			%>
			</div>
		</nav>
		

		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
				<ol class ="carousel-indicators">
					
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1" ></li>
					<li data-target="#myCarousel" data-slide-to="2" ></li>

				</ol>
				
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="images/1.jpg">
					</div>
						<div class="item">
						<img alt="" src="images/2.jpg">
					</div>
						<div class="item">
						<img alt="" src="images/3.jpg">
					</div>
				</div>
				
				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				
					<span class="glyphicon glyphicon-chevron-left"></span>
				
				</a>
				
				<a class="right carousel-control" href="#myCarousel" data-slide="next">
				
					<span class="glyphicon glyphicon-chevron-right"></span>
				
				</a>
				
			</div>
		
		</div>
		
		<p>
		<p>
		<p>
		<p>
		<p>
		<p>
		
		
				<div class ="container">
			<div class="jumbotron">
			
				<div class="container">
					<h2> jsp 연습 홈페이지 </h2>
					<p> 홈페이지에 방문해 주셔서 감사합니다. 자바빈즈를 이용한 회원제 게시판를 제공합니다 </p>
					<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p>
				</div>
			
			</div>
		</div>
		
			
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>