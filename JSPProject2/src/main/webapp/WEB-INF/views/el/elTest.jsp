<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1. EL</title>
</head>
<body>
	<h1>EL(Expression Language)</h1>
	<pre>
        JSP의 표현식을 효율적이고 간단하게 작성할 수 있도록 지원하는 표현 언어

        화면에 출력할 자바 코드를 ${ key } 형식으로 작성하면 value가 출력된다.

        (추가적인 작성법도 존재한다.)

        EL의 특징
        1. get이라는 단어를 사용하지 않는다.
            화면에 표현하는 언어, 출력용 언어(set불가능)이기 때문에 get만 사용가능(생략해도 무조건get이라 생략)
        2. EL은 null을 빈칸으로 처리한다.
            \${ null인 변수 } -> 빈칸 출력
            \${ NullPointerException 발생 코드 } -> 빈칸 출력(예외 발생X)

    </pre>
    테스트 1 : <%= request.getParameter("test") %> <br>
    테스트 2 : ${ param.test }
    <%-- NullPointerException 강제 발생 --%>
<%--<%= request.getParameter("test").equals("테스트") %> --%>
    ${param.test=='테스트'}<br>
    person.name=${person.name}

    <form action="/JSPProject2/elTest" method="post">
    <!-- index.html 과 주소는 같지만 method가 다르다. -->
        이름 : <input type="text" name="inputName"><br>
        나이 : <input type="text" name="inputAge"><br>
        주소 : <input type="text" name="inputAddress" size="50"><br>
        <button type="submit">제출하기</button>
    </form>
    <hr>
    <ul>
        <li>
            <%-- 요청이 위임 되지 않아 빈칸 출력--%>
            request scope message : ${message}
        </li>
        <li>
            session scope sessionValue : ${sessionValue}
        </li>
        <li>
            application scope appValue : ${appValue}
        </li>
    </ul>  
</body>
</html>