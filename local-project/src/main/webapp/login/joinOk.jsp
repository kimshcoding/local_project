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
		
		String sql = "INSERT INTO member(email, password, nicknm, phone, addr_extra, addr_post_code, addr_basic, addr_detail, code_id)"
				   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'N')";
		
		psmt = conn.prepareStatement(sql);
	    psmt.setString(1, member.getEmail());
		psmt.setString(2, member.getPassword());
		psmt.setString(3, member.getNicknm());
		psmt.setString(4, member.getPhone());
		psmt.setString(5, request.getParameter("extraAddress"));  // addr_extra
		psmt.setString(6, request.getParameter("postcode"));	  // addr_post_code
		psmt.setString(7, request.getParameter("address"));		  // addr_basic
		psmt.setString(8, request.getParameter("detailAddress")); //addr_detail
		/* psmt.setString(9, member.getCodeId());  */
		
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