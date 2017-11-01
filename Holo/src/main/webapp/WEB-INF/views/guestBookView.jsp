<%@page import="com.holo.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.holo.vo.GuestBookVO, java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<!--
	방명록 한 글 남기기 페이지
	stylesheet : assets/css/guest_book/guestBook.css
-->
<html>
<head>
<title>HOLO? YOLO!</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/guest_book/guestBook.css">

<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
 <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
ul.pagination {
    display: inline-block;
    padding: 0;
    margin: 0;
}

ul.pagination li {display: inline;}

ul.pagination li a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
}

ul.pagination li a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
}

ul.pagination li a:hover:not(.active) {background-color: #ddd;} 
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

			<div class="bskr-title-ex">
				<article>
					<a href="/webapp/guestbookWrite.do" class="button big next">write</a>
				</article>
			</div>

			<br>
			<%
				List<GuestBookVO> list = (List<GuestBookVO>) request.getAttribute("list");

				if (list != null) {
					for (GuestBookVO gbvo : list) {
			%>

			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#"><%=gbvo.getGuestbook_subject()%></a>
						</h2>
						<!-- <p>앙하하하하테스트중입니다.</p> -->
					</div>
					<div class="meta">
						<div><%=gbvo.getGuestbook_regdate()%></div>
						<div class="author" style="border: none; display: inline;">
							<%=gbvo.getGuestbook_writer()%>
							<%
								if (!session.getAttribute("memberNickname").equals(gbvo.getGuestbook_writer())) {
									MemberVO mvo = new MemberVO();
									mvo.setMember_nickname(gbvo.getGuestbook_writer());
									mvo.setMember_id(gbvo.getMember_id());
									mvo.setMember_sex(gbvo.getMember_sex());
							%>
							<button id="myBtn" class="btn" data-toggle="modal" data-target="#myModal" data-whatever=<%=gbvo.getGuestbook_writer() %> style="font-size:24px;color:gray;"><i class="fa fa-user-plus"></i></button>
							<%
								}
							%>
						</div>
						<div>
							Level (<%=gbvo.getMember_level()%>)
						</div>
					</div>
				</header>
				<a href="#" class="image featured"></a>
				<p><%=gbvo.getGuestbook_content()%></p>
				<footer>
					<ul class="actions">
						<%
							if (session.getAttribute("memberNickname").equals(gbvo.getGuestbook_writer())) {
								
						%>
						
						<%-- 
						<li><button
								onclick="location.href='/webapp/guestbookUpdate.do?guestbook_idx=<%=gbvo.getGuestbook_idx()%>&guestbook_subject=<%=gbvo.getGuestbook_subject()%>&guestbook_content=<%=gbvo.getGuestbook_content()%>''">Update</button></li>
						 --%>
						<li><button
								onclick="location.href='/webapp/guestbookDelete.do?guestbook_idx=<%=gbvo.getGuestbook_idx()%>'">delete</button></li>
						<%
							}
						%>
					</ul>
					<ul class="stats">
						<li><a href="#" class="icon fa-heart"><%=gbvo.getGuestbook_hit()%></a></li>
						<li><a href="#" class="icon fa-comment">128</a></li>
					</ul>
				</footer>
			</article>

			<%
				}
				}
			%>

		<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h2 class="modal-title">User Information</h2>	
							</div>
							<div class="modal-body">
								<div>
										<p>Member ID : <output id="m_id"></output></p>
										<p>Member Sex : <output id="m_sex"></output></p>
									</div>
								
								<hr style="margin: 1em 0 1em 0">
								<form id="MessageForm" method="post" action="#">
									<div class="field half first" style="display: inline;">
										<label for="recipient-name" class="control-label">To</label> 
											<input type="text" name="note_receiver" id="recipient" class="form-control"/> 
										<label for="name">From</label> 
											<input type="text" name="note_writer" id="sender" readonly="readonly" value="<%=session.getAttribute("memberNickname")%>" />
									</div>
									<div class="field">
										<label for="message">Message</label>
										<textarea name="note_content" id="message" rows="4" placeholder="Try to Message"></textarea>
									</div>
									<br>
									<ul class="actions">
										<li><button type="submit" id="mSend" class="btn btn-primary btn-sm btn-block"><i class="fa fa-envelope"></i>Send Message</button></li>
										<li><button type="reset">Reset</button></li>
									</ul>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="button small" data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div><!-- //End Modal -->

			<!-- 페이징 처리위한 -->
		
			<div class="box-footer" style="text-align: center;">

					<div class="text-center">
						<ul class="pagination">
							<c:if test="${guestPageMaker.prev}">
								<li><a
									href="guestbookList.do${guestPageMaker.makeSearch(guestPageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${guestPageMaker.startPage }"
								end="${guestPageMaker.endPage }" var="idx">
								<li
									<c:out value="${guestPageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="guestbookList.do${guestPageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${guestPageMaker.next && guestPageMaker.endPage > 0}">
								<li><a
									href="guestbookList.do${guestPageMaker.makeSearch(guestPageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- End box-footer (페이징 처리위한) -->

				<!-- Sidebar -->
				<%@include file="include/sidebar.jsp"%>

			</div>
		</div>
	


	<!-- modal창 Script -->
	<script>

 $('#myModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  //var recipient = button.data('whatever') // Extract info from data-* attributes
	  var recipient = button.data('whatever');
	  
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	 
	  
	  var modal = $(this)
	  modal.find('#note_writer').val(recipient)
	});
 
	$('#mSend').click(function(){
		var dom = document.getElementById("MessageForm");
		var formData = $("#MessageForm").serialize();
		 $.ajax({
			  type : "GET",
			  url : "/webapp/notesInsert.do",
			  data: formData,
			  error : onError
		  });
		
	});
	
	function onError(data, status){alter("error");}
	
</script>
	<!-- Scripts -->
	<script src="assets/js/guest_book/skel.min.js"></script>
	<script src="assets/js/guest_book/util.js"></script>
	<script src="assets/js/guest_book/ie/respond.min.js"></script>
	<script src="assets/js/guest_book/guestbook.js"></script>

</body>
</html>