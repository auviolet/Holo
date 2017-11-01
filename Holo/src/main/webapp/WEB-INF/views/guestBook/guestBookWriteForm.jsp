<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>HOLO? YOLO!</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/list/main.css" />
<link rel="stylesheet" href="assets/css/list/tile/main.css" />
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="../include/header.jsp"%>

		<!-- Menu -->
		<%@include file="../include/menu.jsp"%>

		<!-- Main -->
		<div id="main">

			<!-- Pagination -->
			<article>
				<a href="/webapp/guestbookList.do" class="button big next">&lt;&lt;
					Back</a>
			</article>
			<br>

			<!-- Write form -->
			<form method="post" action="/webapp/guestbookInsert.do">
				<!-- Post -->
				<article class="post">
					<header>
						<div class="title">
							<input type="hidden" name="page" value="${cri.page}"> <input
								type="hidden" name="perPageNum" value="${cri.perPageNum}">
							<input type="hidden" name="searchType" value="${cri.searchType}">
							<h2>GuestBook Form</h2>
							<p>자유롭게 본인의 이야기 보따리를 풀어보세용</p>
							<div class="12u$">
								<!-- <div class="select-wrapper">
									<select name="demo-category" id="demo-category">
										<option value="">▼ Category </option>
										<option value="1">Manufacturing</option>
										<option value="1">Shipping</option>
										<option value="1">Administration</option>
										<option value="1">Human Resources</option>
									</select>
								</div> -->
							</div>
							<br>
							<div class="12u$">
								<input type="text" name="guestbook_subject" id="demo-name"
									value="" placeholder="Subject" autofocus="autofocus" />
							</div>
						</div>
						<div class="meta">
							<%-- <time class="published">${today}</time> --%>
							<input type="text" name="guestbook_writer" readonly="readonly"
								value=<%=session.getAttribute("memberNickname")%>></input>
							<!-- <a href="#" class="author"><span class="name"></span><img src="../../images/avatar.jpg" alt="" /></a> -->
						</div>
					</header>


					<section>
						<div class="row uniform">
							<div class="12u$">
								<textarea name="guestbook_content" id="demo-message"
									placeholder="Enter your content" rows="6"></textarea>
							</div>
							<div class="12u$">
								<ul class="actions">
									<li><input type="submit" value="Send" /></li>
									<li><input type="reset" value="Reset" /></li>
								</ul>
							</div>
						</div>
					</section>
				</article>
			</form>
		</div>

		<!-- Sidebar -->
		<%@include file="../include/sidebar.jsp"%>
	</div>

	<!-- Scripts -->
	<script src="assets/js/list/jquery.min.js"></script>
	<script src="assets/js/list/skel.min.js"></script>
	<script src="assets/js/list/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/list/main.js"></script>

</body>
</html>