<%@page import="java.util.List"%>
<%@page import="com.holo.vo.MemberVO"%>
<%@page import="com.holo.vo.GuestBookVO"%>
<%@page import="com.holo.vo.ReviewVO"%>
<%@page import="com.holo.vo.NoteVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="assets/css/mypage/main.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

.media-body {
	overflow: hidden;
	zoom: 1
}

.media-body {
	width: 10000px
}

.media-object {
	display: block
}

.media-object.img-thumbnail {
	max-width: none
}

.media-right, .media>.pull-right {
	padding-left: 10px
}

.media-left, .media>.pull-left {
	padding-right: 10px
}

.media-body, .media-left, .media-right {
	display: table-cell;
	vertical-align: top
}

.media-middle {
	vertical-align: middle
}

.media-bottom {
	vertical-align: bottom
}

.media-heading {
	margin-top: 0;
	margin-bottom: 5px
}

.media-list {
	padding-left: 0;
	list-style: none
}

.list-group {
	padding-left: 0;
	margin-bottom: 20px
}

.list-group-item {
	position: relative;
	display: block;
	padding: 10px 15px;
	margin-bottom: -1px;
	background-color: #fff;
	border: 1px solid #ddd
}

.list-group-item:first-child {
	border-top-left-radius: 4px;
	border-top-right-radius: 4px
}

.list-group-item:last-child {
	margin-bottom: 0;
	border-bottom-right-radius: 4px;
	border-bottom-left-radius: 4px
}

a.list-group-item, button.list-group-item {
	color: #555
}

a.list-group-item .list-group-item-heading, button.list-group-item .list-group-item-heading
	{
	color: #333
}

a.list-group-item:focus, a.list-group-item:hover, button.list-group-item:focus,
	button.list-group-item:hover {
	color: #555;
	text-decoration: none;
	background-color: #f5f5f5
}

button.list-group-item {
	width: 100%;
	text-align: left
}

.list-group-item.disabled, .list-group-item.disabled:focus,
	.list-group-item.disabled:hover {
	color: #777;
	cursor: not-allowed;
	background-color: #eee
}

.list-group-item.disabled .list-group-item-heading, .list-group-item.disabled:focus .list-group-item-heading,
	.list-group-item.disabled:hover .list-group-item-heading {
	color: inherit
}

.list-group-item.disabled .list-group-item-text, .list-group-item.disabled:focus .list-group-item-text,
	.list-group-item.disabled:hover .list-group-item-text {
	color: #777
}

.list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover
	{
	z-index: 2;
	color: #fff;
	background-color: #337ab7;
	border-color: #337ab7
}

.list-group-item.active .list-group-item-heading, .list-group-item.active .list-group-item-heading>.small,
	.list-group-item.active .list-group-item-heading>small,
	.list-group-item.active:focus .list-group-item-heading,
	.list-group-item.active:focus .list-group-item-heading>.small,
	.list-group-item.active:focus .list-group-item-heading>small,
	.list-group-item.active:hover .list-group-item-heading,
	.list-group-item.active:hover .list-group-item-heading>.small,
	.list-group-item.active:hover .list-group-item-heading>small {
	color: inherit
}

.list-group-item.active .list-group-item-text, .list-group-item.active:focus .list-group-item-text,
	.list-group-item.active:hover .list-group-item-text {
	color: #c7ddef
}

.list-group-item-success {
	color: #3c763d;
	background-color: #dff0d8
}

a.list-group-item-success, button.list-group-item-success {
	color: #3c763d
}

a.list-group-item-success .list-group-item-heading, button.list-group-item-success .list-group-item-heading
	{
	color: inherit
}

a.list-group-item-success:focus, a.list-group-item-success:hover, button.list-group-item-success:focus,
	button.list-group-item-success:hover {
	color: #3c763d;
	background-color: #d0e9c6
}

a.list-group-item-success.active, a.list-group-item-success.active:focus,
	a.list-group-item-success.active:hover, button.list-group-item-success.active,
	button.list-group-item-success.active:focus, button.list-group-item-success.active:hover
	{
	color: #fff;
	background-color: #3c763d;
	border-color: #3c763d
}

.list-group-item-info {
	color: #31708f;
	background-color: #d9edf7
}

a.list-group-item-info, button.list-group-item-info {
	color: #31708f
}

a.list-group-item-info .list-group-item-heading, button.list-group-item-info .list-group-item-heading
	{
	color: inherit
}

a.list-group-item-info:focus, a.list-group-item-info:hover, button.list-group-item-info:focus,
	button.list-group-item-info:hover {
	color: #31708f;
	background-color: #c4e3f3
}

a.list-group-item-info.active, a.list-group-item-info.active:focus, a.list-group-item-info.active:hover,
	button.list-group-item-info.active, button.list-group-item-info.active:focus,
	button.list-group-item-info.active:hover {
	color: #fff;
	background-color: #31708f;
	border-color: #31708f
}

.list-group-item-warning {
	color: #8a6d3b;
	background-color: #fcf8e3
}

a.list-group-item-warning, button.list-group-item-warning {
	color: #8a6d3b
}

a.list-group-item-warning .list-group-item-heading, button.list-group-item-warning .list-group-item-heading
	{
	color: inherit
}

a.list-group-item-warning:focus, a.list-group-item-warning:hover, button.list-group-item-warning:focus,
	button.list-group-item-warning:hover {
	color: #8a6d3b;
	background-color: #faf2cc
}

