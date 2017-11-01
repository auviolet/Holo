<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>HOLO?YOLO!</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/login/main.css" />
</head>
<body class="landing">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Banner -->
		<section id="banner">
			<div class="inner" >
				<h2>HOLO</h2>

				<div id="login">
					<form id="loginform" method="post" action="/webapp/login.do" >
					<div id="checklogin"></div>
						<table >
							<tr>
								<th colspan="2"><input type="hidden" name="action"
									value="login"> <input type="email" size="50"
									name="member_id" placeholder="xxxx@holoyo.com" required autofocus></th>
							</tr>
							<tr>
								<th colspan="2"><input type="password" size="40"
									name="member_pw" placeholder="password" required></th>
							</tr>
							<tr>
							
								<th colspan="2"><button>비밀번호찾기</button></th>
							</tr>
							<tr>
								<th><input class="button special" type="submit"
									value="로그인"></th>
									<th><button class="button special"
						onclick="displayInputForm('join', true);">회원가입</button></th>
							</tr>
						</table>
					</form>
					
				</div>
				<div id="join">
					<form id="joinform" method="post" action="/webapp/join.do" >
						<table>

							<tr>
								<th class="th">이메일</td>
								<td colspan="3"><input type="email" id="member_id"
									placeholder="xxxx@holyol.com" size="40" name="member_id" required></td>
								<td>
									<button onclick="checkAccount(); return false;" >중복확인</button> <output></output>
								</td>
								
							</tr>
							<tr>
								<td class="th">암호</td>
								<td colspan="2"><input type="password" placeholder="암호"
									size="40" name="member_pw" required></td>
								<td>암호확인</td>
								<td><input type="password" name="pwd_check" onkeyup="checkPwd()" placeholder="암호 확인" size="40" required>
								</td>
								
								<tr>
								<td colspan="3"></td>
								<td colspan="2"> <div id="checkPwd">동일한 암호를 입력하세요.</div></td>

							</tr>
							<tr>
								<td class="th">이름</td>
								<td colspan="3"><input type="hidden" name="action" value="join">
									<input type="text" placeholder="이름" size="40"
									name="member_name" required></td>
									</tr>
									<tr>
									
								<td class="th">닉네임</td>
								<td colspan="3"><input type="hidden" name="action" value="join">
									<input type="text" placeholder="닉네임" size="40"
									name="member_nickname" required></td>
									
									<td>
									<button onclick="checkAccount(); return false;" >중복확인</button> <output></output>
								</td>
							</tr>
							<tr>
								<td class="th">성별</td>
								<td colspan="2">
								<label class="radio-inline">
								<div class="gender">
												<input type="radio" id="demo-priority-low" name="member_sex" checked="" value="1" >
												<label for="demo-priority-low">남성</label>
											</div>
											</label>
											<label class="radio-inline">
								<div class="gender">
												<input type="radio" id="demo-priority-normal" name="member_sex" value="2">
												<label for="demo-priority-normal">여성</label>
											</div>
							</label>
								</td>
								
							<tr>
								<td class="th">level</td>
								<td colspan="3">
								<div class="selectbox">
						
								<select name="member_level" style="max-width: 100%; height: auto;">
									<option value="1" >1:분식 혼밥</option>
									<option value="2">2:패스트푸드 혼밥</option>
									<option value="3">3:일반 음식점 혼밥</option>
									<option value="4">4:패밀리 레스토랑 혼밥</option>
									<option value="5">5:고깃집 혼밥</option>
									<option value="6">6:술집 혼밥</option>
								</select>
								</div>
								</td>
								
							<tr>
							<td colspan="2"></td>
								<td><input type="submit" value="가입"></td>
								<td><input type="reset" value="재작성"></td>
								<td>
									<button
										onclick="displayInputForm('join', false); return false;">취소</button>
								</td>
							</tr>

						</table>
						
					</form>
				</div>

			</div>
			<div>
				<a href="#one" id="scroll" class="more scrolly" style="float: right;">Learn More</a>
			</div>
		</section>

		<!-- One -->
		<section id="one" class="wrapper style1 special">
			<div class="inner">
				<header class="major">
					<h3>ABOUT US</h3>
					
					<ul style="list-style: none; overflow: auto;">
						<li style="float: left; width: 20%; margin:2%">
                            <div class="circle" style="width:200px;height:200px;border-radius:100px;background:url(images/intro/bora.jpg);background-size:200px">
							</div>
							<br>
                            <div class="team-info centered">
                                <h5>KIM BORA</h5><br>
                                <small>HOLO를 통해 많은 사람들이 혼자 밥먹는 것에 대한 거부감이 줄어들었으면 좋겠습니다.
                                남 신경쓰지 않고 자신이 하고싶은 거 먹고싶은 음식을 먹으며 주체적인 삶을 살아가길 희망합니다.</small>
                                <br><br>
                                <ul style="list-style:none">
                                    <li style="float:left; width:25%"><a href="http://www.facebook.com/aupurple">
                                       <img src="images/intro/facebook_icon.png" style="width:30px">
                                    </a></li>
                                   	<li style="float:left;width:25%"><a href="https://www.instagram.com/aupurple/">
                                       <img src="images/intro/instagram_icon.png" style="width:30px">
                                    </a></li>
                                     <li style="float:left;width:25%"><a href="mailto:aupurple@gmail.com">
                                       <img src="images/intro/email_icon.png" style="width:30px">
                                    </a></li>
                                </ul>
                            </div>
						<li style="float: left; width: 20%; margin:2%">
                            <div class="circle" style="width:200px;height:200px;border-radius:100px;background:url(images/intro/hyeon_ah.jpg);background-size:200px">
							</div>
							<br>
                            <div class="team-info centered">
                                <h5>LEE HYEON-AH</h5><br>
                                <small>남의 시선 신경쓰지 않고 당당하게 밥 먹을 수 있도록, 사회적 인식 개선을 위해 노력하는 Holo가 되겠습니다.  모두가 당당하게 혼밥을 즐기는 그 날까지! You only live once!</small>
                                <br><br>
                                <ul style="list-style:none">
                                    <li style="float:left; width:25%"><a href="http://www.facebook.com/hhyeo_na7">
                                       <img src="images/intro/facebook_icon.png" style="width:30px">
                                    </a></li>
                                   	<li style="float:left;width:25%"><a href="https://www.instagram.com/hhyeo_na7/">
                                       <img src="images/intro/instagram_icon.png" style="width:30px">
                                    </a></li>
                                     <li style="float:left;width:25%"><a href="mailto:hhyeo_na7@gmail.com">
                                       <img src="images/intro/email_icon.png" style="width:30px">
                                    </a></li>
                                </ul>
                            </div>
						</li>
						<li style="float: left; width: 20%; margin:2%">
                            <div class="circle" style="width:200px;height:200px;border-radius:100px;background:url(images/intro/jiyoon.jpg);background-size:200px">
							</div>
							<br>
                            <div class="team-info centered">
                                <h5>JUNG JIYOON</h5><br>
                                <small>나 혼자 사는 중 <br>
								#인스타그래머의하루
								#혼밥 #혼커피 #혼쇼핑 #ootd </small>
                                <br><br>
                                <ul style="list-style:none">
                                    <li style="float:left; width:25%"><a href="http://www.facebook.com/j_ryunnnn/">
                                       <img src="images/intro/facebook_icon.png" style="width:30px">
                                    </a></li>
                                   	<li style="float:left;width:25%"><a href="https://www.instagram.com/j_ryunnnn/">
                                       <img src="images/intro/instagram_icon.png" style="width:30px">
                                    </a></li>
                                     <li style="float:left;width:25%"><a href="mailto:j_ryunnnn@gmail.com">
                                       <img src="images/intro/email_icon.png" style="width:30px">
                                    </a></li>
                                </ul>
                            </div>
						</li>
						<li style="float: left; width: 20%; margin:2%">
                            <div class="circle" style="width:200px;height:200px;border-radius:100px;background:url(images/intro/yoojeong.jpg);background-size:200px">
							</div>
							<br>
                            <div class="team-info centered">
                                <h5>CHOI YOOJEONG</h5><br>
                                <small>혼자 밥 먹을 곳 찾아 더이상 헤매지 않도록 HOLO와 함께하세요~</small>
                                <br><br>
                                <ul style="list-style:none">
                                    <li style="float:left; width:25%"><a href="http://www.facebook.com/aupurple">
                                       <img src="images/intro/facebook_icon.png" style="width:30px">
                                    </a></li>
                                   	<li style="float:left;width:25%"><a href="https://www.instagram.com/aupurple/">
                                       <img src="images/intro/instagram_icon.png" style="width:30px">
                                    </a></li>
                                     <li style="float:left;width:25%"><a href="mailto:aupurple@gmail.com">
                                       <img src="images/intro/email_icon.png" style="width:30px">
                                    </a></li>
                                </ul>
                            </div>
						</li>
					</ul>
					
				</header>

			</div>
		</section>

	</div>

	<!-- Scripts -->

	<script>
	
	function checkAccount() {
		var dom = document.getElementById("member_id");
		var out = document.getElementsByTagName("output")[0];
		var xhr = new XMLHttpRequest();
		xhr.onload = function() {
			if(xhr.status == 200) {
				alert(xhr.responseText);
				var obj = JSON.parse(xhr.responseText);
				if (obj.result == 'ok') {
					out.textContent = "사용 가능한 계정입니다.";
					check = true;
				} else {
					out.textContent = "사용 불가한 계정입니다.";
					dom.value = '';
				} 				
			}
		}
		xhr.open("GET", "/webapp/checkAccount.do?member_id="+dom.value, true);
		xhr.send();	
	}
	
		function displayInputForm(type, flag) {
			if (type == "join") {
				var dom1 = document.getElementById("login");
				var dom2 = document.getElementById("join");
				var dom3 = document.getElementById("one");
				var dom4 = document.getElementById("scroll");
				if (flag) {
					dom1.style.display = 'none';
					dom2.style.display = 'block';
					dom3.style.display = 'none';
					dom4.style.display = 'none';
					dom2.onsubmit = process;
				} else {
					dom1.style.display = 'block';
					dom2.style.display = 'none';
					dom3.style.display = 'block';
					dom4.style.display = 'block';
				}
			} else {
				var dom = document.getElementById("insert");
				if (flag)
					dom.style.display = 'block';
				else
					dom.style.display = 'none';
			}
		}
		
		function checkPwd(){
			  var f1 = document.forms[1];
			  var pw1 = f1.member_pw.value;
			  var pw2 = f1.pwd_check.value;
			  if(pw1!=pw2){
			   document.getElementById('checkPwd').style.color = "red";
			   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
			  }else{
			   document.getElementById('checkPwd').style.color = "yello";
			   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
			   
			  }
	}
		
		/* function logincheck(){
			  var f1 = document.forms[0];
			  var id = f1.member_pw.value;
			  var pw = f1.pwd_check.value;
			  if(id=null || pw=null){
			   document.getElementById('checkLogin').style.color = "red";
			   document.getElementById('checkLogin').innerHTML = "아이디와 비밀번호를 입력해주세요."; 
			  }else{
			   document.getElementById('checkLogin').style.color = "yello";
			   document.getElementById('checkLogin').innerHTML = ""; 
			   
			  }
	}
		 */
		
		
	</script>
	
	
	
	<script src="assets/js/login/jquery.min.js"></script>
	<script src="assets/js/login/jquery.scrollex.min.js"></script>
	<script src="assets/js/login/jquery.scrolly.min.js"></script>
	<script src="assets/js/login/skel.min.js"></script>
	<script src="assets/js/login/util.js"></script>
	<script src="assets/js/login/main.js"></script>


</body>
</html>