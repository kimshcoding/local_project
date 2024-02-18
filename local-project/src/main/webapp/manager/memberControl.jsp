<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="local.vo.*"%>
<%@ page import="java.sql.*"%>
<%
Member member = (Member) session.getAttribute("login"); 

request.setCharacterEncoding("UTF-8");

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;
/* String url = "jdbc:mysql://192.168.0.88:3306/localboard";  */
String url = "jdbc:mysql://localhost:3306/localboard"; 
String user = "cteam";
String pass = "1234";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, pass);

	String sql = " SELECT member_id, email, nicknm, phone, status, created_at, stop_reason, stop_start_date, stop_end_date "
			   + " FROM member ";
			  
	
	psmt = conn.prepareStatement(sql);
	rs = psmt.executeQuery();
	

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



	<!-- about section -->
	<section class="about_section layout_padding">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <%@ include file="header.jsp"%>
                <div class="heading_container">
                    <h3>회원 관리</h3>
                </div>
                <br>
                <!-- 테이블 섹션 -->
                <div>
                    <table class="table table-hover table-striped fluid">
                        <thead class="table-warning">
                            <tr>
                               <th scope="col" class="col-1">NO</th>
                                <th scope="col" class="col-2">이메일</th>
                                <th scope="col" class="col-1">닉네임</th>
                                <th scope="col" class="col-2">전화번호</th>
                                <th scope="col" class="col-1">가입일시</th>
                                <th scope="col" class="col-2">회원상태</th>
                                <th scope="col" class="col-2">정지사유</th>
                                <th scope="col" class="col-2">정지시작일</th>
                                <th scope="col" class="col-1">정지종료일</th>
                                <th scope="col" class="col-1">신고건</th>
                                <th scope="col" class="col-2">처리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            while (rs.next()){
                                int memberId = rs.getInt("member_id");
                                String email = rs.getString("email");
                                String nicknm = rs.getString("nicknm");
                                String phone = rs.getString("phone");
                                String status = rs.getString("status");
                                String createdAt = rs.getString("created_at");
                                String stopReason = rs.getString("stop_reason");
                                String stopStartDate = rs.getString("stop_start_date");
                                String stopEndDate = rs.getString("stop_end_date");
                            %>
                            <tr>
                               <td class="col-1"><%=memberId%></td>
                                <td class="col-2"><%=email%></td>
                                <td class="col-1"><%=nicknm%></td>
                                <td class="col-2"><%=phone%></td>
                                <td class="col-1"><%=createdAt%></td>
                                <td class="col-2"><%=status%></td>
                                <td class="col-2" id="test"><%=stopReason%></td>
                                <td class="col-2"><%=stopStartDate%></td>
                                <td class="col-1"><%=stopEndDate%></td>
                                <td class="col-1">1</td>
                                <td class="col-2">
                                    <!-- 모달을 트리거하는 버튼 -->
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal_<%=memberId%>">정지</button>
                                    <button type="button" class="btn btn-success">탈퇴</button>
                                </td>
                            </tr>
                            <!-- 모달 -->
                            <div class="modal fade" id="myModal_<%=memberId%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">정지 처리 수정</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Ajax를 사용해 stopReason 업데이트하는 폼 -->
                                            <form id="updateForm_<%=memberId%>">
                                                <div class="form-group">
                                                    <label for="stopReason">회원 상태:</label>
                                                    <input type="text" class="form-control" id="status_<%=memberId%>" value="<%=status%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="stopReason">정지 사유:</label>
                                                    <input type="text" class="form-control" id="stopReason_<%=memberId%>" value="<%=stopReason%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="stopReason">정지시작일:</label>
                                                    <input type="text" class="form-control" id="stopStartDate_<%=memberId%>" value="<%=stopStartDate%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="stopReason">정지종료일:</label>
                                                    <input type="text" class="form-control" id="stopEndDate_<%=memberId%>" value="<%=stopEndDate%>" required>
                                                </div>                                               
                                                <div class="text-center">                                             
                                                <button type="button" class="btn btn-primary" onclick="updateStopReason(<%=memberId%>)">저장</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Ajax 호출을 위한 스크립트 추가 -->
<script>
    function updateStopReason(memberId) {
        var newStatus = $("#status_" + memberId).val();
        var newStopReason = $("#stopReason_" + memberId).val();
        var newStopStartDate = $("#stopStartDate_" + memberId).val();
        var newStopEndDate = $("#stopEndDate_" + memberId).val();
        
        
        $.ajax({
            type: "POST",
            url: "updateStop.jsp", // 업데이트를 처리할 서블릿 또는 서버 측 스크립트 지정
            data: { member_id: memberId, 
            		stop_reason: newStopReason, 
            		status: newStatus, 
            		stop_start_date: newStopStartDate, 
            		stop_end_date: newStopEndDate },
            		
            success: function(response) {
                // 성공 처리, 예를 들어 모달 닫기 또는 UI 업데이트
            	   // 서버에서 받은 응답 데이터                              	 
            	   location.reload();

                // 모달 닫기
                $("#myModal_" + memberId).modal('hide');
            },
            error: function(error) {
                // 오류 처리, 예를 들어 오류 메시지 표시
                console.error("정지 사유 업데이트 오류:", error);
            }
        });
    }
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
<%
} catch (Exception e) {
e.printStackTrace();
} finally {
if (conn != null) conn.close();
if (psmt != null) psmt.close();
if (rs != null) rs.close();
}
%>