a.list-group-item-warning.active, a.list-group-item-warning.active:focus,
	a.list-group-item-warning.active:hover, button.list-group-item-warning.active,
	button.list-group-item-warning.active:focus, button.list-group-item-warning.active:hover
	{
	color: #fff;
	background-color: #8a6d3b;
	border-color: #8a6d3b
}

.list-group-item-danger {
	color: #a94442;
	background-color: #f2dede
}

a.list-group-item-danger, button.list-group-item-danger {
	color: #a94442
}

a.list-group-item-danger .list-group-item-heading, button.list-group-item-danger .list-group-item-heading
	{
	color: inherit
}

a.list-group-item-danger:focus, a.list-group-item-danger:hover, button.list-group-item-danger:focus,
	button.list-group-item-danger:hover {
	color: #a94442;
	background-color: #ebcccc
}

a.list-group-item-danger.active, a.list-group-item-danger.active:focus,
	a.list-group-item-danger.active:hover, button.list-group-item-danger.active,
	button.list-group-item-danger.active:focus, button.list-group-item-danger.active:hover
	{
	color: #fff;
	background-color: #a94442;
	border-color: #a94442
}

.list-group-item-heading {
	margin-top: 0;
	margin-bottom: 5px
}

.list-group-item-text {
	margin-bottom: 0;
	line-height: 1.3
}

.nav {
	padding-left: 0;
	margin-bottom: 0;
	list-style: none
}

.nav>li {
	position: relative;
	display: block
}

.nav>li>a {
	position: relative;
	display: block;
	padding: 10px 15px
}

.nav>li>a:focus, .nav>li>a:hover {
	text-decoration: none;
	background-color: #eee
}

.nav>li.disabled>a {
	color: #777
}

.nav>li.disabled>a:focus, .nav>li.disabled>a:hover {
	color: #777;
	text-decoration: none;
	cursor: not-allowed;
	background-color: transparent
}

.nav .open>a, .nav .open>a:focus, .nav .open>a:hover {
	background-color: #eee;
	border-color: #337ab7
}

.nav .nav-divider {
	height: 1px;
	margin: 9px 0;
	overflow: hidden;
	background-color: #e5e5e5
}

.nav>li>a>img {
	max-width: none
}

.nav-tabs {
	border-bottom: 1px solid #ddd
}

.nav-tabs>li {
	float: left;
	margin-bottom: -1px
}

.nav-tabs>li>a {
	margin-right: 2px;
	line-height: 1.42857143;
	border: 1px solid transparent;
	border-radius: 4px 4px 0 0
}

.nav-tabs>li>a:hover {
	border-color: #eee #eee #ddd
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: #555;
	cursor: default;
	background-color: #fff;
	border: 1px solid #ddd;
	border-bottom-color: transparent
}

.nav-tabs.nav-justified {
	width: 100%;
	border-bottom: 0
}

.nav-tabs.nav-justified>li {
	float: none
}

.nav-tabs.nav-justified>li>a {
	margin-bottom: 5px;
	text-align: center
}

.nav-tabs.nav-justified>.dropdown .dropdown-menu {
	top: auto;
	left: auto
}

@media ( min-width :768px) {
	.nav-tabs.nav-justified>li {
		display: table-cell;
		width: 1%
	}
	.nav-tabs.nav-justified>li>a {
		margin-bottom: 0
	}
}

.nav-tabs.nav-justified>li>a {
	margin-right: 0;
	border-radius: 4px
}

.nav-tabs.nav-justified>.active>a, .nav-tabs.nav-justified>.active>a:focus,
	.nav-tabs.nav-justified>.active>a:hover {
	border: 1px solid #ddd
}

@media ( min-width :768px) {
	.nav-tabs.nav-justified>li>a {
		border-bottom: 1px solid #ddd;
		border-radius: 4px 4px 0 0
	}
	.nav-tabs.nav-justified>.active>a, .nav-tabs.nav-justified>.active>a:focus,
		.nav-tabs.nav-justified>.active>a:hover {
		border-bottom-color: #fff
	}
}

.nav-pills>li {
	float: left
}

.nav-pills>li>a {
	border-radius: 4px
}

.nav-pills>li+li {
	margin-left: 2px
}

.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover
	{
	color: #fff;
	background-color: #337ab7
}

.nav-stacked>li {
	float: none
}

.nav-stacked>li+li {
	margin-top: 2px;
	margin-left: 0
}

.nav-justified {
	width: 100%
}

.nav-justified>li {
	float: none
}

.nav-justified>li>a {
	margin-bottom: 5px;
	text-align: center
}

.nav-justified>.dropdown .dropdown-menu {
	top: auto;
	left: auto
}

/* @media ( min-width :768px) {
	.nav-justified>li {
		display: table-cell;
		width: 1%
	}
	.nav-justified>li>a {
		margin-bottom: 0
	}
}
 */
.nav-tabs-justified {
	border-bottom: 0
}

.nav-tabs-justified>li>a {
	margin-right: 0;
	border-radius: 4px
}

.nav-tabs-justified>.active>a, .nav-tabs-justified>.active>a:focus,
	.nav-tabs-justified>.active>a:hover {
	border: 1px solid #ddd
}
/* 
@media ( min-width :768px) {
	.nav-tabs-justified>li>a {
		border-bottom: 1px solid #ddd;
		border-radius: 4px 4px 0 0
	}
	.nav-tabs-justified>.active>a, .nav-tabs-justified>.active>a:focus,
		.nav-tabs-justified>.active>a:hover {
		border-bottom-color: #fff
	}
}
 */
