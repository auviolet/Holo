<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<head>
<title>HOLO? YOLO!</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/guest_book/guestBook.css">

<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

			<article class="post">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Dashboard</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">26</div>
										<div>New Comments!</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-tasks fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">12</div>
										<div>New Tasks!</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-shopping-cart fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">124</div>
										<div>New Orders!</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-support fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">13</div>
										<div>Support Tickets!</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
				
				
				<!-- 
			<div class="wrapper wrapper-content">
				<div class="row">
					<div class="col-lg-1">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<span class="label label-success pull-right">Monthly</span>
								<h5>Income</h5>
							</div>
							<div class="ibox-content">
								<h1 class="no-margins">40 886,200</h1>
								<div class="stat-percent font-bold text-success">
									98% <i class="fa fa-bolt"></i>
								</div>
								<small>Total income</small>
							</div>
						</div>
					</div>
					<div class="col-lg-1">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<span class="label label-info pull-right">Annual</span>
								<h5>Orders</h5>
							</div>
							<div class="ibox-content">
								<h1 class="no-margins">275,800</h1>
								<div class="stat-percent font-bold text-info">
									20% <i class="fa fa-level-up"></i>
								</div>
								<small>New orders</small>
							</div>
						</div>
					</div>
					<div class="col-lg-1">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<span class="label label-primary pull-right">Today</span>
								<h5>visits</h5>
							</div>
							<div class="ibox-content">
								<h1 class="no-margins">106,120</h1>
								<div class="stat-percent font-bold text-navy">
									44% <i class="fa fa-level-up"></i>
								</div>
								<small>New visits</small>
							</div>
						</div>
					</div>
					<div class="col-lg-1">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<span class="label label-danger pull-right">Low value</span>
								<h5>User activity</h5>
							</div>
							<div class="ibox-content">
								<h1 class="no-margins">80,600</h1>
								<div class="stat-percent font-bold text-danger">
									38% <i class="fa fa-level-down"></i>
								</div>
								<small>In first month</small>
							</div>
						</div>
					</div>
				</div>
				End 1row
 -->
				
			</article>

			<!-- Sidebar -->
			<%@include file="include/sidebar.jsp"%>

		</div>
	</div>


	<!-- Scripts -->
	<script src="assets/js/guest_book/skel.min.js"></script>
	<script src="assets/js/guest_book/util.js"></script>
	<script src="assets/js/guest_book/ie/respond.min.js"></script>
	<script src="assets/js/guest_book/guestbook.js"></script>

</body>
</html>
