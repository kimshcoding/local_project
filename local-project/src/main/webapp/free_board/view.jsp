<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="local.vo.*"%>
<%@ page import="java.util.*"%>

<%
//--------- 임시 로그인 -----------------------------------------
Member mlogin = new Member();
mlogin.setEmail("good@good.com");
mlogin.setMemberId(1);
session.setAttribute("login", mlogin);
//--------- 임시 로그인 -----------------------------------------
Member member = (Member) session.getAttribute("login");

String boardIdParam = request.getParameter("board_id");

int boardId = 0;
if (boardIdParam != null && !boardIdParam.equals("")) {
	boardId = Integer.parseInt(boardIdParam);
}

String fileOrdParam = request.getParameter("file_ord");

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;
String url = "jdbc:mysql://localhost:3306/localboard";
String user = "cteam";
String pass = "1234";

Board board = new Board(); // 자유게시판 결과를 담을 객체
List<BoardFileDetail> bflist = new ArrayList<BoardFileDetail>(); // 게시글 첨부파일 목록 변수

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, pass);

	//---------------------- 자유 게시판 목록 데이터 가져오기 ---------------------------------------------
	String sql = "SELECT board_Id, content, title, m.nicknm, b.created_at, b.hit " + "  FROM board b      "
	+ " INNER JOIN member m" + " ON b.created_by = m.member_id   " + " WHERE b.board_id = ? AND b.type = 'F'"; // 자유게시판 F 데이터만 가져옴!

	psmt = conn.prepareStatement(sql);
	psmt.setInt(1, boardId);
	rs = psmt.executeQuery();

	if (rs.next()) {
		board.setBoardId(rs.getInt("board_Id"));
		board.setContent(rs.getString("content"));
		board.setTitle(rs.getString("title"));
		board.setNicknm(rs.getString("nicknm"));
		board.setCreatedAt(rs.getString("created_at"));
		board.setHit(rs.getInt("hit"));

	}
	//---------------------- 자유 게시판 목록 데이터 가져오기 ---------------------------------------------

	//---------------------- 첨부 파일 데이터 가져오기 ---------------------------------------------

	if (psmt != null)
		psmt.close();
	if (rs != null)
		rs.close();

	sql = "select * from board_file_detail t inner join board b on t.file_id = b.file_id where board_id = ?";

	psmt = conn.prepareStatement(sql);
	psmt.setInt(1, boardId);

	rs = psmt.executeQuery();

	while (rs.next()) {
		// 각 행의 데이터를 담을 BoardFile 객체를 생성합니다.
		BoardFileDetail bf = new BoardFileDetail();

		bf.setFileOrd(rs.getInt("file_ord")); // bfno 열의 값을 읽어와서 BoardFile 객체에 설정합니다.
		bf.setFileId(rs.getInt("file_id"));
		bf.setFileRealNm(rs.getString("file_real_nm"));
		bf.setFileOriginNm(rs.getString("file_origin_nm"));
		bf.setCreatedAt(rs.getString("created_at"));

		bflist.add(bf);
	}

} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (conn != null)
		conn.close();
	if (psmt != null)
		psmt.close();
	if (rs != null)
		rs.close();
}
%>


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


	<!-- view section -->
	<section class="about_section layout_padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading_container">
						<h2 class="mb-4">자유게시판 상세보기</h2>
					</div>
					<div class="text-right">
						<button onclick="location.href='list.jsp'" type="button"
							class="btn btn-secondary">목록</button>
					</div>


					<h3 class="mb-3">
						제 목 :
						<%=board.getTitle()%></h3>
					<p class="mb-2">
						닉네임 :
						<%=board.getNicknm()%></p>
					<hr>
					<p class="mb-2">
						작성일 :
						<%=board.getCreatedAt()%>
						| 조회수 :
						<%=board.getHit()%></p>

					<div class="col">
						<h5>첨부파일</h5>
						<%
						for (BoardFileDetail tempbf : bflist) {
						%>
						<a
							href="download.jsp?realNM=<%=tempbf.getFileRealNm()%>&originNM=<%=tempbf.getFileOriginNm()%>"><%=tempbf.getFileOriginNm()%></a><br>
						<%
						}
						%>
					</div>

					<div class="card mb-4">
						<div class="card-body"
							style="background-color: rgba(148, 87, 235, 0.5);">
							<!-- 배경색 변경 가능! -->
							<p class="card-text"><%=board.getContent()%></p>
						</div>
					</div>
					<div class="text-center">
						<button
							onclick="location.href='modify.jsp?board_id=<%=board.getBoardId()%>'"
							type="button" class="btn btn-info">수정</button>

						<button onclick="delFn()" type="button" class="btn btn-info">삭제</button>
					</div>
					<script>
						function delFn() {
							let isDel = confirm("정말 삭제하시겠습니까?");

							if (isDel) {
								document.frm.submit();
							}
						}
					</script>
					<form name="frm" action="delete.jsp" method="post">
						<input type="hidden" name="board_id"
							value="<%=board.getBoardId()%>">
					</form>

				</div>
			</div>
		</div>
	</section>


	<!-- end view section -->


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