.tab-content>.tab-pane {
	display: none
}

.tab-content>.active {
	display: block
}

.nav-tabs .dropdown-menu {
	margin-top: -1px;
	border-top-left-radius: 0;
	border-top-right-radius: 0
}

.navbar {
	position: relative;
	min-height: 50px;
	margin-bottom: 20px;
	border: 1px solid transparent
}

@media ( min-width :768px) {
	.navbar {
		border-radius: 4px
	}
}

@media ( min-width :768px) {
	.navbar-header {
		float: left
	}
}

.navbar-collapse {
	padding-right: 15px;
	padding-left: 15px;
	overflow-x: visible;
	-webkit-overflow-scrolling: touch;
	border-top: 1px solid transparent;
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, .1);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, .1)
}

.navbar-collapse.in {
	overflow-y: auto
}
/* 
@media ( min-width :768px) {
	.navbar-collapse {
		width: auto;
		border-top: 0;
		-webkit-box-shadow: none;
		box-shadow: none
	}
	.navbar-collapse.collapse {
		display: block !important;
		height: auto !important;
		padding-bottom: 0;
		overflow: visible !important
	}
	.navbar-collapse.in {
		overflow-y: visible
	}
	.navbar-fixed-bottom .navbar-collapse, .navbar-fixed-top .navbar-collapse,
		.navbar-static-top .navbar-collapse {
		padding-right: 0;
		padding-left: 0
	}
} */

.navbar-fixed-bottom .navbar-collapse, .navbar-fixed-top .navbar-collapse
	{
	max-height: 340px
}

@media ( max-device-width :480px) and (orientation:landscape) {
	.navbar-fixed-bottom .navbar-collapse, .navbar-fixed-top .navbar-collapse
		{
		max-height: 200px
	}
}

.container-fluid>.navbar-collapse, .container-fluid>.navbar-header,
	.container>.navbar-collapse, .container>.navbar-header {
	margin-right: -15px;
	margin-left: -15px
}
/* 
@media ( min-width :768px) {
	.container-fluid>.navbar-collapse, .container-fluid>.navbar-header,
		.container>.navbar-collapse, .container>.navbar-header {
		margin-right: 0;
		margin-left: 0
	}
} */

.navbar-static-top {
	z-index: 1000;
	border-width: 0 0 1px
}

@media ( min-width :768px) {
	.navbar-static-top {
		border-radius: 0
	}
}

.navbar-fixed-bottom, .navbar-fixed-top {
	position: fixed;
	right: 0;
	left: 0;
	z-index: 1030
}

@media ( min-width :768px) {
	.navbar-fixed-bottom, .navbar-fixed-top {
		border-radius: 0
	}
}

.navbar-fixed-top {
	top: 0;
	border-width: 0 0 1px
}

.navbar-fixed-bottom {
	bottom: 0;
	margin-bottom: 0;
	border-width: 1px 0 0
}

.navbar-brand {
	float: left;
	height: 50px;
	padding: 15px 15px;
	font-size: 18px;
	line-height: 20px
}

.navbar-brand:focus, .navbar-brand:hover {
	text-decoration: none
}

.navbar-brand>img {
	display: block
}

@media ( min-width :768px) {
	.navbar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand
		{
		margin-left: -15px
	}
}

.navbar-toggle {
	position: relative;
	float: right;
	padding: 9px 10px;
	margin-top: 8px;
	margin-right: 15px;
	margin-bottom: 8px;
	background-color: transparent;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px
}

.navbar-toggle:focus {
	outline: 0
}

.navbar-toggle .icon-bar {
	display: block;
	width: 22px;
	height: 2px;
	border-radius: 1px
}

.navbar-toggle .icon-bar+.icon-bar {
	margin-top: 4px
}

@media ( min-width :768px) {
	.navbar-toggle {
		display: none
	}
}

.navbar-nav {
	margin: 7.5px -15px
}

.navbar-nav>li>a {
	padding-top: 10px;
	padding-bottom: 10px;
	line-height: 20px
}

@media ( max-width :767px) {
	.navbar-nav .open .dropdown-menu {
		position: static;
		float: none;
		width: auto;
		margin-top: 0;
		background-color: transparent;
		border: 0;
		-webkit-box-shadow: none;
		box-shadow: none
	}
	.navbar-nav .open .dropdown-menu .dropdown-header, .navbar-nav .open .dropdown-menu>li>a
		{
		padding: 5px 15px 5px 25px
	}
	.navbar-nav .open .dropdown-menu>li>a {
		line-height: 20px
	}
	.navbar-nav .open .dropdown-menu>li>a:focus, .navbar-nav .open .dropdown-menu>li>a:hover
		{
		background-image: none
	}
}

@media ( min-width :768px) {
	.navbar-nav {
		float: left;
		margin: 0
	}
	.navbar-nav>li {
		float: left
	}
	.navbar-nav>li>a {
		padding-top: 15px;
		padding-bottom: 15px
	}
}

.navbar-form {
	padding: 10px 15px;
	margin-top: 8px;
	margin-right: -15px;
	margin-bottom: 8px;
	margin-left: -15px;
	border-top: 1px solid transparent;
	border-bottom: 1px solid transparent;
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, .1), 0 1px 0
		rgba(255, 255, 255, .1);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, .1), 0 1px 0
		rgba(255, 255, 255, .1)
}

