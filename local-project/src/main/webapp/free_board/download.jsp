<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String realNM = request.getParameter("realNM");
	String originNM = request.getParameter("originNM");
	
	String root = "C:\\Users\\migue\\git\\local_project\\local-project\\src\\main\\webapp\\upload";
	
	InputStream in = null;
	OutputStream os = null;
	File file = null;
	boolean skip = false;
	String client = "";


	try{
		

		// 파일을 읽어 스트림에 담기
		try{
			file = new File(root, realNM);
			in = new FileInputStream(file);
		}catch(FileNotFoundException fe){
			skip = true;
		}



		
		client = request.getHeader("User-Agent");

		// 파일 다운로드 헤더 지정
		response.reset() ;
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Description", "JSP Generated Data");


		if(!skip){

			
			// IE
			if(client.indexOf("MSIE") != -1){
				response.setHeader ("Content-Disposition", "attachment; filename="+new String(originNM.getBytes("KSC5601"),"ISO8859_1"));

			}else{
				// 한글 파일명 처리
				originNM = new String(originNM.getBytes("utf-8"),"iso-8859-1");

				response.setHeader("Content-Disposition", "attachment; filename=\"" + originNM + "\"");
				response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
			}  
			
			response.setHeader ("Content-Length", ""+file.length() );


	  
			os = response.getOutputStream();
			byte b[] = new byte[(int)file.length()];
			int leng = 0;
			
			while( (leng = in.read(b)) > 0 ){
				os.write(b,0,leng);
			}

		}else{
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");

		}
		
		in.close();
		os.close();

	}catch(Exception e){
	  e.printStackTrace();
	}
%>