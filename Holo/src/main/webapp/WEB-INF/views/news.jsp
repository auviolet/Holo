<%@page import="com.holo.vo.NoteVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.holo.vo.NewsVO,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="assets/css/mypage/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>HOLO?YOLO!</title>
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="include/header.jsp"%>


		<!-- Menu -->
		<%@include file="include/menu.jsp"%>


		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<article class="post">
			
			<header style="height:100px">
			
			<div class="title">
				<h2>HOLO NEWS</h2>
			</div>
			</header>
			
			<%   
				List<NewsVO> newsList = (List<NewsVO>) request.getAttribute("newsList");
				for(NewsVO nvo : newsList) {
				 
			%>

			<section>
				<ul>
					<li>
					<h2>
					<a href="<%=nvo.getUrl()%>">
						<%=nvo.getTitle() %>
					</a>
					</h2>
					
					<%=nvo.getContent() %>
					
					</li>
					
				</ul>
		<%
				}
		%>

			</section> 
			
			</article>


			<!-- Pagination -->
			<ul class="actions pagination">
				<li><a href="" class="disabled button big previous">Previous
						Page</a></li>
				<li><a href="#" class="button big next">Next Page</a></li>
			</ul>

		</div>

		<!-- Sidebar -->
		<%@include file="include/sidebar.jsp"%>

	</div>

	<!-- Scripts -->
	<script src="assets/js/list/jquery.min.js"></script>
	<script src="assets/js/list/skel.min.js"></script>
	<script src="assets/js/list/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/list/main.js"></script>

</body>
</html>