@media ( min-width :768px) {
	.navbar-form .form-group {
		display: inline-block;
		margin-bottom: 0;
		vertical-align: middle
	}
	.navbar-form .form-control {
		display: inline-block;
		width: auto;
		vertical-align: middle
	}
	.navbar-form .form-control-static {
		display: inline-block
	}
	.navbar-form .input-group {
		display: inline-table;
		vertical-align: middle
	}
	.navbar-form .input-group .form-control, .navbar-form .input-group .input-group-addon,
		.navbar-form .input-group .input-group-btn {
		width: auto
	}
	.navbar-form .input-group>.form-control {
		width: 100%
	}
	.navbar-form .control-label {
		margin-bottom: 0;
		vertical-align: middle
	}
	.navbar-form .checkbox, .navbar-form .radio {
		display: inline-block;
		margin-top: 0;
		margin-bottom: 0;
		vertical-align: middle
	}
	.navbar-form .checkbox label, .navbar-form .radio label {
		padding-left: 0
	}
	.navbar-form .checkbox input[type=checkbox], .navbar-form .radio input[type=radio]
		{
		position: relative;
		margin-left: 0
	}
	.navbar-form .has-feedback .form-control-feedback {
		top: 0
	}
}

@media ( max-width :767px) {
	.navbar-form .form-group {
		margin-bottom: 5px
	}
	.navbar-form .form-group:last-child {
		margin-bottom: 0
	}
}

@media ( min-width :768px) {
	.navbar-form {
		width: auto;
		padding-top: 0;
		padding-bottom: 0;
		margin-right: 0;
		margin-left: 0;
		border: 0;
		-webkit-box-shadow: none;
		box-shadow: none
	}
}

.navbar-nav>li>.dropdown-menu {
	margin-top: 0;
	border-top-left-radius: 0;
	border-top-right-radius: 0
}

.navbar-fixed-bottom .navbar-nav>li>.dropdown-menu {
	margin-bottom: 0;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0
}

.navbar-btn {
	margin-top: 8px;
	margin-bottom: 8px
}

.navbar-btn.btn-sm {
	margin-top: 10px;
	margin-bottom: 10px
}

.navbar-btn.btn-xs {
	margin-top: 14px;
	margin-bottom: 14px
}

.navbar-text {
	margin-top: 15px;
	margin-bottom: 15px
}

@media ( min-width :768px) {
	.navbar-text {
		float: left;
		margin-right: 15px;
		margin-left: 15px
	}
}

@media ( min-width :768px) {
	.navbar-left {
		float: left !important
	}
	.navbar-right {
		float: right !important;
		margin-right: -15px
	}
	.navbar-right ~.navbar-right {
		margin-right: 0
	}
}

.navbar-default {
	background-color: #f8f8f8;
	border-color: #e7e7e7
}

.navbar-default .navbar-brand {
	color: #777
}

.navbar-default .navbar-brand:focus, .navbar-default .navbar-brand:hover
	{
	color: #5e5e5e;
	background-color: transparent
}

.navbar-default .navbar-text {
	color: #777
}

.navbar-default .navbar-nav>li>a {
	color: #777
}

.navbar-default .navbar-nav>li>a:focus, .navbar-default .navbar-nav>li>a:hover
	{
	color: #333;
	background-color: transparent
}

.navbar-default .navbar-nav>.active>a, .navbar-default .navbar-nav>.active>a:focus,
	.navbar-default .navbar-nav>.active>a:hover {
	color: #555;
	background-color: #e7e7e7
}

.navbar-default .navbar-nav>.disabled>a, .navbar-default .navbar-nav>.disabled>a:focus,
	.navbar-default .navbar-nav>.disabled>a:hover {
	color: #ccc;
	background-color: transparent
}

.navbar-default .navbar-toggle {
	border-color: #ddd
}

.navbar-default .navbar-toggle:focus, .navbar-default .navbar-toggle:hover
	{
	background-color: #ddd
}

.navbar-default .navbar-toggle .icon-bar {
	background-color: #888
}

.navbar-default .navbar-collapse, .navbar-default .navbar-form {
	border-color: #e7e7e7
}

.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:focus,
	.navbar-default .navbar-nav>.open>a:hover {
	color: #555;
	background-color: #e7e7e7
}

@media ( max-width :767px) {
	.navbar-default .navbar-nav .open .dropdown-menu>li>a {
		color: #777
	}
	.navbar-default .navbar-nav .open .dropdown-menu>li>a:focus,
		.navbar-default .navbar-nav .open .dropdown-menu>li>a:hover {
		color: #333;
		background-color: transparent
	}
	.navbar-default .navbar-nav .open .dropdown-menu>.active>a,
		.navbar-default .navbar-nav .open .dropdown-menu>.active>a:focus,
		.navbar-default .navbar-nav .open .dropdown-menu>.active>a:hover {
		color: #555;
		background-color: #e7e7e7
	}
	.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a,
		.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a:focus,
		.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a:hover {
		color: #ccc;
		background-color: transparent
	}
}

.navbar-default .navbar-link {
	color: #777
}

.navbar-default .navbar-link:hover {
	color: #333
}

.navbar-default .btn-link {
	color: #777
}

.navbar-default .btn-link:focus, .navbar-default .btn-link:hover {
	color: #333
}

