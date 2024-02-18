<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="local.vo.Member"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
//1.파라미터 아이디와 패스워드를 얻어온다.
String email = request.getParameter("email");
String password = request.getParameter("password");

//2.DB에 연결한다.
Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;
String url = "jdbc:mysql://localhost:3306/localboard";
String user = "cteam";
String pass = "1234";

boolean isLogin = false;

Member member = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, pass);

    //3.연결된 DB에서 아래 sql을 호출한다.
    String sql = " SELECT email "
               + " ,password    "
               + " ,nicknm      "
               + " ,member_id   "
               + " ,code_id     "
               + " ,status      "
               + " ,stop_start_date "
               + " ,stop_end_date   "
               + " FROM member "
               + " WHERE email=? "
               + " AND password= ? ";

    psmt = conn.prepareStatement(sql);

    psmt.setString(1, email);
    psmt.setString(2, password);

    rs = psmt.executeQuery();

    //4.가져온 결과가 존재 하는지 확인한다.
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



if (member == null) {
%>
<script>
    alert("아이디와 비밀번호를 확인하세요.");
    location.href="login.jsp";
</script>
<%
} else {
    if (member.getStatus().equals("quit")) { // 탈퇴한 회원
%>
<script>
    alert("탈퇴한 계정은 이용할 수 없습니다.");
    location.href="<%=request.getContextPath()%>/index.jsp";
</script>
<%
    } else if (member.getStatus().equals("active")) {
        if (member.getStopStartDate() != null && member.getStopEndDate() != null) {
            Date currentDate = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = sdf.format(currentDate);

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
            // stop_start_date 또는 stop_end_date가 지정되지 않았으므로 로그인을 진행합니다.
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
