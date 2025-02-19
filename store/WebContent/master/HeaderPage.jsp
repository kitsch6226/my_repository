<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="dto.Member"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.header {
	min-width: 800px;
	height: 60px;
	background-color: #474747;
}

.header>div {
	height: 100%;
	margin: 0 auto;
}

.header>div>img {
	margin: 12px 20px;
	display: inline;
	height: 40px;
}

.menudiv {
	height: 100%;
}

.menudiv button {
	font-size: 1em;
	margin: 0;
	padding: 0 30px;
	height: 100%;
	outline: none;
	color: #c2c2c2;
	cursor: pointer;
	border: transparent;
	background-color: transparent;
	box-sizing: border-box;
	display: block;
	float: left;
	border-bottom: 0px solid #ffdf52;
	transition: 0.2s;
}

.menudiv button p {
	position: sticky;
}

.menudiv button:hover {
	border-bottom: 5px solid #ffea00;
	color: white;
}
/* 우측 */
#profile, #alert {
	margin: 0 10px;
	width: 60px;
	height: 60px;
	float: right;
}

#profileButton, #alertButton {
	width: 100%;
	height: 100%;
	background-color: transparent;
	border: 1px #ffea00;
	outline:none;
}

.header .userstatus, .header .langdiv, .header .userstatus2 {
	height: 60px;
	margin-right: 10px;
	float: right;
}

/*계정 드롭다운 메뉴 창 설정 */
.statusbtn {
	outline: none;
	float: right;
	height: 60px;
	border: none;
	background: 0;
	font-family: NanumBarunGothic;
	font-size: 16px;
	cursor: pointer;
	min-width: 200px;
	color: #c2c2c2;
}

.statusbtn, .accountdiv {
	display: block;
}

.accountdiv, .alertdiv {
	position: absolute;
	min-width: 200px;
	float: right;
	display: none;
	border-radius: 6px;
	background-color: #474747;
	box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.2);
	top: 58px;
}

.userstatus:hover {
	background-color: #474747;
}

.accountdiv ul li:hover, .alertdiv ul li:hover {
	color: white;
}

.userstatus:hover .accountdiv {
	display: block;
}

.userstatus2:hover .alertdiv {
	display: block;
}

/*언어 설정 드롭다운  */
.langdiv, .languagebtn {
	display: block;
}

.languagediv {
	position: absolute;
	min-width: 130px;
	float: right;
	display: none;
	border-radius: 6px;
	background-color: #474747;
	box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.2);
	top: 58px;
}

.languagebtn {
	height: 100%;
	padding: 0 20px;
	color: #c2c2c2;
	background-color: transparent;
	border: transparent;
	outline: none;
	font-size: 1em;
	cursor: pointer;
}
/*공통 */
.accountdiv ul li, .languagediv ul li, .alertdiv ul li {
	text-align: center;
	margin: 0 auto;
	padding: 14px 30px;
	list-style: none;
	cursor: pointer;
	color: #c2c2c2;
}

.accountdiv ul li a, .languagediv ul li a, .alertdiv ul li a {
	text-decoration: none;
	color: #3d3d3d;
}

.langdiv:hover .languagediv {
	display: block;
}

.langdiv ul li:hover {
	color: white;
}
/* 2단 검색 바 */
.header2 {
	height: 3rem;
	background-color: #1f1f1f;
	padding: 10px;
}

.centerdiv {
	width: 81%;
	height: 100%;
	margin: 0 auto;
}

.sidediv {
	float: left;
	width: 20%;
	margin-top: 12px;
	color: #f2f2f2;
}

.sidediv a:visited {
	color: #c2c2c2;
}

.sidediv a:link {
	color: #c2c2c2;
	text-decoration: none;
}

.sidediv a:hover {
	color: white;
}

.searchdiv {
	width: 20%;
	height: 100%;
	float: right;
	background-color: #474747;
	border-radius: 6px;
}

#searchContent {
	float: right;
	width: 86%;
	height: 100%;
	border: none;
	background-color: transparent;
	outline: none;
	color: #f2f2f2;
}

#searchContent::placeholder {
	color: #919191;
}

#searchbtn {
	border-radius: 6px;
	border: 1px solid gray;
	width: 48px;
	height: 48px;
	position: absolute;
	background-color: transparent;
	outline: none;
	border: none;
	cursor: pointer;
}

#searchbtn img {
	height: 50%;
}
</style>
<script type="text/javascript">
	function accountSetting() {
		var frmheader = document.getElementById("headerfrm");
		frmheader.action = "accountSetting.go";
		frmheader.encoding = "multipart/form-data";
		frmheader.submit();
	}
	function loginNeed() {
		alert("로그인이 필요합니다!");
		window.location.href = "login.go";
	}
	function searching() {
		var searchbar = document.getElementById("searchContent");
		if (searchbar.value == "" || searchbar.value == null) {
			alert("검색어를 입력해주세요!");
			return;
		}

		var frmheader = document.getElementById("headerfrm");
		frmheader.action = "search.go";
		frmheader.submit();
	}
