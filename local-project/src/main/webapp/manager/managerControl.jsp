<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

   <title>동네커뮤니티</title>

  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="<%=request.getContextPath()%>/css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">

  <div class="hero_area">
    <!-- header section strats -->
    <%@ include file="/include/header.jsp" %>
    <!-- end header section -->
  </div>



  <!-- about section -->
  <section class="about_section layout_padding">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
              	관리자
              </h2>
           <!--    <img src="/images/plug.png" alt=""> -->
            </div>
            <p>
       			회원관리, 게시글/댓글/답글/후기 신고 관리 (기능 구현 레이아웃 설정하기)
            </p>
                  <!-- Table Section -->
            <div>
                <table class="table table-hover table-striped">
                    <thead class="table-success">
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">지역</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성일</th>
                            <th scope="col">작성자</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                     		
                    </tbody>
                </table>
            </div>
          </div>
        </div>
      

      </div>
    </div>
  </section>
  <!-- end about section -->
  

  <!-- info section -->
  <%@ include file="/include/info.jsp" %>
  <!-- end info section -->

  <!-- footer section -->
   <%@ include file="/include/footer.jsp" %>
  <!-- footer section -->


  <script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</body>
</html>