package edu.kh.jsp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.jsp.model.vo.Person;

@WebServlet("/elTest")
public class ELTestServlet extends HttpServlet{
	//데이터 전달 방식에 따라 하나의 요청 주소로 여러가지 처리가 가능하다
	//GET-select POST-insert PUT-update DELETE-
	
	//a태그로 요청(GET)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/el/elTest.jsp");
		//WEB-INF폴더는 외부 요청을 통해 접근불가 단, 내부 요청(Servlet, JSP)을 통한 직접 접근은 가능
		
		dispatcher.forward(req, resp);
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String name=req.getParameter("inputName");
		int age=Integer.parseInt(req.getParameter("inputAge"));
		String address=req.getParameter("inputAddress");
		
		String message= name + "님은" + age + "세 입니다. " + address+ "에 거주 중입니다.";
		
		//Preson 객체 생성
		Person p= new Person();
		
		p.setName(name+"님");
		p.setAge(age + 10000);
		p.setAddress("대한민국"+address);
		
		//요청 발송자 생성
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/el/elResult.jsp");
		
		//요청 위임 시 추가할 값 세팅
		req.setAttribute("message", message);
		req.setAttribute("person", p);
		
		List<String>list2=null;                //null
		List<String>list3=new ArrayList<>();   //비어 있는 리스트
		List<String>list4=new ArrayList<>();   //값이 있는 리스트
		list4.add("테스트");
		
		req.setAttribute("list2", list2);
		req.setAttribute("list3", list3);
		req.setAttribute("list4", list4);
		
		dispatcher.forward(req, resp);
		
	}
}
