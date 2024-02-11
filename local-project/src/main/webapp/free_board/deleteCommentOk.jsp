<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String commentIdParam = request.getParameter("commentid");

int commentId = 0;
if (commentIdParam != null && !commentIdParam.equals("")) {
	commentId = Integer.parseInt(commentIdParam);
}

Connection conn = null;
PreparedStatement psmt = null;
String url = "jdbc:mysql://localhost:3306/localboard";
String user = "cteam";
String pass = "1234";

try {

	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, pass);

	String sql = " UPDATE comment SET delyn = 'Y' WHERE comment_id = ?";

	psmt = conn.prepareStatement(sql);
	psmt.setInt(1, commentId);

	int result = psmt.executeUpdate();

	if (result > 0) {
		out.print("SUCCESS");
	} else {
		out.print("FAIL");
	}

} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (conn != null)
		conn.close();
	if (psmt != null)
		psmt.close();
}
%>