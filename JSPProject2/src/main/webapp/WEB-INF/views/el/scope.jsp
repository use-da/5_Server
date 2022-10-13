<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2.Servlet / JSP 내장 객체와 범위(scope)</title>
</head>
<body>
    <h1>2.Servlet / JSP 내장 객체와 범위(scope)</h1>
    <pre>
        Servlet/JSP에는 기본적으로 내장된 4개의 객체가 있다.
        4 객체는 각각 영향을 미치는 범위가 다르다.
        1. page : 현재 페이지
        -> 현재 Servlet, JSP에서만 사용 가능
        2. request : 요청받은 페이지(Servlet/JSP)와 요청을 위임 받은 페이지(Servlet/JSP)에서 사용 가능하다 
                    (최소 2페이지 이상)    <%-- ex)  request.getParameter()  --%>>
        3. session : 현재 사이트에 접속한 브라우저당 1개씩 생성, 브라우저가 종료되거나 session이 만료될 때까지 유지
                        (세션에 로그인 정보를 기록해둠 
                        -> 브라우저가 종료되거나 로그아웃이 되기 전까지 계속 로그인 상태를 유지할 수 있다.)
        4. application : 하나의 웹 어플리케이션 당 1개씩 생성
                        ->서버 시작 시 생성 되어 웹 어플리케이션이 종료될 때까지 유지
                        -> 모든 사용자가 공유하는 객체
        *request session page application 순으로 사용빈도가 높다.

        **내장 객체 우선순위
        -> setAttribute("key", value)로 내장 객체가 값을 세팅할 때 key 값이 중복되는 경우
        \${key} 로 작성하는 경우 범위가 작은 내장 객체가 높은 우선 순위를 갖게 된다.
        page > request > session > application
    </pre>
    <ul>
        <li>
            <%
                pageContext.setAttribute("pageMsg", "페이지 범위입니다.");
                pageContext.setAttribute("str", "page scope");
                
            %>
            page scope pageMsg : ${pageMsg}
        </li>
        <li>
            request scope message : ${message}
        </li>
        <li>
            session scope sessionValue : ${sessionValue}
        </li>
        <li>
            application scope appValue : ${appValue}
        </li>
    </ul>
    <hr>
    <h1>우선 순위 확인 : ${str}</h1>
    <h3>page의 str값 : ${pageScope.str}</h3>
    <h3>request의 str값 : ${requestScope.str}</h3>
    <h3>session의 str값 : ${sessionScope.str}</h3>
    <h3>application의 str값 : ${applicationScope.str}</h3>
</body>
</html>