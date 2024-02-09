<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
 <!-- <div class="hero_area"> -->
	<header class="header_section">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg custom_nav-container ">
				<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp"> <span> 동네 한 바퀴
				</span>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="s-1"> </span> <span class="s-2"> </span> <span
						class="s-3"> </span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<div
						class="d-flex ml-auto flex-column flex-lg-row align-items-center">
						<ul class="navbar-nav  ">
							
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/free_board/list.jsp">
									자유게시판 </a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/news_board/list.jsp">
									동네소식 </a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/together_board/list.jsp">
									같이해요 </a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/qa_board/list.jsp">
									Q &amp; A </a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/company_board/list.jsp">
									동네업체 </a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/compliment_board/list.jsp">
									칭찬해요 </a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/smalltown_board/list.jsp">
									나작동 </a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/notice_board/list.jsp">
									공지사항 </a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/login/join.jsp">
									회원가입 </a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/login/login.jsp">
									로그인 </a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
<!-- </div>	 -->
</body>
</html>