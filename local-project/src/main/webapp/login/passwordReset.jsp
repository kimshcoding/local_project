<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="local.vo.Member" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.DataHandler" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 리셋</title>
</head>
<body>
    <%
        // 사용자로부터 이메일을 입력받음
        String email = request.getParameter("email");

        // 사용자로부터 입력받은 이메일로 비밀번호 재설정 처리 진행
        if (email != null && !email.isEmpty()) {
            Member member = getMemberByEmail(email);

            if (member != null) {
                // 임시로 생성된 비밀번호 생성
                String newPassword = generateRandomPassword();

                // 비밀번호를 해시하여 DB에 저장
                updatePassword(member.getMemberId(), hashPassword(newPassword));

                // 비밀번호 재설정 이메일 전송
                sendPasswordResetEmail(email, newPassword);

                out.println("<h1>비밀번호가 재설정되었습니다.</h1>");
                out.println("<p>새로운 비밀번호가 이메일로 발송되었습니다. 로그인 후 비밀번호를 변경하세요.</p>");
            } else {
                out.println("<h1>존재하지 않는 이메일 주소입니다.</h1>");
            }
        }
    %>
</body>
</html>

<%!
	// 사용자 정보를 이메일 주소를 기반으로 DB에서 가져오는 메서드
	Member getMemberByEmail(String email) {
	    Member member = null;
	    Connection conn = null;
	    PreparedStatement psmt = null;
	    ResultSet rs = null;
	
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        String url = "jdbc:mysql://localhost:3306/localboard";
	        String user = "cteam";
	        String pass = "1234";
	        conn = DriverManager.getConnection(url, user, pass);
	
	        String sql = "SELECT * FROM member WHERE email = ?";
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, email);
	        rs = psmt.executeQuery();
	
	        if (rs.next()) {
	            member = new Member();
	            member.setMemberId(rs.getInt("member_Id"));
	            member.setEmail(rs.getString("email"));
	            member.setNicknm(rs.getString("nicknm"));
	            member.setCodeId(rs.getString("code_Id").charAt(0));
	            member.setStatus(rs.getString("status"));
	            member.setCreatedAt(rs.getString("created_at"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 예외 처리 - 적절한 방식으로 처리하세요.
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (psmt != null) psmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	
	    return member;
	}
	
	//비밀번호를 해시화하는 메서드
	String hashPassword(String password) {
	    try {
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        byte[] bytes = md.digest(password.getBytes());
	        BigInteger bigInt = new BigInteger(1, bytes);
	        String hashedPassword = bigInt.toString(16);
	
	        // 32자리가 되지 않을 경우 앞에 0을 채워줌
	        while (hashedPassword.length() < 32) {
	            hashedPassword = "0" + hashedPassword;
	        }
	
	        return hashedPassword;
	    } catch (NoSuchAlgorithmException e) {
	        e.printStackTrace();
	        // 예외 처리 - 적절한 방식으로 처리하세요.
	        return null;
	    }
	}

	 // 사용자 비밀번호를 업데이트하는 메서드
    void updatePassword(int memberId, String hashedPassword) {
        // DB에서 비밀번호를 업데이트하는 로직을 추가하세요.
        // 예를 들어, UPDATE member SET password = ? WHERE member_Id = ?;
        // PreparedStatement를 사용하여 안전하게 처리하세요.
        // ...

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/localboard";
            String user = "cteam";
            String pass = "1234";
            Connection conn = DriverManager.getConnection(url, user, pass);

            String sql = "UPDATE member SET password = ? WHERE member_Id = ?";
            try (PreparedStatement psmt = conn.prepareStatement(sql)) {
                psmt.setString(1, hashedPassword);
                psmt.setInt(2, memberId);
                psmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 - 적절한 방식으로 처리하세요.
        }
    }
	
	
	
    // 임시로 생성된 비밀번호를 랜덤하게 생성하는 메서드
    String generateRandomPassword() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder newPassword = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < 8; i++) {
            newPassword.append(characters.charAt(random.nextInt(characters.length())));
        }

        return newPassword.toString();
    }

    // 비밀번호 재설정 이메일을 발송하는 메서드
    void sendPasswordResetEmail(String toEmail, String newPassword) {
        String fromEmail = "hyeon5807@gmail.com"; // 발송자 이메일 주소
        String host = "smtp.gmail.com"; // SMTP 호스트 (Gmail 사용 예시)

        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // 세션 생성 및 인증 정보 설정
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("hyeon5807@gmail.com", "vbdc fhop utol jqip"); // 발송자 이메일 계정 정보
            }
        });

        try {
            // 메시지 생성
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("비밀번호 재설정 안내");
            message.setText("새로운 비밀번호: " + newPassword);

            // 메일 발송
            Transport.send(message);
            System.out.println("이메일을 발송했습니다.");
           
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
%>