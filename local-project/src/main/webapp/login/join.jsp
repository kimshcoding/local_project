<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>동네커뮤니티</title>

<!-- slider stylesheet -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" />
<!-- responsive style -->
<link href="<%=request.getContextPath()%>/css/responsive.css"
	rel="stylesheet" />
<script>
	function checkEmail(obj) {
		let regId = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		let regRs = regId.test(obj.value)
		let checkRs = obj.parentElement.nextElementSibling;
		if (obj.value == "") {
			checkRs.innerHTML = '필수입력입니다.';
			checkRs.style.color = 'red';
			return false;
		} else if (!regRs) {
			checkRs.innerHTML = '유효한 이메일 형식이 아닙니다.';
			checkRs.style.color = 'red';
			return false;
		} else {
			checkRs.innerHTML = '사용가능합니다.';
			checkRs.style.color = 'green';
			return true;
		}
	}

	function checkPass(obj) {
		let regId = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/; /* /^[a-zA-Z0-9](?=,*[a-zA-Z])(?=,*[0-9])/g; */
		let regRs = regId.test(obj.value)
		let checkRs = obj.parentElement.nextElementSibling;
		if (obj.value == "") {
			checkRs.innerHTML = '필수입력입니다.';
			checkRs.style.color = 'red';
			return false;
		} else if (obj.value.length < 6) {
			checkRs.innerHTML = '여섯 자리 이상 입력하세요.';
			checkRs.style.color = 'red';
			return false;
		} else if (!regRs) {
			checkRs.innerHTML = '숫자, 영문, 특수문자 조합만 입력 가능합니다.';
			checkRs.style.color = 'red';
			return false;
		} else {
			checkRs.innerHTML = '사용가능합니다.';
			checkRs.style.color = 'green';
			return true;
		}
	}

	function checkName(obj) {
		let regId = /[^가-힣]/g;
		let regRs = regId.test(obj.value)
		let checkRs = obj.parentElement.nextElementSibling;
		if (obj.value == "") {
			checkRs.innerHTML = '필수입력입니다.';
			checkRs.style.color = 'red';
			return false;
		} else {
			checkRs.innerHTML = '사용가능합니다.';
			checkRs.style.color = 'green';
			return true;
		}
	}
</script>
</head>

<body class="sub_page">

	<div class="hero_area">
		<!-- header section strats -->
		<%@ include file="/include/header.jsp"%>
		<!-- end header section -->
	</div>



	<!-- join section -->
	<section class="about_section layout_padding">
		<div class="container">
			<div class="row justify-content-center">
				<!-- 중앙 정렬 클래스 추가 -->
				<div class="col-md-6">
					<div class="detail-box">
						<div class="heading_container">
							<h2>회원가입</h2>
						</div>
						<p>동네 한 바퀴의 일원이 되신 것을 축하드립니다!</p>
						<!-- 회원가입 시작 -->
						<form name="frm" action="joinOk.jsp" method="post"
							onsubmit="return validation();">
							<div class="input-group flex-nowrap">
								<span class="input-group-text" id="addon-wrapping">Email</span>
								<input type="email" id="email" name="email" class="form-control"
									placeholder="email" aria-label="Username"
									aria-describedby="addon-wrapping" required
									onblur="checkEmail(this)">
							</div>
							<div class="checkRs"></div>
							<br>
							<div class="input-group flex-nowrap">
								<span class="input-group-text" id="addon-wrapping">비밀번호</span> <input
									type="password" id="password" name="password"
									class="form-control" placeholder="password"
									aria-label="Username" aria-describedby="addon-wrapping"
									required onblur="checkPass(this)">
							</div>
							<div class="checkRs"></div>
							<br>
							<div class="input-group flex-nowrap">
								<span class="input-group-text" id="addon-wrapping">닉네임</span> <input
									type="text" id="nicknm" name="nicknm" class="form-control"
									placeholder="nickname" aria-label="Username"
									aria-describedby="addon-wrapping">
							</div>
							<div class="checkRs"></div>
							<br>
							<div class="input-group flex-nowrap">
								<span class="input-group-text" id="addon-wrapping">연락처</span> <input
									type="text" id="phone" name="phone" class="form-control"
									placeholder="010-1111-1111" aria-label="Username"
									aria-describedby="addon-wrapping">
							</div>
							<br>
							<button type="submit">가입하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- end  join section -->


	<!-- info section -->
	<%@ include file="/include/info.jsp"%>
	<!-- end info section -->

	<!-- footer section -->
	<%@ include file="/include/footer.jsp"%>
	<!-- footer section -->


	<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</body>
</html>