<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.holo.vo.MemberVO, java.util.List"%>
<section id="menu">
	<!-- 로그인 -->
	<section>


		<%if(request.getAttribute("vo") != null) { 

			MemberVO vo = (MemberVO)request.getAttribute("vo");
			 vo.getMember_name(); 
		}%>
		<h1><%=session.getAttribute("memberNickname")%>님 로그인<i class="fa fa-spinner fa-spin" style="font-size:24px"></i></h1>

	</section>

	<!-- Links -->
	<section>
		<ul class="links">
			<li><a href="/webapp/news.do">
					<h3><i class="fa fa-newspaper-o" style="font-size:24px"></i> HOLO NEWS</h3>
					<p>HOT ISSUE TOP 10</p>
			</a></li>
			<!-- <li><a href="managerView.jsp">
					<h3><i class="fa fa-bookmark-o" style="font-size:24px"></i>  BookMark</h3>
					<p>My BookMark</p>
			</a></li> -->
			<li><a href="/webapp/mypage.do">
					<h3><i class="fa fa-vcard-o" style="font-size:24px"></i> My Page</h3>
					<p>My Information</p>
			</a></li>
		</ul>
	</section>

	<!-- Actions -->
	<section>
		<ul class="actions vertical">

			<li><a href="#" class="button big fit"
				onclick="location.href='/webapp/logout.do'"><i class="fa fa-sign-out" style="font-size:24px"></i>Log Out</a></li>
		</ul>
	</section>

</section>
