package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/geolocation/index.do")
public class LocationController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    
    
    // JDBC 연결 정보
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/localboard";
    private static final String DB_USER = "cteam";
    private static final String DB_PASSWORD = "1234";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double latitude = Double.parseDouble(request.getParameter("latitude"));
        double longitude = Double.parseDouble(request.getParameter("longitude"));

        // 여기에서 위치 정보를 기반으로 인증을 수행하는 로직을 작성
        // 예시로 간단히 모든 위치를 허용하는 것으로 처리
        boolean authenticated = authenticateLocation(latitude, longitude);

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print("Authenticated: " + authenticated);
        out.flush();
    }

    private boolean authenticateLocation(double latitude, double longitude) {
        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 데이터베이스 연결
            try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
                // 위치 정보를 데이터베이스에 저장 (이미 저장되어 있다면 중복 저장 방지를 위해 먼저 검색)
                if (!locationExists(conn, latitude, longitude)) {
                    saveLocation(conn, latitude, longitude);
                }

                // 여기에서 위치 정보를 기반으로 실제 인증 로직을 수행
                // 예시로 간단히 모든 위치를 허용하는 것으로 처리
                return true;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean locationExists(Connection conn, double latitude, double longitude) throws SQLException {
        String query = "SELECT * FROM user_location WHERE latitude = ? AND longitude = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setDouble(1, latitude);
            pstmt.setDouble(2, longitude);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    private void saveLocation(Connection conn, double latitude, double longitude) throws SQLException {
        String query = "INSERT INTO user_location (latitude, longitude) VALUES (?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setDouble(1, latitude);
            pstmt.setDouble(2, longitude);
            pstmt.executeUpdate();
        }
    }
}
