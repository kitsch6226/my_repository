<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지금 여기 오구! 회원가입 페이지</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/store/image/icon/favicon.ico" />
<style>
* {
	margin: 0;
	padding: 0;
}

.top {
	margin: 0 auto;
	height: 54px
}

.top>p>img {
	display: block;
	height: 40px;
}

.falsebox {
	margin: 10px auto;
	width: 396px;
	height: 100px;
	border: 2px solid #eb3636;
	border-radius: 2px;
}

.falsebox p {
	font-family background-color: red;
	width: 70%;
	margin: 16px auto;
}

#p1 b {
	font-fmaily: NanumBarunGothic;
	font-size: 20px;
	color: #eb3636;
}
#p2{
	color: #c2c2c2;
}

.center {
	width: 400px;
	margin: 0 auto;
	border-radius: 8px;
	background-color: #303030;
	display: table;
}

table {border ="1";
	height: 440px;
	margin: 0 auto;
}

table tr td {
	font-size: 14px;
	font-family: Arial;
	font-weight: normal;
}

table tr td input {
	border: none;
	border-radius: 3px;
	background-color: #474747;
	outline: none;
	width: 100%;
	height: 32px;
	color:#c2c2c2;
}

table tr td input:focus {
	background-color: #9c9c9c;
	color:black;
}

hr {
	border: 1px solid #d9d9d9;
}

a:link {
	color: #c2c2c2;
	text-decoration: none;
}

a:visited {
	color: #c2c2c2;
	text-decoration: none;
}

.bottom {
	padding: 20px;
}

.bottom>p {
	color: gray;
	font-family: arial;
	font-size: 14px;
	letter-spacing: 1px;
}
</style>
<script type="text/javascript">
	var pom = document.getElementById("frm");

	function checkPasscode() {
		var passcode_input = document.getElementById("pw");
		var passcode_input2 = document.getElementById("pw2");

		if (passcode_input.value !== passcode_input2.value) {
			passcode_input2.setCustomValidity("확인 비밀번호가 틀렸습니다.");
		} else {
			passcode_input2.setCustomValidity("");
		}
	}
</script>
</head>
<body style="background-color: #1f1f1f;">
	<form action="userAdd.go" method="post" id="frm" name="frm">
		<div class="aligndiv"
			style="padding: 30px; display: table; margin: 0 auto;">
			<div class="top">
				<p align="center">
					<img src="/store/image/icon/ogulogo.png"
						onclick='location.href="../main/ogu.go"'
						style="cursor: pointer;" name="profile" />
				</p>
			</div>

			<!-- 아이디 중복 비밀번호 확인 체크 박스 -->
			<%
				String check = request.getParameter("check");
				//String check = (String)session.getAttribute("check");
				if (check == null) {
				} else if (check.equals("mailfalse")) {
			%>
			<div class="falsebox">
				<p id="p1">
					<b>문제가 발생했어요!</b>
				</p>
				<p id="p2">중복된 메일주소입니다!</p>
			</div>
			<%
				} else if (check.equals("pwfalse")) {
			%>
			<div class="falsebox">
				<p id="p1">
					<b>문제가 발생했어요!</b>
				</p>
				<p id="p2">확인 비밀번호가 올바르지 않습니다.</p>
			</div>
			<%
				} else if (check.equals("fail")) {
			%>
			<div class="falsebox">
				<p id="p1">
					<b>문제가 발생했어요!</b>
				</p>
				<p id="p2">가입에 실패했습니다ㅠ</p>
			</div>
			<%
				}
			%>

			<div class="center">
				<div class="centerbox">
					<table style="margin: 12px auto">
						<tbody>
							<tr>
								<td colspan="3"
									style="font-size: 26px; font-weight: bold; color: #c2c2c2;">Create
									account</td>
							</tr>
							<tr align="center">
								<td colspan="3"><input type="email" name="mail" id="mail"
									pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
									placeholder=" MAIL" title="example@example.com" maxlength="106" value="${userAddInfo.mail}"
									required /></td>
							</tr>
							<tr align="center">
								<td colspan="3"><input type="text" name="name"
									pattern="[가-힣a-zA-Z]{2,10}" title="Kor/Eng Name" value="${userAddInfo.name}"
									placeholder="NAME" maxlength="10" required /></td>
							</tr>
							<tr align="center">
								<td colspan="3"><input type="password" id="pw" name="pw"
									pattern="(?=^\S{8,30}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
									title="영문 대소,특수문자 포함 최소 8자 최대 30자 공백없음" maxlength="30" value="${userAddInfo.pw}"
									placeholder=" PASSWORD" required /></td>
							</tr>
							<tr align="center">
								<td colspan="3"><input type="password" id="pw2" name="pw2"
									placeholder=" REWRITE PASSWORD" oninput="checkPasscode();"
									required /></td>
							</tr>
							<tr>
								<td colspan="3" align="center">
									<button type="submit"
										style="margin-left: 0px; width: 334px; height: 36px; background-color: #ffea00; border: 1px solid #a68200; border-radius: 3px;">OGU계정
										만들기</button>
								</td>
							</tr>
							<tr>
								<td colspan="3"
									style="font-size: 14px; font-weight: normal; color: gray">가입하시면
									OGU의 <a href="support.go">이용약관</a>과 <a
									href="support.go">개인정보 정책</a>에<br>동의하는 것입니다.
								</td>
							</tr>
						</tbody>
					</table>
					<hr>
					<div style="width: 340px; padding: 20px;">
						<p style="font-size: 14px; font-weight: normal; color: gray">
							이미 아이디가 있으세요? <a href="/store/main/login.go">로그인
								하기 ▶</a>
						</p>
					</div>
					<div class="bottom">
						<p align="center">ⓒ2020 OGU.com INC. or its affiliates.</p>
					</div>
				</div>
			</div>

		</div>
		<c:if test="${param.check eq 'mailfalse'}">
			<script>
				document.getElementById("mail").style.border = " red 2px solid";
			</script>
		</c:if>
	</form>
</body>
</html>