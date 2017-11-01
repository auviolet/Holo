<%@page import="com.holo.vo.BistroVO"%>
<%@page import="com.holo.vo.GPAVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<title>HOLO? YOLO!</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/data_result/main.css" />

<style>
.data_result_num{
	font-size: 500%;
	padding : 0 80px 0 80px;
}
.data_result_actions{
	display:inline;
	margin-left: 50px;
	margin-right: 50px;
}

</style>
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
			<section id="intro">
				<header>
					<div class="title">

						<!-- Total Data HOLO?YOLO!  -->
						<div class="cont_number" style="text-align: center;">
							<div class="subject_area">
								<div class="inner_subject inner_number">
									<h2 class="txt_tistory tit_number" id="sectionNumber">
										Total DataSet <span class="btn btn-default"
											data-toggle="tooltip" data-placement="bottom"
											title="HOLO YOLO의 데이터를 기준으로 올해의 숫자를 도출했습니다."><i
											class="fa fa-gear fa-spin" style="font-size: 24px"></i></span>
									</h2>
								</div>
							</div>
						</div>
					</div>
				</header>
			</section>

			<!-- Post -->
			<article class="post">
				<!-- <div class="title">
					<h2>
						<a>숫자로 보는 HOLO?YOLO!</a>
					</h2>
				</div> -->
				<div class="info_area" style="text-align: center; display: inline;">
					<div class="tab_number">
						<div>
							<span class="data_result_num"> <%=request.getAttribute("memberCount")%>
							</span> <span class="data_result_num"> <%=request.getAttribute("bistroCount")%>
							</span> <span class="data_result_num"> <%=request.getAttribute("guestbookCount")%>
							</span>
						</div>
						<div class="data_result_actions">
							<span> <span class="bg_num"> </span> <span
								class="txt_tistory txt_writing"> <img
									src="images/data_result/img1.PNG"
									onmouseenter="this.src='images/data_result/img1_1.PNG'"
									onmouseleave="this.src='images/data_result/img1.PNG'" />
							</span> <span class="ico_tistory ico_dot"></span>
							</span> <span> <span class="txt_tistory txt_visitant"> <img
									src="images/data_result/img2.PNG"
									onmouseenter="this.src='images/data_result/img2_1.PNG'"
									onmouseleave="this.src='images/data_result/img2.PNG'" />
							</span> <span class="ico_tistory ico_dot"></span>
							</span> <span> <span class="bg_num"> <span
									class="ico_num num_7"></span> <span class="ico_num num_5"></span>
									<span class="ico_num num_3"></span>
							</span> <span class="txt_tistory txt_hits"> <img
									src="images/data_result/img3.PNG"
									onmouseenter="this.src='images/data_result/img3_1.PNG'"
									onmouseleave="this.src='images/data_result/img3.PNG'" />
							</span> <span class="ico_tistory ico_dot"></span>
							</span>
						</div>
					</div>
				</div>
				<!-- End into area -->
			</article>

			<!-- Post -->
			<article class="post">
				<div class="title">
					<h2>
						<a href="#">통계로 보는 HOLO? YOLO!</a>
					</h2>
				</div>
				<hr>
			<div id="user_data">
			
			<ul style="list-style:none; overflow: auto;" >
			<li style="float:left;"><h3>User가 많이 검색한 검색어</h3><div><img src="images/data_result/search.png" style="width: 455px;"></div></li>
			<li style="float:left;"><h3>HOLO?YOLO! 남녀 비율</h3><div><img src="images/data_result/sex.png" style="width: 455px;"></div></li>
			</ul>
			<ul style="list-style:none; overflow: auto;">
				<li><h3>HOLO YOLO의 활발한 User</h3><div><img src="images/data_result/Rplot.png" style="width: 80%;"></div></li>
			</ul>
			
			</div>	
				
			</article>

			<!-- Post -->
			<article class="post">

				<div class="title">
					<h2>
						<a href="#">유저가 뽑은 BEST 맛집 TOP 5</a>
					</h2>
				</div>
				<%
					List<GPAVO> gpalist = (List<GPAVO>) request.getAttribute("gpalist");
					if (gpalist != null && gpalist.size() >= 5) {
						for (GPAVO gpavo : gpalist) {
							//BistroVO bvo = (BistroVO) request.getAttribute("bvo");
				%>
				<div class="panel-group" id="accordion" style="width: 900px">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<table>
									<td style="float: left"><a
										href="/webapp/listOne.do?bistro_idx=<%=gpavo.getBistro_idx()%>">
											<img src="images/list/food/f<%=gpavo.getBistro_idx()%>.PNG"
											style="width: 120px;"></td>
									</a>
									<td style="float: left; font-size: 13px"><a
										href="/webapp/listOne.do?bistro_idx=<%=gpavo.getBistro_idx()%>">
											<p style="font-size: 16px; margin: 0"><%=gpavo.getBistro_name()%></p>
									</a> 키워드 : <%=gpavo.getBistro_keyword()%><br> 위치 : <%=gpavo.getBistro_addr()%><br>
										시간 : <%=gpavo.getBistro_office_hour()%><br> 전화번호 : <%=gpavo.getBistro_tel()%>
									</td>
									<td style="float: right;">
										<div style="margin: 15px; font-size: 20px">
											평점 :
											<%=gpavo.getReviewAvg()%>점
										</div>
										<div style="margin: 15px">
											<div
												style="CLEAR: both; PADDING: 0px; BACKGROUND: url(images/list_sub/icon_star2.gif) 0px 0px; MARGIN: 0px; WIDTH: 90px; HEIGHT: 18px;">
												<p
													style="WIDTH: <%=gpavo.getReviewAvg() * 10%>%; PADDING:0px; BACKGROUND: url(images/list_sub/icon_star.gif) 0px 0px; MARGIN: 0px; HEIGHT: 18px">
												</p>
											</div>
										</div>
									</td>
									<td></td>
								</table>
							</h4>
						</div>
					</div>
					<%
						}
						} else {
					%>
					<div class="container">
						<div class="panel-group" id="accordion" style="width: 700px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">올해의 맛집을 준비중입니다. 잠시만 기다려 주세요~</h4>
								</div>
							</div>

							<%
								}
							%>
						</div>
					</div>

				</div>
			</article>

		</div>
		<!--// main -->

		
		<!-- Sidebar -->
		<section id="sidebar">


			<!-- About -->
			<section class="blurb">
				<h2>About</h2>
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus
					nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus
					porttitor magna enim, ac accumsan tortor cursus at phasellus sed
					ultricies.</p>
			</section>

			<!-- Footer -->
			<section id="footer">
				<ul class="icons">
					<li><a class="fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a class="fa-facebook"><span class="label">Facebook</span></a></li>
					<li><a class="fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a class="fa-rss"><span class="label">RSS</span></a></li>
					<li><a class="fa-envelope"><span class="label">Email</span></a></li>
				</ul>
				<p class="copyright">
					&copy; Untitled. Company: <a href="/webapp/list.do">HOLO?YOLO!</a>.
				</p>
			</section>
		</section>

	</div>
	<!--// Wrapper -->



	<!-- Scripts -->
	<script src="assets/js/data_result/jquery.min.js"></script>
	<script src="assets/js/data_result/skel.min.js"></script>
	<script src="assets/js/data_result/util.js"></script>
	<!--[if lte IE 8]><![endif]-->
	<script src="assets/js/data_result/ie/respond.min.js"></script>
	<script src="assets/js/data_result/main.js"></script>
</body>
</html>