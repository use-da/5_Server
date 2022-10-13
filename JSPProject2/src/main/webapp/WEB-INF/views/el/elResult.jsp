<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- Person클래스 import --%>
<%@ page import="edu.kh.jsp.model.vo.Person"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EL 결과</title>
</head>
<body>
	<h3>EL을 이용해 출력하기</h3>
	<h4>파라미터</h4>
	<pre>
        \${ param.name속성 값 }
		EL로 request에 세팅된 파라미터를 얻어오는 방법이다.
        + 데이터 파싱(String -> int)도 자동으로 된다.
	</pre>		
	이름 : ${ param.inputName } <br>
	나이 : ${ param.inputAge } <br>
	주소 : ${ param.inputAddress }

    <h4>추가 세팅된 값</h4>
    <pre>
        \${ 세팅한 key 값 }
        1) EL로 request에 추가 세팅된 값을 얻어올 때 별도의 다운 캐스팅이 필요 없다.
        2) import 구문도 생략 가능하다.
        3) 객체에 저장된 값을 얻어올 때 getter호출 시 get필드명()이 아닌 필드명으로 호출한다.
    </pre>

    메세지 : ${ message } <br>

    person의 name : ${ person.name } <br>
    person의 age : ${ person.age } <br>
    person의 address : ${ person.address } <br>
    person.toString() : ${ person } <br>

    <h3>스크립틀릿, 표현식을 이용해서 값 출력하기</h3>
    <%
    String inputName = request.getParameter("inputName");
    int inputAge = Integer.parseInt(request.getParameter("inputAge"));
    String inputAddress = request.getParameter("inputAddress");
    
    String message = (String)request.getAttribute("message");
    Person person= (Person)request.getAttribute("person");
    %>
    <h4>파라미터</h4>
    이름 : <%=inputName%><br>
    나이 : <%=inputAge%><br>
    주소 : <%=inputAddress%>

    <h4>추가 세팅된 값</h4>
    메세지 : <%=message%><br>
    person의 name : <%=person.getName()%><br>
    person의 age : <%=person.getAge()%><br>
    person의 address : <%=person.getAddress()%><br>
    person.toString() : <%=person.toString()%> 

    <hr>
    <h3>EL에서 null과 '비어있다'에 대한 처리 방법</h3>
    <%--       참조X / 객체에 존재하는 내용(요소)가 없다--%>
    <h4>empty : 비어있거나 null인지 검사하는 연산자</h4>
    <h4>\${ 값 == null } /   \${ 값 eq null}  : null인지 검사하는 방법</h4>
    <h4>\${ 값 != null } /   \${ 값 ne null}  : null이 아닌지 검사하는 방법</h4>
    <pre>
        list2== null : ${ list2 == null } 
        list2 eq null : ${ list2 eq null } 

        list2 != null : ${ list2 != null } 
        list2 ne null : ${ list2 ne null } 

        empty list2 : ${empty list2} 
        --> empty가 null도 비어있다고 판단

        *list3 : null X , 비어있다.
        list3 eq null : ${ list3 eq null }
        empty list3 : ${empty list3}
        list3에 요소가 있는지 확인 :  ${!empty list3}
        list3에 요소가 있는지 확인 :  ${not empty list3} 

        *list4 : null X , 요소 있음
        list4 eq null : ${ list4 eq null }
        empty list4 : ${empty list4}
        list4에 요소가 있는지 확인 :  ${!empty list4}
        list4에 요소가 있는지 확인 :  ${not empty list4} 

        <!-- java : list4.get(0) -->
        list4의 0번 인덱스에 존재하는 값 : ${list4[0]}
        --> EL은 List에 존재하는 요소를 얻어올 때 배열처럼 [index번호]를 입력해 얻어온다.
    </pre>
</body>
</html>