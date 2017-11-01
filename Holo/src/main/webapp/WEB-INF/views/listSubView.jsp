<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.holo.vo.BistroVO, com.holo.vo.BlogVO, com.holo.vo.ReviewVO, com.holo.vo.GPAVO,java.util.List"%>

<!DOCTYPE HTML>
<html>
<head>
<title>HOLO?YOLO!</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/list_sub/main.css" />
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
			<%
				if (request.getAttribute("bvo") != null) {
					BistroVO bvo = (BistroVO) request.getAttribute("bvo");
			%>

			<article class="post">
				<header>
					<div class="title" style="width: 55%">
						<h2>
							<a href="#"><%=bvo.getBistro_name()%></a>
						</h2>
						<img src="images/list/food/f<%=bvo.getBistro_idx()%>.PNG"
							style="width: 100%;"> <br>
						<h3>가격정보</h3>
						<img
							src="images/list/food/main_menu/f<%=bvo.getBistro_idx()%>.PNG"
							style="width: 100%;">

					</div>
					<div class="meta"
						style="width: 45%; text-align: left; padding: 30px">
						<h3>매장정보</h3>
						<p>
							대표키워드 :
							<%=bvo.getBistro_keyword()%></p>
						<p>
							영업시간 :
							<%=bvo.getBistro_office_hour()%></p>
						<p>
							전화번호 :
							<%=bvo.getBistro_tel()%></p>
						<p>
							위치 : <span id="address"><%=bvo.getBistro_addr()%></span>
						</p>
						<hr>
						<p>
							<%=bvo.getBistro_comment()%></p>
						<hr>
						<h3>지도</h3>
						<div id="map" style="width: 90%; height: 300px;"></div>
					</div>
				</header>


				<footer>
					<div style="width: 100%">
						<div>
							<h3>한 줄 평</h3>
							<hr style="margin: 10px;">
						</div>
						<div>
							<%
								List<GPAVO> glist = (List<GPAVO>) request.getAttribute("glist");

									for (GPAVO vo : glist) {
							%>
							<ul style="list-style: none; overflow: auto; margin: 1em 0 0 0;">
								<li style="float: left;">
									<p style="width: 50px; margin: 0">평점 :</p>
								</li>
								<li style="float: left; margin: 5px; padding-left: 0">
									<div
										style="CLEAR: both; PADDING: 0px; BACKGROUND: url(images/list_sub/icon_star2.gif) 0px 0px; MARGIN: 0px; WIDTH: 90px; HEIGHT: 18px;">
										<p
											style="WIDTH: <%=vo.getReviewAvg() * 10%>%; PADDING: 0px; BACKGROUND: url(images/list_sub/icon_star.gif) 0px 0px; MARGIN: 0px; HEIGHT: 18px;"></p>
									</div>
								</li>
								<li style="float: left; padding-left: 0">
									<p style="margin: 0"><%=vo.getReviewAvg()%>점(참여
										<%=vo.getCount()%>명)
									</p>
								</li>
							</ul>
							<%
								}
							%>
						</div>
						</li> <br>
						<div>
							<form method="post" action="/webapp/reviewInsert.do"
								style="width: 100%">
								<input type="hidden" name="action" value="insert"> <input
									type="hidden" name="url"
									value="listOne.do?bistro_idx=<%=bvo.getBistro_idx()%>">
								<ul style="list-style: none; overflow: auto;">
									<li style="float: left; width: 12%">
										<div
											style="CLEAR: both; PADDING: 0px; BACKGROUND: url(images/list_sub/icon_star2.gif) 0px 0px; FLOAT: left; MARGIN: 0px; WIDTH: 90px; HEIGHT: 18px;">
											<p id="stargrade"
												style="PADDING: 0px; BACKGROUND: url(images/list_sub/icon_star.gif) 0px 0px; MARGIN: 0px; HEIGHT: 18px;"></p>
										</div>
									</li>
									<li style="float: left; width: 8%"><select
										id="review_grade" onchange="star()" name="review_grade">
											<option value="0">0점</option>
											<option value="1">1점</option>
											<option value="2">2점</option>
											<option value="3">3점</option>
											<option value="4">4점</option>
											<option value="5">5점</option>
											<option value="6">6점</option>
											<option value="7">7점</option>
											<option value="8">8점</option>
											<option value="9">9점</option>
											<option value="10" selected="selected">10점</option>
									</select></li>
									<li style="float: left; width: 65%"><textarea
											name="review_comment" rows="2"
											style="margin: 0; resize: none"></textarea></li>
									<li style="float: left; width: 10%"><span> <input
											type="submit" value="send" style="height: 80px" />
									</span></li>
								</ul>
							</form>
						</div>
						<br>
						<table style="padding: 0; margin: 0">
							<%
								List<ReviewVO> list = (List<ReviewVO>) request.getAttribute("list");

									if (list != null) {
										int listsize = 0;
										if (list.size() < 5) {
											listsize = list.size();
										} else {
											listsize = 5;
										}

										for (int i = 0; i < listsize; i++) {
											ReviewVO rvo = new ReviewVO();
											rvo = list.get(i);
							%>

							<tr style="width: 100%" id="reviews">
								<td style="width: 10%">
									<div class="review_grade">
										<div
											style="CLEAR: both; PADDING: 0px; BACKGROUND: url(images/list_sub/icon_star2.gif) 0px 0px; FLOAT: left; MARGIN: 0px; WIDTH: 90px; HEIGHT: 18px;">
											<p
												style="WIDTH: <%=rvo.getReview_grade()%>0%; PADDING:0px; BACKGROUND: url(images/list_sub/icon_star.gif) 0px 0px; MARGIN: 0px; HEIGHT: 18px;">
											</p>
										</div>
									</div>
								</td>
								<td style="width: 80%">
									<div class="review_comment">
										<p style="margin: 0px"><%=rvo.getReview_comment()%>
										</p>
										<em style="margin: 0px; font-size: 9pt; color: blue"><%=rvo.getMember_nickname()%></em>
										<span style="margin: 0px; font-size: 9pt;"><em><%=rvo.getReview_date()%></em></span>
									</div>
								</td>
								<%
									if (session.getAttribute("member_id").equals(rvo.getMember_id())) {
								%>
								<td>
									<button
										onclick="location.href='/webapp/reviewDelete.do?review_idx=<%=rvo.getReview_idx()%>'">delete</button>
								</td>
								<%
									} else {
								%>
								<td></td>
								<%
									}
								%>
							</tr>
							<%
								}
									}
							%>
						</table>
						<%
							if (list != null) {

									for (int i = 5; i < list.size(); i++) {
										ReviewVO rvo = new ReviewVO();
										rvo = list.get(i);
						%>
						<table style="padding: 0; margin: 0; display: none"
							class="morereviews">
							<tr style="width: 100%;">
								<td style="width: 10%">
									<div class="review_grade">
										<div
											style="CLEAR: both; PADDING: 0px; BACKGROUND: url(images/list_sub/icon_star2.gif) 0px 0px; FLOAT: left; MARGIN: 0px; WIDTH: 90px; HEIGHT: 18px;">
											<p
												style="WIDTH: <%=rvo.getReview_grade()%>0%; PADDING:0px; BACKGROUND: url(images/list_sub/icon_star.gif) 0px 0px; MARGIN: 0px; HEIGHT: 18px;">
											</p>
										</div>
									</div>
								</td>
								<td style="width: 80%">
									<div class="review_comment">
										<p style="margin: 0px"><%=rvo.getReview_comment()%>
										</p>
										<em style="margin: 0px; font-size: 9pt; color: blue"><%=rvo.getMember_nickname()%></em>
										<span style="margin: 0px; font-size: 9pt;"><em><%=rvo.getReview_date()%></em></span>
									</div>
								</td>
								<%
									if (session.getAttribute("member_id").equals(rvo.getMember_id())) {
								%>
								<td>
									<button
										onclick="location.href='/webapp/reviewDelete.do?review_idx=<%=rvo.getReview_idx()%>'">delete</button>
								</td>
								<%
									} else {
								%>
								<td></td>
								<%
									}
								%>
							</tr>
						</table>
						<%
							}
								}
						%>

					</div>
				</footer>
				<script>
					function moreComment() {
						var x = document.getElementsByClassName("morereviews");
						for (i = 0; i < x.length; i++) {
							x[i].style.display = "block";
						}
					}
				</script>
				<br>
				<footer>
					<ul class="actions">
						<li><a href="/webapp/list.do" class="button big">리스트페이지로</a></li>
					</ul>
					<ul class="stats">
						<button id="moreComment" onclick="moreComment()">댓글 더 보기
						</button>
					</ul>
				</footer>


				<section>
					<div id="blog">
						<h3>추천블로그</h3>
						<c:forEach items="${blogList }" var="b">
							<h4>
								<a href="${b.link }" target="_blank">${b.title}</a>
							</h4>
							<blockquote>${b.description}</blockquote>
						</c:forEach>
						<!-- <a href="javascript:moreList();" class="button small fit" width="100px">더보기</a> -->
					</div>
					<div>

						<table>
						</table>
					</div>

				</section>
			</article>

			<!-- Pagination -->
			<ul class="actions pagination">
				<%
					if (bvo.getBistro_idx() == 1) {
				%>
				<li><a
					href="/webapp/listOne.do?bistro_idx=<%=bvo.getBistro_idx() - 1%>"
					class="disabled button big previous">Previous Page</a></li>
				<li><a
					href="/webapp/listOne.do?bistro_idx=<%=bvo.getBistro_idx() + 1%>"
					class="button big next">Next Page</a></li>
				<%
					} else if (bvo.getBistro_idx() == 100) {
				%>
				<li><a
					href="/webapp/listOne.do?bistro_idx=<%=bvo.getBistro_idx() - 1%>"
					class="button big next">Previous Page</a></li>
				<li><a
					href="/webapp/listOne.do?bistro_idx=<%=bvo.getBistro_idx() + 1%>"
					class="disabled button big previous">Next Page</a></li>
				<%
					} else {
				%>
				<li><a
					href="/webapp/listOne.do?bistro_idx=<%=bvo.getBistro_idx() - 1%>"
					class="button big next">Previous Page</a></li>
				<li><a
					href="/webapp/listOne.do?bistro_idx=<%=bvo.getBistro_idx() + 1%>"
					class="button big next">Next Page</a></li>
				<%
					}
					}
				%>
			
		</div>

		<!-- Sidebar -->
		<%@include file="include/sidebar.jsp"%>


	</div>

	<!-- Scripts -->
	<script src="assets/js/list_sub/jquery.min.js"></script>
	<script src="assets/js/list_sub/skel.min.js"></script>
	<script src="assets/js/list_sub/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/list_sub/main.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEPI_mN80TEGj4b73KMt76L8AkIPM8BAw&callback=initMap"
		async defer></script>
	<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
	<script>
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 16,
			});
			var geocoder = new google.maps.Geocoder();
			geocodeAddress(geocoder, map);
		}

		function geocodeAddress(geocoder, resultsMap) {
			var address = document.getElementById('address').textContent;
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === google.maps.GeocoderStatus.OK) {
									resultsMap
											.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker({
										map : resultsMap,
										position : results[0].geometry.location
									});
								} else {
									alert('Geocode was not successful for the following reason: '
											+ status);
								}
							});
		}

		function star() {
			var x = document.getElementById("review_grade").value;
			if (x == 0) {
				$("#stargrade").css("width", "0%");
			} else if (x == 1) {
				$("#stargrade").css("width", "10%");
			} else if (x == 2) {
				$("#stargrade").css("width", "20%");
			} else if (x == 3) {
				$("#stargrade").css("width", "30%");
			} else if (x == 4) {
				$("#stargrade").css("width", "40%");
			} else if (x == 5) {
				$("#stargrade").css("width", "50%");
			} else if (x == 6) {
				$("#stargrade").css("width", "60%");
			} else if (x == 7) {
				$("#stargrade").css("width", "70%");
			} else if (x == 8) {
				$("#stargrade").css("width", "80%");
			} else if (x == 9) {
				$("#stargrade").css("width", "90%");
			} else if (x == 10) {
				$("#stargrade").css("width", "100%");
			}

		}
	</script>
</body>
</html>