</script>
</head>
<body>
	<form id="headerfrm" action="search.go" method="post">
		<div
			style="width: 100%; position: fixed; display: table; z-index: 9999">
			<div class="header">
				<div style="float: left">
					<img src="/store/image/icon/ogulogo.png"
						onclick="location.href='ogu.go'" style="cursor: pointer" />
				</div>
				<div class="menudiv" style="float: left">
					<button type="button" onclick="location.href='ogu.go'">
						<p>스토어</p>
					</button>
					<button type="button" onclick="location.href='news.go'">
						<p>뉴스</p>
					</button>
					<button type="button" onclick="location.href='community.go'">
						<p>커뮤니티</p>
					</button>
					<button type="button" onclick="location.href='support.go'">
						<p>서포트</p>
					</button>
					<!-- 					<button type="button" onclick="location.href='http://localhost:8080/webapp/market/listProduct.do?kind=0'">
						<p>게이밍 기어</p>
					</button> -->
				</div>
				<div class="userstatus">
					<%-- el과 jstl의 사용으로 주석처리! 따로 값을 받아올 필요가 없다! 
					<%!HttpSession session;%>
					<%
					session = request.getSession();
					Member member = (Member) session.getAttribute("member");
														
						if (member != null) {%> --%>
					<c:choose>
						<c:when test="${loginInfo.name != null}">
							<button type="button" class="statusbtn">${loginInfo.name}님
								로그인 중입니다!</button>
						</c:when>
						<c:otherwise>
							<%-- <%} else { %> --%>
							<button type="button" class="statusbtn"
								onclick="location.href='login.go'">어서오세요! 로그인 하기 ▾</button>
						</c:otherwise>
						<%-- <%} %> --%>
					</c:choose>
					<div class='accountdiv'>
						<ul>
							<c:choose>
								<c:when test="${loginInfo.name !=null}">
									<li onclick="location.href='wishlist.go'">찜 목록</li>
									<li onclick="location.href='library.go'">라이브러리</li>
									<li onclick="location.href='orders.go'">주문내역</li>
									<li onclick="accountSetting()">계정설정</li>
									<li onclick="location.href='logout.go'">로그아웃</li>
								</c:when>
								<c:otherwise>
									<li onclick="loginNeed()">찜 목록</li>
									<li onclick="loginNeed()">라이브러리</li>
									<li onclick="loginNeed()">주문내역</li>
									<li onclick="loginNeed()">계정설정</li>
									<li onclick="location.href='login.go'">로그인</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<div class="userstatus">
					<div id="profile">
						<button type="button" id="profileButton" style="width: 100%;">
							<img src="/store/image/icon/status.png" style="width: 1.5em" />
						</button>
					</div>
				</div>
				<!--알림창 -->
				<c:if test="${answeredQnaInfo!=null}">
					<div class="userstatus2">
						<div class='alertdiv'
							style="right: 13%; height: 60%; float: right;">
							<ul>
								<li onclick="location.href='checkQna.go?qseq=${answeredQnaInfo.qseq}'">
									<p>
										올려주신 문의글에<br>답변이 달렸어요!
									</p>
								</li>
							</ul>
						</div>
						<div id="alert">
							<button type="button" id="alertButton">
								<c:choose>
									<c:when test="${answeredQnaInfo.usercheckyn eq 'n'}">
										<img src="/store/image/icon/alert2.png" style="width: 1.5em" />
									</c:when>
									<c:otherwise>
										<img src="/store/image/icon/alert.png" style="width: 1.5em" />
									</c:otherwise>
								</c:choose>
							</button>
						</div>
					</div>
				</c:if>
			</div>

			<!-- <div class="langdiv">
					<button class="languagebtn">
						<p>Language ▾</p>
					</button>
					<div class="languagediv">
						<ul>
							<li
								onclick="location.href='https://translate.google.co.kr/?hl=ko'">ENGLISH</li>
							<li
								onclick="location.href='https://translate.google.co.kr/?hl=en'">한국어</li>
						</ul>
					</div>
				</div> -->
			<!-- 검색 창! -->
			<div class="header2">
				<div class="centerdiv">
					<%-- <div class="sidediv">
						<c:choose>
							<c:when test="${param.kind eq '' or param.kind == null}">
								<a href="#" style="margin-top: 20px;"></a>
							</c:when>
							<c:otherwise>
								<a href="javascript: history.back()">< 돌아가기</a>
							</c:otherwise>
						</c:choose>
					</div> --%>
					<div class="searchdiv">
						<button id="searchbtn" type="button" onclick="searching()">
							<img src="/store/image/icon/search.png"
								ondragstart="return false;" />
						</button>
						<input type="text" id="searchContent" name="searchContent"
							maxlength="30" title="공백 제외 두 글자 이상 30자 까지" pattern="[가-힣a-zA-Z0-9]+[가-힣a-zA-Z0-9]" placeholder="게임 검색"
							onsubmit="return searching()" required/>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>