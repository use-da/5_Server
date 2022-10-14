<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>c:forEach 향상 for문처럼 사용</title>
</head>
<body>
    param.lang : 파라미터 중 lang의 값을 얻어와 출력 <br>
                단, lang의 파라미터가 다수일 경우, 처음 값만 출력
    <br>
    paramValues.lang : 파라미터 중 lang의 값을 얻어와 출력 <br>
                단, lang의 파라미터가 다수일 경우, 모두 얻어와 배열로 출력
    <br>
    param.lang : ${param.lang} <br>  
    paramValues.lang : ${paramValues.lang[0]}  /  ${paramValues.lang[1]}  /  ${paramValues.lang[2]}

    <c:choose>
        <%--체크 안된 경우--%>
        <c:when test="${empty paramValues.lang}">
            <h1 style="color:orangered;">체크된 값이 없습니다.</h1>
        </c:when>
        <c:otherwise>
            <ul>
                <c:forEach var="chk" items="${paramValues.lang}" varStatus="vs">
                    <li>
                        index : ${vs.index}     <br>
                        count : ${vs.count}     <br>
                        current : ${vs.current} <br>
                        first : ${vs.first}     <br>
                        last : ${vs.last}       <br>
                        체크된 값 : ${chk}
                    </li>
                </c:forEach>
            </ul>
        </c:otherwise>
    </c:choose>

    <h3>객체 배열/ 컬렉션 반복 접근하기</h3>
    <table border="1">
        <c:forEach var="person" items="${requestScope.pList}">
            <tr>
                <th>${person.name}</th>
                <td>${person.age}</td>
                <td>${person.address}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>