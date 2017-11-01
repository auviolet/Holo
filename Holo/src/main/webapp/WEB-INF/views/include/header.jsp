<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<header id="header">
	<h1>
		<a href="/webapp/">HOLO?YOLO!</a>
	</h1>
	<nav class="links">
		<ul>
			<li><a href="/webapp/list.do">Home</a></li>
			<li><a href="/webapp/intro.do">Intro</a></li>
			<li><a href="/webapp/guestbookList.do">guestbook</a></li>
			<li><a href="/webapp/dataResultList.do">dataresult</a></li>
		</ul>
	</nav>
	<nav class="main">
		<ul>
			<li class="search"><a class="fa-search" href="#search">Search</a>
				<form id="search" method="get" action="/webapp/search.do">
					<input type="text" name="key" placeholder="Search" />
				</form></li>
			<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
		</ul>
	</nav>
</header>
