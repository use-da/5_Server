package edu.kh.jsp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login") //web.xml에 작성하던 <servlet>, <servlet-mapping> 태그 대체 어노테이션
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//post방식 요청 데이터 문자 인코딩 처리
		req.setCharacterEncoding("UTF-8");
		
		//전달 받은 파라미터를 얻어와 변수에 저장
		String id=req.getParameter("inputId");
		String pw=req.getParameter("inputPw");
		
		System.out.println(id);
		System.out.println(pw);
		
		String result=null;
		if(id.equals("user01") && pw.equals("pass01!")) {
			result="로그인 성공";
		}else {
			result="아이디 또는 비밀번호가 일치하지 않습니다.";
		}
		//응답 형식, 문자 인코딩 지정
		resp.setContentType("text/html; charset=UTF-8");
							//오타 시 로그인 파일이 다운로드 된다
		
		//클라이언트 응답용 스트림
		PrintWriter out= resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
			out.println("<title>로그인 결과 페이지</title>");
		out.println("</head>");
		out.println("<body>");
			out.println("<h1>로그인 결과</h1>");
			out.printf("<h3 style='color:green;'>%s</h3>", result);
			out.println("<button type='button' onclick='history.back()'>돌아가기</button>");
		out.println("</body>");
		out.println("</html>");
		
	}
}