.navbar-default .btn-link[disabled]:focus, .navbar-default .btn-link[disabled]:hover,
	fieldset[disabled] .navbar-default .btn-link:focus, fieldset[disabled] .navbar-default .btn-link:hover
	{
	color: #ccc
}

.navbar-inverse {
	background-color: #222;
	border-color: #080808
}

.navbar-inverse .navbar-brand {
	color: #9d9d9d
}

.navbar-inverse .navbar-brand:focus, .navbar-inverse .navbar-brand:hover
	{
	color: #fff;
	background-color: transparent
}

.navbar-inverse .navbar-text {
	color: #9d9d9d
}

.navbar-inverse .navbar-nav>li>a {
	color: #9d9d9d
}

.navbar-inverse .navbar-nav>li>a:focus, .navbar-inverse .navbar-nav>li>a:hover
	{
	color: #fff;
	background-color: transparent
}

.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus,
	.navbar-inverse .navbar-nav>.active>a:hover {
	color: #fff;
	background-color: #080808
}

.navbar-inverse .navbar-nav>.disabled>a, .navbar-inverse .navbar-nav>.disabled>a:focus,
	.navbar-inverse .navbar-nav>.disabled>a:hover {
	color: #444;
	background-color: transparent
}

.navbar-inverse .navbar-toggle {
	border-color: #333
}

.navbar-inverse .navbar-toggle:focus, .navbar-inverse .navbar-toggle:hover
	{
	background-color: #333
}

.navbar-inverse .navbar-toggle .icon-bar {
	background-color: #fff
}

.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {
	border-color: #101010
}

.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus,
	.navbar-inverse .navbar-nav>.open>a:hover {
	color: #fff;
	background-color: #080808
}

@media ( max-width :767px) {
	.navbar-inverse .navbar-nav .open .dropdown-menu>.dropdown-header {
		border-color: #080808
	}
	.navbar-inverse .navbar-nav .open .dropdown-menu .divider {
		background-color: #080808
	}
	.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
		color: #9d9d9d
	}
	.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:focus,
		.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:hover {
		color: #fff;
		background-color: transparent
	}
	.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a,
		.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a:focus,
		.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a:hover {
		color: #fff;
		background-color: #080808
	}
	.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a,
		.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a:focus,
		.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a:hover {
		color: #444;
		background-color: transparent
	}
}

.navbar-inverse .navbar-link {
	color: #9d9d9d
}

.navbar-inverse .navbar-link:hover {
	color: #fff
}

.navbar-inverse .btn-link {
	color: #9d9d9d
}

.navbar-inverse .btn-link:focus, .navbar-inverse .btn-link:hover {
	color: #fff
}

.navbar-inverse .btn-link[disabled]:focus, .navbar-inverse .btn-link[disabled]:hover,
	fieldset[disabled] .navbar-inverse .btn-link:focus, fieldset[disabled] .navbar-inverse .btn-link:hover
	{
	color: #444
}

.breadcrumb {
	padding: 8px 15px;
	margin-bottom: 20px;
	list-style: none;
	background-color: #f5f5f5;
	border-radius: 4px
}

.tab-content>.tab-pane {
	display: none
}

.tab-content>.active {
	display: block
}

.panel-body {
	padding: 40px
}

.panel-heading {
	padding: 10px 15px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px
}

.panel-heading>.dropdown .dropdown-toggle {
	color: inherit
}

.panel-title {
	margin-top: 0;
	margin-bottom: 0;
	font-size: 16px;
	color: inherit
}

.panel-title>.small, .panel-title>.small>a, .panel-title>a, .panel-title>small,
	.panel-title>small>a {
	color: inherit
}

.panel-footer {
	padding: 10px 15px;
	background-color: #f5f5f5;
	border-top: 1px solid #ddd;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px
}

.panel>.list-group, .panel>.panel-collapse>.list-group {
	margin-bottom: 0
}

.panel>.list-group .list-group-item, .panel>.panel-collapse>.list-group .list-group-item
	{
	border-width: 1px 0;
	border-radius: 0
}

.panel>.list-group:first-child .list-group-item:first-child, .panel>.panel-collapse>.list-group:first-child .list-group-item:first-child
	{
	border-top: 0;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px
}

.panel>.list-group:last-child .list-group-item:last-child, .panel>.panel-collapse>.list-group:last-child .list-group-item:last-child
	{
	border-bottom: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px
}

.panel>.panel-heading+.panel-collapse>.list-group .list-group-item:first-child
	{
	border-top-left-radius: 0;
	border-top-right-radius: 0
}

.panel-heading+.list-group .list-group-item:first-child {
	border-top-width: 0
}

.list-group+.panel-footer {
	border-top-width: 0
}

.panel>.panel-collapse>.table, .panel>.table, .panel>.table-responsive>.table
	{
	margin-bottom: 0
}

.panel>.panel-collapse>.table caption, .panel>.table caption, .panel>.table-responsive>.table caption
	{
	padding-right: 15px;
	padding-left: 15px
}

.panel>.table-responsive:first-child>.table:first-child, .panel>.table:first-child
	{
	border-top-left-radius: 3px;
	border-top-right-radius: 3px
}

.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child,
	.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child,
	.panel>.table:first-child>tbody:first-child>tr:first-child, .panel>.table:first-child>thead:first-child>tr:first-child
	{
	border-top-left-radius: 3px;
	border-top-right-radius: 3px
}

