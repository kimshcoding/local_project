<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="local.vo.Member" /> <!-- Member member = new Member(); -->
<jsp:setProperty name="member" property="*" />
<%	
	Connection conn = null;
	PreparedStatement psmt= null;
	String url = "jdbc:mysql://localhost:3306/localboard";
	String user = "cteam";
	String pass = "1234";
	int insertRow =0;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,pass);
		System.out.println("연결성공!");
		
		String sql = "INSERT INTO member(code_id, local_id, email, password, nicknm, phone, local_extra, post_code, addr, addr_detail)"
				   + "VALUES ('A','JJ', 'test3', 1, 'code', '010-1111-1111', ?, ?, ?, ?)";
		
		psmt = conn.prepareStatement(sql);
	/* 	psmt.setString(1, member.getEmail());
		psmt.setString(2, member.getPassword());
		psmt.setString(3, member.getNicknm());
		psmt.setString(4, member.getPhone()); */
		psmt.setString(1, request.getParameter("extraAddress"));
		psmt.setString(2, request.getParameter("postcode"));
		psmt.setString(3, request.getParameter("address"));
		psmt.setString(4, request.getParameter("detailAddress"));
		
		insertRow = psmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
	}
	
	if(insertRow>0){
	%>
		<script>
			alert("회원가입되었습니다.로그인을 시도하세요.");
			location.href="<%=request.getContextPath()%>/index.jsp";
		</script>
		
	<%	
	}else{
		%>
		<script>
			alert("회원가입에 실패했습니다.다시 시도하세요.");
			location.href="join.jsp";
		</script>
		
		<%
	}
	
	
	
	
%>