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
</head>

<body class="sub_page">

	<div class="hero_area">
		<!-- header section strats -->
		<%@ include file="/include/header.jsp"%>
		<!-- end header section -->
	</div>



	<!-- about section -->
	<section class="about_section layout_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<%@ include file="header.jsp"%>
					<div class="heading_container">
						<h3>게시글 신고</h3>

					</div>
					<br>
					<!-- Table Section -->
					<div>
						<table class="table table-hover table-striped fluid">
							<thead class="table-warning">
								<tr>
									<th scope="col">NO</th>
									<th scope="col">신고일시</th>
									<th scope="col">신고자(닉네임,이메일,연락처)</th>
									<th scope="col">신고대상게시글</th>
									<th scope="col">신고사유</th>
									<th scope="col">신고처리상태</th>
									<th scope="col">신고조치내용(경고,삭제)</th>
									
									
								</tr>
							</thead>
							<tbody>
								<tr>
									

								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>

	</section>
	<!-- end about section -->


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