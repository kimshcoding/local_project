<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.math.BigInteger" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="local.vo.Member" scope="page" /> <!-- Member member = new Member(); -->
<jsp:setProperty name="member" property="*" />

<%

	if(member != null )
	{
		System.out.println(member.toString());
	}
	
	Connection conn = null;
	PreparedStatement psmt= null;
	ResultSet rs = null;
	String url = "jdbc:mysql://192.168.0.88:3306/localboard";
	String user = "cteam";
	String pass = "1234";
	
	
	
	int result = 0;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,pass);
		
		// 입력받은 비밀번호를 SHA-256으로 암호화
        String hashedPassword = hashPassword(member.getPassword());
		
		String sql = "UPDATE member "
				   + "   SET password = ? "
				   + "     , phone = ? "
				   + "     , nicknm = ? "
				   + " WHERE member_id = ? ";
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1,hashedPassword);
		psmt.setString(2,member.getPhone());
		psmt.setString(3,member.getNicknm());
		psmt.setInt(4,member.getMemberId());
		 
		System.out.println(member.getPassword());
		result = psmt.executeUpdate();
		
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
	}
	
	if(result>0){
%>
	<script>
		alert("수정이 완료되었습니다.");
		location.href="myPageList.jsp?memberId=<%=member.getMemberId() %>";
	</script>	
<%
	}else{
%>
		<script>
			alert("수정이 완료되지 않았습니다.");
			location.href="myPageList.jsp?memberId=<%=member.getMemberId() %>";
		</script>	
<%		
	}
	
%>
<%!
    // 비밀번호를 SHA-256으로 암호화하는 메서드
    private String hashPassword(String password) {
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
%>