package loadmore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loadMoreServlet")
public class LoadMoreServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // 데이터베이스 연결 설정
            // (실제 연결 세부 정보로 교체)
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.0.88:3306/localboard", "cteam",
                    "1234")) {
                // 추가 게시물을 가져오기 위한 SQL 쿼리 준비 및 실행
                String sql = "SELECT board_id, title, b.local_id, m.nicknm, b.created_at, b.hit "
                        + "FROM board b INNER JOIN member m ON b.created_by = m.member_id "
                        + "WHERE b.delyn = 'N' ORDER BY b.created_at DESC LIMIT ?, ?";
                try (PreparedStatement psmt = conn.prepareStatement(sql)) {
                    int start = Integer.parseInt(request.getParameter("start"));
                    int count = Integer.parseInt(request.getParameter("count"));
                    psmt.setInt(1, start);
                    psmt.setInt(2, count);

                    try (ResultSet rs = psmt.executeQuery()) {
                        // 응답에 추가 게시물의 HTML 내용 추가
                        while (rs.next()) {
                            // 테이블 구조에 맞게 HTML 구조를 조정하세요
                            out.println("<tr>");
                            out.println("<th scope=\"row\">" + rs.getInt("board_id") + "</th>");
                            out.println("<td>" + rs.getString("local_id") + "</td>");
                            out.println("<td><a href=\"view.jsp?board_id=" + rs.getInt("board_id") + "\">"
                                    + rs.getString("title") + "</a></td>");
                            out.println("<td>" + rs.getString("created_at") + "</td>");
                            out.println("<td>" + rs.getString("nicknm") + "</td>");
                            out.println("<td><div class=\"badge bg-success\">" + rs.getInt("hit") + "</div></td>");
                            out.println("</tr>");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