.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child td:first-child,
	.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child th:first-child,
	.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child td:first-child,
	.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child th:first-child,
	.panel>.table:first-child>tbody:first-child>tr:first-child td:first-child,
	.panel>.table:first-child>tbody:first-child>tr:first-child th:first-child,
	.panel>.table:first-child>thead:first-child>tr:first-child td:first-child,
	.panel>.table:first-child>thead:first-child>tr:first-child th:first-child
	{
	border-top-left-radius: 3px
}

.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child td:last-child,
	.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child th:last-child,
	.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child td:last-child,
	.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child th:last-child,
	.panel>.table:first-child>tbody:first-child>tr:first-child td:last-child,
	.panel>.table:first-child>tbody:first-child>tr:first-child th:last-child,
	.panel>.table:first-child>thead:first-child>tr:first-child td:last-child,
	.panel>.table:first-child>thead:first-child>tr:first-child th:last-child
	{
	border-top-right-radius: 3px
}

.panel>.table-responsive:last-child>.table:last-child, .panel>.table:last-child
	{
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px
}

.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child,
	.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child,
	.panel>.table:last-child>tbody:last-child>tr:last-child, .panel>.table:last-child>tfoot:last-child>tr:last-child
	{
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px
}

.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child td:first-child,
	.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child th:first-child,
	.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child td:first-child,
	.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child th:first-child,
	.panel>.table:last-child>tbody:last-child>tr:last-child td:first-child,
	.panel>.table:last-child>tbody:last-child>tr:last-child th:first-child,
	.panel>.table:last-child>tfoot:last-child>tr:last-child td:first-child,
	.panel>.table:last-child>tfoot:last-child>tr:last-child th:first-child
	{
	border-bottom-left-radius: 3px
}

.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child td:last-child,
	.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child th:last-child,
	.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child td:last-child,
	.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child th:last-child,
	.panel>.table:last-child>tbody:last-child>tr:last-child td:last-child,
	.panel>.table:last-child>tbody:last-child>tr:last-child th:last-child,
	.panel>.table:last-child>tfoot:last-child>tr:last-child td:last-child,
	.panel>.table:last-child>tfoot:last-child>tr:last-child th:last-child {
	border-bottom-right-radius: 3px
}

.panel>.panel-body+.table, .panel>.panel-body+.table-responsive, .panel>.table+.panel-body,
	.panel>.table-responsive+.panel-body {
	border-top: 1px solid #ddd
}

.panel>.table>tbody:first-child>tr:first-child td, .panel>.table>tbody:first-child>tr:first-child th
	{
	border-top: 0
}

.panel>.table-bordered, .panel>.table-responsive>.table-bordered {
	border: 0
}

.panel>.table-bordered>tbody>tr>td:first-child, .panel>.table-bordered>tbody>tr>th:first-child,
	.panel>.table-bordered>tfoot>tr>td:first-child, .panel>.table-bordered>tfoot>tr>th:first-child,
	.panel>.table-bordered>thead>tr>td:first-child, .panel>.table-bordered>thead>tr>th:first-child,
	.panel>.table-responsive>.table-bordered>tbody>tr>td:first-child,
	.panel>.table-responsive>.table-bordered>tbody>tr>th:first-child,
	.panel>.table-responsive>.table-bordered>tfoot>tr>td:first-child,
	.panel>.table-responsive>.table-bordered>tfoot>tr>th:first-child,
	.panel>.table-responsive>.table-bordered>thead>tr>td:first-child,
	.panel>.table-responsive>.table-bordered>thead>tr>th:first-child {
	border-left: 0
}

.panel>.table-bordered>tbody>tr>td:last-child, .panel>.table-bordered>tbody>tr>th:last-child,
	.panel>.table-bordered>tfoot>tr>td:last-child, .panel>.table-bordered>tfoot>tr>th:last-child,
	.panel>.table-bordered>thead>tr>td:last-child, .panel>.table-bordered>thead>tr>th:last-child,
	.panel>.table-responsive>.table-bordered>tbody>tr>td:last-child, .panel>.table-responsive>.table-bordered>tbody>tr>th:last-child,
	.panel>.table-responsive>.table-bordered>tfoot>tr>td:last-child, .panel>.table-responsive>.table-bordered>tfoot>tr>th:last-child,
	.panel>.table-responsive>.table-bordered>thead>tr>td:last-child, .panel>.table-responsive>.table-bordered>thead>tr>th:last-child
	{
	border-right: 0
}

.panel>.table-bordered>tbody>tr:first-child>td, .panel>.table-bordered>tbody>tr:first-child>th,
	.panel>.table-bordered>thead>tr:first-child>td, .panel>.table-bordered>thead>tr:first-child>th,
	.panel>.table-responsive>.table-bordered>tbody>tr:first-child>td,
	.panel>.table-responsive>.table-bordered>tbody>tr:first-child>th,
	.panel>.table-responsive>.table-bordered>thead>tr:first-child>td,
	.panel>.table-responsive>.table-bordered>thead>tr:first-child>th {
	border-bottom: 0
}

.panel>.table-bordered>tbody>tr:last-child>td, .panel>.table-bordered>tbody>tr:last-child>th,
	.panel>.table-bordered>tfoot>tr:last-child>td, .panel>.table-bordered>tfoot>tr:last-child>th,
	.panel>.table-responsive>.table-bordered>tbody>tr:last-child>td, .panel>.table-responsive>.table-bordered>tbody>tr:last-child>th,
	.panel>.table-responsive>.table-bordered>tfoot>tr:last-child>td, .panel>.table-responsive>.table-bordered>tfoot>tr:last-child>th
	{
	border-bottom: 0
}

