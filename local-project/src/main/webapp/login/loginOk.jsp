<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="local.vo.Member" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%



String email = request.getParameter("email");
String password = request.getParameter("password");

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;
String url = "jdbc:mysql://localhost:3306/localboard";
String user = "cteam";
String pass = "1234";

boolean isLogin = false;
Member member = null;

int reportCount = 0; // 신고 횟수 조회
String boardReportStatus = "";
String boardCode = "";
int boardId = 0;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, pass);

    String hashedPassword = hashPassword(password);

    String sql = "SELECT email, password, nicknm, member_id, code_id, status, stop_start_date, stop_end_date "
               + "FROM member "
               + "WHERE email=? AND password=?";

    psmt = conn.prepareStatement(sql);

    psmt.setString(1, email);
    psmt.setString(2, hashedPassword);

    rs = psmt.executeQuery();

    if (rs.next()) {
        member = new Member();
        member.setMemberId(rs.getInt("member_id"));
        member.setEmail(rs.getString("email"));
        member.setNicknm(rs.getString("nicknm"));
        member.setCodeId(rs.getString("code_id").charAt(0));
        member.setStatus(rs.getString("status"));
        member.setStopStartDate(rs.getString("stop_start_date"));
        member.setStopEndDate(rs.getString("stop_end_date"));
    }

    if (psmt != null)
        psmt.close();
    if (rs != null)
        rs.close();

    // 현재 로그인한 회원의 신고한 횟수 업데이트
    String updatereportSql = " UPDATE member m "
       				 + " SET m.report_count = ( "
       				 + " SELECT COUNT(*) "
        			 + " FROM board_report br "
       				 + " WHERE br.created_by = m.member_id " // 신고한 회원 신고횟수 업데이트
       				 + " ) "
       			     + " WHERE m.member_id = ? ";

    psmt = conn.prepareStatement(updatereportSql);
    psmt.setInt(1, member.getMemberId());
    psmt.executeUpdate();

 	// 현재 로그인한 회원의 신고된 횟수 업데이트
    String updatereportedSql = " UPDATE member m "
      				 		 + " SET m.reported_count = ( "
       						 + " SELECT COUNT(*) "
       						 + " FROM board b "
      				 		 + " WHERE b.created_by = m.member_id " // 신고된 회원 신고횟수 업데이트
      				 		 + " ) "
       				 		 + " WHERE m.member_id = ? ";

    psmt = conn.prepareStatement(updatereportedSql);
    psmt.setInt(1, member.getMemberId());
    psmt.executeUpdate();
    
    
    
    
    // 현재 로그인한 회원의 신고된 횟수가 n번 이상이면 경고창 띄우기
    String warningsCountSql = "SELECT report_count FROM member WHERE member_id = ? ";

    psmt = conn.prepareStatement(warningsCountSql);
    psmt.setInt(1, member.getMemberId());
    rs = psmt.executeQuery();
    if (rs.next()){
        reportCount = rs.getInt("report_count");       
    }
    
    
    String boardWarning = "select status, board_code, board_id from board_report where modified_by = ? "
    		+ "ORDER BY created_at DESC "; // 신고 게시글 최신순 검색!
    psmt = conn.prepareStatement(boardWarning);
    psmt.setInt(1, member.getMemberId());
    rs = psmt.executeQuery();
    
    if (rs.next()){
        boardReportStatus = rs.getString("status"); // 신고 게시글 처리상태      
        boardCode = rs.getString("board_code");  	// 신고 게시글 코드     
        boardId = rs.getInt("board_id");   			// 신고 게시글 번호        
    }

    
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (conn != null)
            conn.close();
        if (psmt != null)
            psmt.close();
        if (rs != null)
            rs.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
}


//member가 null인 경우, 즉 아이디와 비밀번호가 일치하지 않는 경우
if (member == null) {
%>
<script>
 alert("아이디와 비밀번호를 확인하세요.");
 location.href="login.jsp";
</script>
<%
} else {
	
	if (boardReportStatus != null && boardReportStatus.equals("경고")) {
	    %>
	    <script>
	        // JavaScript를 사용하여 경고 메시지를 alert로 표시
	        alert("게시글 '<%=boardCode%>'의 번호 '<%=boardId%>'에 대한 신고가 접수 되었습니다. 수정해주세요!");
	    </script>
	<%
	}

		
 // 임계값 설정
 int warningThreshold = 5; // 예시: n회 이상 신고를 받으면 경고 메시지 표시

 // 경고 횟수에 따라 메시지 설정
 if (reportCount >= warningThreshold) {
%>
<script>
 // JavaScript를 사용하여 경고 메시지를 alert로 표시
 alert("경고: 사용자님, 현재까지 <%= reportCount %>회의 신고를 받으셨습니다. 주의해주세요!");
</script>
<%
 }
 

 // member의 회원 상태에 따라 로그인 처리를 분기
 if (member.getStatus().equals("quit")) { // 탈퇴한 회원
%>
<script>
 alert("탈퇴한 계정은 이용할 수 없습니다.");
 location.href="<%=request.getContextPath()%>/index.jsp";
</script>
<%
 } else if (member.getStatus().equals("active")) {
     // 정지 시작일과 종료일이 설정된 경우
     if (member.getStopStartDate() != null && member.getStopEndDate() != null) {
         Date currentDate = new Date();
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         String formattedCurrentDate = sdf.format(currentDate);

         // 현재 날짜가 정지 기간에 속하는지 확인
         if (formattedCurrentDate.compareTo(member.getStopStartDate()) >= 0 && formattedCurrentDate.compareTo(member.getStopEndDate()) <= 0) {
%>
<script>
 alert("계정이 <%=member.getStopStartDate()%>부터 <%=member.getStopEndDate()%>까지 정지되었습니다.");
 location.href="<%=request.getContextPath()%>/index.jsp";
</script>
<%
         } else {
             // 정지 기간이 아니므로 로그인을 허용합니다.
             session.setAttribute("login", member);
%>
<script>
 alert("로그인 되었습니다");
 location.href="<%=request.getContextPath()%>/index.jsp";
</script>
<%
         }
     } else {
         // 정지 시작일 또는 종료일이 지정되지 않았으므로 로그인을 진행합니다.
         session.setAttribute("login", member);
%>
<script>
 alert("로그인 되었습니다");
 location.href="<%=request.getContextPath()%>/index.jsp";
</script>
<%
     }
 } else if (member.getStatus().equals("stop")) {  // 정지된 회원
%>
<script>
 alert("계정이 정지되었습니다.");
 location.href="<%=request.getContextPath()%>/index.jsp";
</script>
<%
 } else {
%>
<script>
 alert("계정 인증정보에 오류가 발생했습니다. 다른 계정으로 로그인하세요.")
 location.href = "login.jsp";
</script>
<%
 }
}
%>



<%!
// 비밀번호 해싱 메서드
private String hashPassword(String password) {
    try {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] bytes = md.digest(password.getBytes());
        BigInteger bigInt = new BigInteger(1, bytes);
        String hashedPassword = bigInt.toString(16);

        while (hashedPassword.length() < 32) {
            hashedPassword = "0" + hashedPassword;
        }

        return hashedPassword;
    } catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
        return null;
    }
}
%>
