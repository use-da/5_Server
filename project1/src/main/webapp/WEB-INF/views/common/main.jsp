<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수업용 프로젝트</title>
    <link rel="stylesheet" href="/project1/resources/css/main-style.css">
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
</head>
<body>
    <!--
        기존 영역 분할에 사용한 div, span태그는 태그의 이름만 봤을 때
        나눈다는 것 이외의 의미를 파악할 수 없다.
        -> id 또는 class 속성을 추가해야하는 번거로움이 있다.

        이러한 문제를 해결하기 위해 HTML5부터 태그의 이름만으로 어떤 역할을 하는지 알 수 있고
        추가적으로 웹 접근성 향상에 도움이 되는 시맨틱 태그(semantic tag)가 추가되었다.

        * 시맨틱 태그는 div 태그가 이름만 바뀐 것으로 생각하는게 좋다.

        [시맨틱 태그 종류]
        <main>    : 문서의 주요 내용을 작성하는 영역
        <header>  : 문서의 제목, 머리말 영역
        <footer>  : 문서의 하단 부분, 꼬리말 영역
        <nav>     : 문서의 네비게이션(다른 페이지, 사이트 이동) 링크 영역
        <aside>   : 문서의 사이드바, 광고 등의 영역
        <section> : 문서의 구역 구분을 위한 영역
        <article> : 문서의 본문 영역
    -->
    <main>
        <header>
            <section>
                <!--클릭 시 메인 페이지로 이동하는 로고-->
                <a herf="#">
                    <img src="/project1/resources/images/logo.jpg" id="home-logo">
                </a>
            </section>
            <section>
                <article class="search-area">
                    <!--내부 input 태그의 값을 서버 또는 페이지로 전달(제출)-->
                    <form action="#">
                        <fieldset>
                            <input type="text" id="query" name="query" placeholder="검색어를 입력해주세요.">
                            <button type="submit" id="search-btn" class="fa-solid fa-magnifying-glass">
                                <!--<i class="fa-solid fa-magnifying-glass"></i>-->
                            </button>
                        </fieldset>
                    </form>
                </article>
            </section>
            <section>
                
            </section>
        </header>
        <nav>
            <ul>
                <%-- <li><a href="#">공지사항</a></li>
                <li><a href="#">자유 게시판</a></li>
                <li><a href="#">질문 게시판</a></li>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">1:1 문의</a></li> --%>

                <c:forEach var="boardType" items="${boardTypeMap}">
                    <%--
                        EL을 이용해 Map데이터를 다루는 방법
                        key ==> ${변수명.key}
                        value ==> ${변수명.value}
                    --%>
                    <li><a href="/board/${boardType.key}"/list>${boardType.value}</a></li>
                    
                </c:forEach>

            </ul>
        </nav>
        <section class="content">
            <section class="content-1"></section>
            <section class="content-2">
                <form action="#" name="login-frm">
                    <!--아이디, 비번, 로그인 버튼-->
                    <fieldset id="id-pw-area">
                        <section>
                            <input type="text" name="inputId" placeholder="아이디"
                            autocomplete="off">
                            <input type="password" name="inputPw" placeholder="비밀번호"
                            autocomplete="off">
                        </section>
                        <section>
                            <button>로그인</button> <!--submit이 기본값-->
                        </section>
                    </fieldset>
                    <label>
                        <input type="checkbox" name="saveId">아이디 저장
                    </label><!--label태그 내부에 input태그를 작성하면 자동 연결된다-->
                    <!-- 회원가입/ ID / PW 찾기-->
                    <article id="signUp-find-area">
                        <a href="#">회원가입</a>
                        <span>|</span>
                        <a href="#">ID/PW 찾기</a>
                    </article>
                </form>
            </section>
        </section>
    </main>
    <footer>
        <p>
            Copyright &copy; KH Information Educational Institute A-Class
        </p>
        <article>
            <a href="#">프로젝트 소개</a>
            <span>|</span>
            <a href="#">이용약관</a>
            <span>|</span>
            <a href="#">개인정보처리방침</a>
            <span>|</span>
            <a href="#">고객센터</a>
        </article>
    </footer>
</body>
</html>