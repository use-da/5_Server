package edu.kh.servlet.controller;
//Controller : 요청에 따라 응답할 코드를 제어

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Servlet 클래스를 만들기 위해서는 
//javax.servlet.http.HttpServlet 추상 클래스(직접 객체 생성불가)를 상속받아야한다.
//-요청, 응답을 위한 방법(메서드) 제공
//tomcat에서 제공하는 클래스
public class ServletEx1 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//HttpServletRequest  : 클라이언트 정보 + 요청 관련 정보가 담긴 객체
		//HttpServletResponse : 서버가 클라이언트에게 응답하는 방법을 제공하는 객체
		
		System.out.println("이름, 나이를 제출 받아 처리할 코드 수행");
		
		//요청 시 함께 전달된 input태그의 값(==Parameter)을 얻어오는 방법
		//req.getParameter("input태그의 name속성 값");
		//-> String 형태로 입력된 값 반환
		//*얻어온 파라미터는 무조건 String*
		String inputName=req.getParameter("inputName");
		String inputAge=req.getParameter("inputAge");
		
		System.out.println(inputName+"/"+inputAge);
		
		//resp.getWriter() : 서버가 클라이언트에게 응답할 수 있는 스트림을 얻어옴
		// -> PrintWriter : 출력 전용 스트림
		//resp.setCharacterEncoding("UTF-8"); 사용X
		// 문서 형식과 문자 인코딩 지정 -> html 문서이고 문자는 UTF-8 형식으로 인코딩 되어있다.
		// -> 브라우저가 해당 내용에 맞게 해석
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(inputName+"님의 나이는 "+inputAge+"세 입니다.");
	}
}