.panel>.table-responsive {
	margin-bottom: 0;
	border: 0
}

.panel-group {
	margin-bottom: 20px
}

.panel-group .panel {
	margin-bottom: 0;
	border-radius: 4px
}

.panel-group .panel+.panel {
	margin-top: 5px
}

.panel-group .panel-heading {
	border-bottom: 0
}

.panel-group .panel-heading+.panel-collapse>.list-group, .panel-group .panel-heading+.panel-collapse>.panel-body
	{
	border-top: 1px solid #ddd
}

.panel-group .panel-footer {
	border-top: 0
}

.panel-group .panel-footer+.panel-collapse .panel-body {
	border-bottom: 1px solid #ddd
}

.panel-default {
	border-color: #ddd
}

.panel-default>.panel-heading {
	color: #333;
	background-color: #f5f5f5;
	border-color: #ddd
}

.panel-default>.panel-heading+.panel-collapse>.panel-body {
	border-top-color: #ddd
}

.panel-default>.panel-heading .badge {
	color: #f5f5f5;
	background-color: #333
}

.panel-default>.panel-footer+.panel-collapse>.panel-body {
	border-bottom-color: #ddd
}

.panel-primary {
	border-color: #337ab7
}

.panel-primary>.panel-heading {
	color: #fff;
	background-color: #337ab7;
	border-color: #337ab7
}

.panel-primary>.panel-heading+.panel-collapse>.panel-body {
	border-top-color: #337ab7
}

.panel-primary>.panel-heading .badge {
	color: #337ab7;
	background-color: #fff
}

.panel-primary>.panel-footer+.panel-collapse>.panel-body {
	border-bottom-color: #337ab7
}

.panel-success {
	border-color: #d6e9c6
}

.panel-success>.panel-heading {
	color: #3c763d;
	background-color: #dff0d8;
	border-color: #d6e9c6
}

.panel-success>.panel-heading+.panel-collapse>.panel-body {
	border-top-color: #d6e9c6
}

.panel-success>.panel-heading .badge {
	color: #dff0d8;
	background-color: #3c763d
}

.panel-success>.panel-footer+.panel-collapse>.panel-body {
	border-bottom-color: #d6e9c6
}

.panel-info {
	border-color: #bce8f1
}

.panel-info>.panel-heading {
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1
}

.panel-info>.panel-heading+.panel-collapse>.panel-body {
	border-top-color: #bce8f1
}

.panel-info>.panel-heading .badge {
	color: #d9edf7;
	background-color: #31708f
}

.panel-info>.panel-footer+.panel-collapse>.panel-body {
	border-bottom-color: #bce8f1
}

.panel-warning {
	border-color: #faebcc
}

.panel-warning>.panel-heading {
	color: #8a6d3b;
	background-color: #fcf8e3;
	border-color: #faebcc
}

.panel-warning>.panel-heading+.panel-collapse>.panel-body {
	border-top-color: #faebcc
}

.panel-warning>.panel-heading .badge {
	color: #fcf8e3;
	background-color: #8a6d3b
}

.panel-warning>.panel-footer+.panel-collapse>.panel-body {
	border-bottom-color: #faebcc
}

.panel-danger {
	border-color: #ebccd1
}

.panel-danger>.panel-heading {
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1
}

.panel-danger>.panel-heading+.panel-collapse>.panel-body {
	border-top-color: #ebccd1
}

.panel-danger>.panel-heading .badge {
	color: #f2dede;
	background-color: #a94442
}

.panel-danger>.panel-footer+.panel-collapse>.panel-body {
	border-bottom-color: #ebccd1
}

.panel-body:after, .panel-body:before, .row:after, .row:before {
	display: table;
	content: " "
}

.btn-group-vertical>.btn-group:after, .btn-toolbar:after, .clearfix:after,
	.container-fluid:after, .container:after, .dl-horizontal dd:after,
	.form-horizontal .form-group:after, .modal-footer:after, .modal-header:after,
	.nav:after, .navbar-collapse:after, .navbar-header:after, .navbar:after,
	.pager:after, .panel-body:after, .row:after {
	clear: both
}

.center-block {
	display: block;
	margin-right: auto;
	margin-left: auto
}

