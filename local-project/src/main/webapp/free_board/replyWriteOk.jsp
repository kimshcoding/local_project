<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="local.vo.*" %>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="reply" class="local.vo.Reply" />
<jsp:setProperty name="reply" property="*" />
<% 
	Member member = (Member) session.getAttribute("login");
    // 사용자로부터 전송된 데이터 받기
    int parentCommentId = Integer.parseInt(request.getParameter("parentCommentId"));
    String content = request.getParameter("content");
	int boardId = Integer.parseInt(request.getParameter("board_id"));

    
    Connection conn = null;
    PreparedStatement psmt = null;

    Board board = new Board();
   
    
    try {
        // 데이터베이스 연결 정보
        String url = "jdbc:mysql://localhost:3306/localboard";
        String user = "cteam";
        String pass = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        // 답글을 데이터베이스에 추가하는 SQL 문
        String sql = "INSERT INTO reply (comment_id, content, board_id, created_by, created_ip, created_at) VALUES (?, ?, ?, ?, 1.0, NOW())";
        psmt = conn.prepareStatement(sql);

        // SQL 문의 매개변수에 값 설정
        psmt.setInt(1, parentCommentId);
        psmt.setString(2, content);
        psmt.setInt(3, boardId);
        psmt.setInt(4, member.getMemberId());

        // SQL 문 실행
        int result = psmt.executeUpdate();

        if (result > 0) {
            
%>          
       	<div class="replyRow">
				
		<%= reply.getContent() %>
							
		</div>     
  
            
<%             
        } else {
            // 답글 추가 실패
            out.print("FAIL");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("FAIL");
    } finally {
        // 연결 및 자원 해제
        try {
            if (psmt != null) psmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
