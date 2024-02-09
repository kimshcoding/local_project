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
	
<!-- summernote -->
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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
				<h2>가게를 홍보해보세요</h2>
				<form action="writeOk.jsp" method="post" name="frm" enctype="multipart/form-data">
				<!-- 썸네일 -->
					<div class="mb-3">
					 <label for="formFileMultiple" class="form-label">썸네일 사진을 등록해주세요. 권장싸이즈는 000입니다.</label>
					  <input class="form-control" type="file" id="formFileMultiple" name="uploadFile" multiple>
					</div>
				<!-- 가게 상호 -->
					<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">가게 이름</label>
					  <input type="text" class="form-control" id="exampleFormControlInput1" name="companyName" placeholder="가게 이름을 입력하세요">
					</div>
				<!-- 본문내용 -->
					<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">자세한 설명</label>
					  <textarea class="form-control" id="summernote" rows="3" name="content"placeholder="가게를 소개해주세요"></textarea>
					<br>
					<button>작성 완료</button>
					</div>
					</form>
					<br>
				</div>
			</div>
		</div>
	</section>

<!-- summernote -->
 <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
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