.m-t-sm {
	margin-top: 10px;
}
</style>

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

			<article class="post"> 
			<header>
			<%
				MemberVO mvo = (MemberVO)request.getAttribute("mvo");
			%>
			<div class="title">
				<h2>
					<a href="#">My information</a>
				</h2>
			</div>

			<div class="meta" style="width: 35%;">
				<ul class="alt">
					<li><h4>ID : <%=session.getAttribute("member_id") %></h4></li>
					<li><h4>NickName :<%=session.getAttribute("memberNickname") %></h4></li>
					<li><h4>Name : <%=mvo.getMember_name() %></h4></li>
					<li><h4>Level : <%=mvo.getMember_level() %></h4></li>
				</ul>
			</div>
			</header>
			

				<div class="row m-t-sm">
					<div class="col-lg-12">
					<h3>My Write</h3>
						<div class="panel blank-panel">
							<div class="panel-heading">
								<div class="panel-options">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#tab-1" data-toggle="tab">GuestBooks</a></li>
										<li class=""><a href="#tab-2" data-toggle="tab">Reviews</a></li>
									</ul>
								</div>
							</div>

						<div class="panel-body">
						
							<div class="tab-content">
								<div class="tab-pane active" id="tab-1">
									<div class="feed-activity-list">

										<%
											List<GuestBookVO> gbList = (List<GuestBookVO>) request.getAttribute("gbList");
											if (gbList != null) {
												for (GuestBookVO gbvo : gbList) {
										%>
										<div class="feed-element">

											<div class="media-body">
												<small class="pull-right"><%=gbvo.getGuestbook_regdate()%></small>
												<h3><a><strong><%=gbvo.getGuestbook_subject()%></strong></a> </h3><br>
												<div class="well"><%=gbvo.getGuestbook_content()%></div>
											</div>
										</div>
										
										<%
											}
											} else if (gbList == null) {
										%>
										
											<div class="media-body ">
												<strong>방명록을 하나도 작성하지 않으셨네요? 한번 작성해 볼까용^.^</strong>
											</div>
										
										<%
											}
										%>


									</div>

								</div>
								<div class="tab-pane" id="tab-2">

									<table class="table table-striped" >
										<thead>
											<tr>
												<th>Bistro Idx</th>
												<th>Comments</th>
												<th>Review Date</th>
												<th>Review Grade</th>
												
											</tr>
										</thead>
										<%
											List<ReviewVO> reviewList = (List<ReviewVO>) request.getAttribute("reviewList");
											if (reviewList != null) {
												for (ReviewVO rvo : reviewList) {
										%>
										<tbody>

											<tr>
												<td style="padding:0;"><%=rvo.getBistro_idx()%></td>
												<td style="padding:0;">
													<p class="small"><a onclick="location.href='/webapp/listOne.do?bistro_idx=<%=rvo.getBistro_idx()%>'"><%=rvo.getReview_comment()%></a></p>
												</td>
												<td style="padding:0;"><%=rvo.getReview_date()%></td>
												<td style="padding:0;"><%=rvo.getReview_grade()%></td>
												<td style="padding:0;">
													<div
														style="CLEAR: both; PADDING: 0px; BACKGROUND: url(images/list_sub/icon_star2.gif) 0px 0px; MARGIN: 0px; WIDTH: 90px; HEIGHT: 18px;">
														<p
															style="WIDTH: <%=rvo.getReview_grade()%>0%; PADDING:0px; BACKGROUND: url(images/list_sub/icon_star.gif) 0px 0px; MARGIN: 0px; HEIGHT: 18px">
														</p>
													</div>
												</td>

											</tr>

										</tbody>


										<%
												}
											} else if (reviewList == null) {
										%>
										<tbody>
										<tr><td>리뷰를 하나도 작성하지 않으셨네요. 한번 작성해 보는 건 어떨까요^.^</td></tr>
										</tbody>
										<%
											}
										%>
									</table>

								</div>
							</div>

						</div>
						</div>
					
					</div>
				</div>
				<div class="ibox-title">
					<h5>Receive messages</h5>
					<div class="ibox-tools">
						<!-- <a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class="close-link"> <i class="fa fa-times"></i>
						</a> -->
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3">
						<div class="ibox float-e-margins">
							
							<div class="ibox-content ibox-heading">
								<h3>
									<i class="fa fa-envelope-o"></i>Messages
								</h3>
								<small><i class="fa fa-tim"></i> You have 22 new
									messages and 16 waiting in draft folder.</small>
							</div>
							<div class="ibox-content">
								<div class="feed-activity-list">

									<%
										List<NoteVO> noteList = (List<NoteVO>) request.getAttribute("noteList");
										if (noteList != null) {
											for (NoteVO nvo1 : noteList) {
									%>
									<div class="feed-element">
										<div class="title">
											<small class="pull-right text-navy"><%=nvo1.getNote_regdate()%></small>
											<h4><a><strong><%=nvo1.getNote_writer()%></strong></a></h4>
											<div><%=nvo1.getNote_content()%></div>
											<%-- <small class="text-muted"><%=nvo1.getNote_regdate() %></small> --%>
										</div>
									</div>
									<%
										}
										} else if (noteList == null) {
									%>
									<tr>
										<td>받은 쪽지가 없습니다.</td>
									</tr>
									<%
										}
									%>


								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4">

						<div class="ibox">
							<div class="ibox-content">
								<form id="MessageForm" method="post" action="/webapp/mypageNotesInsert.do">
									<h3>Answer</h3>
									<p class="small">Send message to member</p>
									<input type="text" name="note_receiver">
									<div class="form-group">
										<label>Message</label>
										<textarea class="form-control" name="note_content" placeholder="Your message"
											rows="3"></textarea>
									</div>
									<br>
									<ul class="actions">
										<li><button type="submit" class="btn btn-primary btn-sm btn-block">Send</button></li>
										<li><button type="reset">Reset</button></li>
									</ul>
								</form>
							</div>
						</div>
					</div>

				</div><!-- //End 2row -->
	
			
					
			</article>
			</div><!-- //End main -->	
			</div>
			


	<!-- Scripts -->
 	<script src="assets/js/mypage/jquery.min.js"></script>
	<script src="assets/js/mypage/skel.min.js"></script>
	<script src="assets/js/mypage/util.js"></script>
	<script src="assets/js/mypage/ie/respond.min.js"></script>

</body>
</html>