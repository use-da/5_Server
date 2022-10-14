<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
    prefix : 접두사
    uri(Uniform Resource Identifier) : 자원의 위치를 나타내는 유일한 식별자(주소)
--%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3. JSTL</title>
    <style>
        .first{
            background-color: yellow;
        }
        .last{
            background-color: black;
            color: white;
        }
    </style>
</head>
<body>
    <h1>JSTL(Jsp Standard Tag Library)</h1>
    <pre>
        JSP에서 자주 사용되거나 공통적으로 사용되는 Java코드를 태그화해 표준으로 제공하는 라이브러리

        (if, for, 배열/컬렉션 길이, 문자열 치환, 숫자 데이터 형식 변경등)
    </pre>
    <h3>JSTL 라이브러리 등록 방법</h3>
    <ol>
        <li>https://tomcat.apache.org/download-taglibs.cgi접속</li>
        <li>Jar Files -> Impl, Spec, EL download</li>
        <li>webapp/WEB-INF/lib에 복사</li>
    </ol>
    <hr>
    <h3>JSTL 사용을 위한 선언 방법</h3>
    <pre>
        JSP 파일 최상단에 추가하고자 하는 JSTL taglib를 추가
    </pre>
    <hr>
    <h1>1. 변수 선언( c:set태그 )</h1>
    <pre>
        변수를 선언하고 값을 초기화하는 태그
        (원하는 scope의 내장 객체에 값 세팅)
        
        c:set 속성
        1) var : 변수명(setAttribute의 key값)
        2) value : 대입될 값
        3) scope : 내장 객체 범위(page(기본값), request, session, application)
    </pre>
    <%-- scriptlet 작성법 --%>
    <% pageContext.setAttribute("num1", 10); %>

    <%-- JSTL 작성법 --%>
    <c:set var="num2" value="20"/>

    ${num1} / ${num2}

    <!-- request scope -->
    <c:set var="num2" value="300" scope="request"/>
    <h4>${num2}</h4> <!--20-->
    <h4>${requestScope.num2}</h4> <!--300-->

    <c:set var="temp" value="임시 값" scope="session"/>
    <h4>temp : ${temp}</h4>
    <hr>
    <h1>2. 변수 삭제( c:remove태그 )</h1>
    <pre>
        - c:set / setAttribute()로 추가된 값 제거
        - c:remove 속성
        1) var : 제거할 변수명(key)
        2) scope : 삭제할 내장 객체 범위(기본값 : 모든 범위)
    </pre>
    <p>
        <c:remove var="temp"/> temp삭제 : ${temp } <br>
        <c:set var="test" value="page"        scope="page"/> <br>
        <c:set var="test" value="request"     scope="request"/> <br>
        <c:set var="test" value="session"     scope="session"/> <br>
        <c:set var="test" value="application" scope="application"/> <br>

        <c:remove var="test" scope="request"/> <br>
        ${pageScope.test} / ${requestScope.test} / ${sessionScope.test} / ${applicationScope.test} <br>
        <c:remove var="test"/> <br>
        ${pageScope.test} / ${requestScope.test} / ${sessionScope.test} / ${applicationScope.test} <br>
    </p>
    <hr>
    <h1>3. 조건문 - if( c:if태그 )</h1>
    <pre>
        단독 if문 (else없음)
        주의사항
        1) test 속성 값 작성은 무조건 EL 구문이어야 한다.
        2) test 속성 값 "" 안에는 공백이 존재해서는 안된다.
    <%-- scriptlet 작성법 --%>
    <% if(1==1) { %>
        출력
    <% } %>
    <%-- JSTL 작성법 --%>
    <c:if test="${1==1}">
        JSTL 작성법 
    </c:if>

    <%-- session 범위에 세팅된 test값이 "session"인 경우
        -문자열 비교 시 (==) 비교연산자 사용가능
        -문자열 표기하는 리터럴 == ''(홑따옴표) / "" (쌍따옴표)
        html 태그 속성="속성값"  -> 내부 문자열에 ''
        html 태그 속성='속성값'  -> 내부 문자열에 ""
    --%>
    <c:set var="test" value="session"     scope="session"/>
    <c:if test="${ sessionScope.test == 'session'}">
        <h4>sessionScope.test == 'session'</h4>
    </c:if>
    <%-- 단독 if문인 경우 단점 : else 상황에 대한 if문 별도 작성 필요
        + 효율성 감소 문제(모든 if문 검사)--%>
    <c:if test="${ sessionScope.test != 'session'}">
        <h4>sessionScope.test != 'session'</h4>
    </c:if>
    <hr>
    <h1>4. 조건문 - if~else if~else ( c:choose, c:when, c:otherwise )</h1>
    <pre>
        c:choose     : when, otherwise 태그를 감싸는 태그(조건문 시작)
        c:when       : if/ else if를 나타내는 태그, 속성test에 조건식 작성
        c:otherwise  : else를 나타내는 태그, 속성 없음
    </pre>
    <c:set var="temp2" value="150"/>
    <c:choose>
        <c:when test="${temp2 > 100}">
            100보다 크다
        </c:when>
        <c:when test="${temp2 < 100}">
            100보다 작다
        </c:when>
        <c:otherwise>
            100과 같다
        </c:otherwise>
    </c:choose>
    <hr>
    <h1>5. 반복문 - for ( c:forEach )</h1>
    <pre>
        - 일반 for + 추가기능
        - c:forEach 속성
        1) var : 반복횟수에 해당하는 변수 (int i)
        2) begin : 반복 시 var 시작 값(기본값 : 0)
        3) end : 반복 종료될 var 값(기본값 : items의 크기 - 1)
        4) step : 반복마다 var 증가값(기본값 : 1)
        5) items : 반복할 객체(배열, 컬렉션 객체)
        6) varStatus : 현재 반복 상태와 관련된 정보를 제공하는 변수 선언
                        varStatus="변수명"
            *varStatus에서 제공되는 값
            - current : 현재 반복 횟수(현재 var값)
                        현재 반복 접근 중인 객체(컬렉션/배열 요소)
            - index : 현재 인덱스값 반환(0부터 시작)
            - count : 현재 몇바퀴인지 반복 횟수(1부터 시작)
            - first : 첫번째 반복인지 여부(true/false)
            - last : 마지막 반복인지 여부(true/false)
            - begin : 시작값
            - end : 종료값
            - step : 증가값
    </pre>
    <h3>일반 for문 사용</h3>
    <c:forEach var="i" begin="1" end="6" step="1">
        <h${i}>현재 i값 : ${i}</h${i}>
    </c:forEach>

    <h3>일반 for문 + varStatus 사용</h3>
    <table border="1">
        <c:forEach var="n" begin="1" end="10" step="1" varStatus="vs">
            <c:choose>
                <%-- choose 내부에는 무조건 JSP 주석만 작성--%>
                <%-- 첫번째 반복--%>
                <c:when test="${vs.first}">
                    <tr>
                        <th class="first">${n}</th>
                        <td class="first">${n}번 게시글입니다.</td>
                    </tr>
                </c:when>
                <%-- 마지막 반복--%>
                <c:when test="${vs.last}">
                    <tr>
                        <th class="last">${n}</th>
                        <td class="last">${n}번 게시글입니다.</td>
                    </tr>
                </c:when>
                <%-- 첫번째, 마지막 반복이 아닌 나머지 반복--%>
                <c:otherwise>
                    <tr>
                        <th>${n}</th>
                        <td>${n}번 게시글입니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    <h3>향상된 for문 형식으로 사용</h3>
    <!--
        현재 페이지 주소 : /JSPProject2/jstl
        목표 페이지 주소 : /JSPProject2/jstl
    -->
    <form action="forEach" method="get">
    
        <input type="checkbox" name="lang" value="java"> java <br>
        <input type="checkbox" name="lang" value="sql"> sql <br>
        <input type="checkbox" name="lang" value="jdbc"> jdbc <br>
        <input type="checkbox" name="lang" value="html"> html <br>
        <input type="checkbox" name="lang" value="css"> css <br>
        <input type="checkbox" name="lang" value="javascript"> javascript <br>
        <input type="checkbox" name="lang" value="jQuery"> jQuery <br>
        <input type="checkbox" name="lang" value="servlet"> servlet <br>
        <input type="checkbox" name="lang" value="jsp"> jsp <br>
    
        <button>제출</button>
    </form>
</body>
</html>