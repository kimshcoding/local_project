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

<style>
hr {
	margin-top: 1rem;
	margin-bottom: 1rem;
	border: 0;
	border-top: 5px solid rgba(0, 0, 0, 0.1);
}
</style>
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
			<div class="row justify-content-center">
				<!-- 중앙 정렬 클래스 추가 -->
				<div class="col-md-8">
					<div id="carouselExample" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="<%=request.getContextPath()%>/images/cafe1.jpg"
									class="d-block w-100" height="500" alt="음식1">
							</div>
							<div class="carousel-item">
								<img src="<%=request.getContextPath()%>/images/cafe2.jpg"
									class="d-block w-100" height="500" alt="음식2">
							</div>
							<div class="carousel-item">
								<img src="<%=request.getContextPath()%>/images/cafe3.jpg"
									class="d-block w-100" height="500" alt="음식3">
							</div>
							<div class="carousel-item">
								<img src="<%=request.getContextPath()%>/images/cafe4.jpg"
									class="d-block w-100" height=500 " alt="음식4">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExample"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExample"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Next</span>
						</a>
					</div>
					<br>
					<div>
						<h2>1515 you moon</h2>

					</div>
					<p>안녕하세요 1515 yu moon입니다! 대표로 수제로 만든 바삭바삭한 생과일 와플,생과일요거트,수제디저트가
						있구요~! 직접 착즙한 생과일 쥬스와 계절 상관없이 생과일 얹어진 생과일빙수와 팥빙수 맛 보실 수 있습니다! 즐겁고
						상쾌한 하루 되세요:) 많은 관심 부탁드려용!!
					<hr>
					<div>
						<h3>위치</h3>
						<h4>대구 달서구 상인서로 75 107동 2층 201호 1상인역 6번 출구에서 548m</h4>
					</div>
					<!-- 지도영역 -->
					<!-- 클릭한 위치에 마커표시하기 -->
					<div id="map" style="width: 600px; height: 250px;"></div>
					<!-- <p><em>지도를 클릭해주세요!</em></p>  -->
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3e6966c60a48445d631248661740e9d0"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(35.8168, 128.5418), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

						// 마커가 표시될 위치입니다 
						var markerPosition = new kakao.maps.LatLng(35.8168, 128.5418);

						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							position : markerPosition
						});

						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);

						// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
						// marker.setMap(null);
					</script>
					<!-- 지도영역 끝 -->
					<hr>
					<br>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">후기</h5>
							<p class="card-subtitle mb-2 text-muted">닉네임</p>
							<div class="container">
								<div class="row">
									<div class="col-md-6">
										<div class="card mb-4">
											<img src="<%=request.getContextPath()%>/images/cafe1.jpg"
												class="card-img-top" alt="음식2">

										</div>
									</div>
									<div class="col-md-6">
										<div class="card mb-4">
											<img src="<%=request.getContextPath()%>/images/cafe1.jpg"
												class="card-img-top" alt="음식2">

										</div>
									</div>
								</div>
							</div>
						</div>
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