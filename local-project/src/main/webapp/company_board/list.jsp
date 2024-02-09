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

<!-- 아이콘 CDN -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"
	rel="stylesheet">
<style>
.rounded-circle {
	border-radius: 50% !important;
}

.ms-3 {
	margin-left: 1rem !important;
}
</style>
</head>

<body class="sub_page">

	<!-- header section strats -->
	<%@ include file="/include/header.jsp"%>
	<!-- end header section -->


	<!-- about section -->
	<section class="about_section layout_padding">
		<div class="container">
			<div class="heading_container">
			<h2>동네업체</h2>
			<br>
			<p>단골, 업체 정보 공유, 후기, 홍보 효과</p>
			</div>

			<div class="row">


				<!-- --------------------------------게시글 1개 시작--------------------------------------- -->
				<div class="col-md-3">
					<div class="card" style="width: 18rem;">
						<a href="<%=request.getContextPath()%>/company_board/view.jsp">
							<img src="<%=request.getContextPath()%>/images/cafe1.jpg"
							class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title d-inline-block text-truncate"
									style="max-width: 250px;">아사삭과일</h5>
								<p class="card-text d-inline-block text-truncate"
									style="max-width: 250px; max-height: 100px">달콤하고 신선한 과일을
									판매합니다.</p>

								<div
									class="d-flex justify-content-between border-top border-secondary p-4">
									<div class="d-flex align-items-center">
										<img class="rounded-circle me-2"
											src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fpng.pngtree.com%2Fpng-vector%2F20231113%2Fourlarge%2Fpngtree-a-red-apple-png-image_10577760.png&type=a340"
											width="30" height="30" alt=""> <small
											class="text-uppercase">닉네임</small>
									</div>
									<div class="d-flex align-items-center">
										<small class="ms-3"><i
											class="fa fa-heart text-secondary me-2"></i> 10 </small> <small
											class="ms-3"><i class="fa fa-eye text-secondary me-2"></i>
											3 </small> <small class="ms-3"><i
											class="fa fa-comment text-secondary me-2"></i> 5 </small>
									</div>
								</div>
							</div>
						</a>
					</div>

				</div>
				<!-- --------------------------게시글 1개 시작-------------------------- -->
				<div class="col-md-3">
					<p>
					<div class="card" style="width: 18rem;">
						<a href="<%=request.getContextPath()%>/company_board/view.jsp">
							<img src="<%=request.getContextPath()%>/images/cafe1.jpg"
							class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title d-inline-block text-truncate"
									style="max-width: 250px;">아사삭과일</h5>
								<p class="card-text d-inline-block text-truncate"
									style="max-width: 250px; max-height: 100px">달콤하고 신선한 과일을
									판매합니다.</p>

								<div
									class="d-flex justify-content-between border-top border-secondary p-4">
									<div class="d-flex align-items-center">
										<img class="rounded-circle me-2"
											src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fpng.pngtree.com%2Fpng-vector%2F20231113%2Fourlarge%2Fpngtree-a-red-apple-png-image_10577760.png&type=a340"
											width="30" height="30" alt=""> <small
											class="text-uppercase">닉네임</small>
									</div>
									<div class="d-flex align-items-center">
										<small class="ms-3"><i
											class="fa fa-heart text-secondary me-2"></i> 10 </small> <small
											class="ms-3"><i class="fa fa-eye text-secondary me-2"></i>
											3 </small> <small class="ms-3"><i
											class="fa fa-comment text-secondary me-2"></i> 5 </small>
									</div>
								</div>
							</div>
						</a>
					</div>
					</p>
				</div>
				<!-- --------------------------게시글 끝-------------------------- -->


			</div>
			<button onclick="location.href='write.jsp';">글쓰기</button>
		</div>

	</section>
	<!-- end about section -->


	<!-- info section -->
	<%@ include file="/include/info.jsp"%>
	<!-- end info section -->

	<!-- footer section -->
	<%@ include file="/include/footer.jsp"%>
	<!-- footer section -->


	<script src="/js/jquery-3.4.1.min.js"></script>
	<script src="/js/bootstrap.js"></script>

</body>
</html>