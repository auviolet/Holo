<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.holo.vo.BistroVO, com.holo.vo.BistroCriteria, java.util.List"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>YOLO?HOLO!</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/list/main.css" />
<link rel="stylesheet" href="assets/css/list/tile/main.css" />
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
				<header>
					
				</header>

				<section class="tiles">
					<%
						int i = 1; //배경색 지정을 위한 변수
						List<BistroVO> list = (List<BistroVO>) request.getAttribute("list");
						if (list != null) {
							for (BistroVO vo : list) {
					%>
					<article class="style<%=i%>">
						<span class="image"> <img src="images/list/food/f<%=vo.getBistro_idx()%>.PNG"
							alt="" height="240px" />
						</span> <a href="/webapp/listOne.do?bistro_idx=<%=vo.getBistro_idx()%>">
							<h2><%=vo.getBistro_name()%></h2>
							<div class="content">
								<p><%=vo.getBistro_keyword()%></p>
							</div>
						</a>
					</article>
					<%
								//타일 이미지처리 배경색부분 처리
								if (i == 6) {
									i = 1;
								} else {
									i++;
								}
							}
						}
					%>
				</section>

			</article>
			
			
		<!-- 페이징 처리위한 -->
		
			<div class="box-footer" style="text-align: center;">

					<div class="text-center">
						<ul class="pagination">
							<c:if test="${bistroPageMaker.prev}">
								<li><a
									href="list.do${bistroPageMaker.makeSearch(bistroPageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${bistroPageMaker.startPage }"
								end="${bistroPageMaker.endPage }" var="idx">
								<li
									<c:out value="${bistroPageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list.do${bistroPageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${bistroPageMaker.next && bistroPageMaker.endPage > 0}">
								<li><a
									href="list.do${bistroPageMaker.makeSearch(bistroPageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
<!-- /.box-footer-->

<!-- 페이징 처리위한 -->

			<!-- <article style="text-align: center;">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#">10</a></li>
						<li><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</article> -->


		</div>

		<!-- Sidebar -->
		<%@include file="include/sidebar.jsp"%>

	</div>

	<!-- Scripts -->
	<script src="assets/js/list/jquery.min.js"></script>
	<script src="assets/js/list/skel.min.js"></script>
	<script src="assets/js/list/util.js"></script>
	<script src="assets/js/list/main.js"></script>

</body>
</html>