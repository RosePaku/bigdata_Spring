<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>글수정</title>
                <link
                    href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
                    rel="stylesheet">
                <link rel="stylesheet" href="/css/style.css">
                <link rel="stylesheet" href="/css/write.css">
                <script>
                    function deleteBtn() {
                        if (confirm("게시글을 삭제하시겠습니까?")) {
                            location.href = "boardDelete?bno=${bdto.bno}";
                        }
                    }
                </script>
                <style>
                    .list {
                        cursor: pointer;
                    }
                </style>
            </head>

            <body>
                <section>
                    <h1>NOTICE</h1>
                    <table>
                        <colgroup>
                            <col width="80%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>
                        <tr>
                            <th colspan="3">제목</th>
                        </tr>
                        <tr>
                            <td colspan="3"><strong>${bdto.btitle}</strong></td>
                        </tr>
                        <tr>
                            <td>${bdto.id}</td>
                            <td>조회수</td>
                            <td>${bdto.bhit}</td>
                        </tr>
                        <tr>
                            <td colspan="3" class="article">${bdto.bcontent}</td>
                        </tr>
                        <tr>
                            <td colspan="3" class="article"><strong>파일</strong><span
                                    class="separtor">|</span>${bdto.bfile}</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <c:if test="${bdto.bfile!=null}">
                                    <img src="/images/${bdto.bfile}"$page =#page="$">
                                </c:if>
                                <c:if test="${bdto.bfile==null}">
                                    <strong>업로드 된 파일 없습니다.</strong>
                                </c:if>
                                <a href="board/boardView
                                "></a>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="3"><strong>다음글</strong><span class="separator">|</span>${nextDto.btitle}</td>
                        </tr>
                        <tr>
                        </tr>
                    </table>

                    <a href="boardList">
                        <div class="lsit">목록</div>
                    </a>
                    <a onclick="deleteBtn()">
                        <div class="list">삭제</div>
                    </a>
                    <a href="boardUpdate?bno=${bdto.bno}">
                        <div class="lsit">수정</div>
                    </a>
                    <a href="boardReply=${bdto.bno}">
                        <div class="lsit">답변달기</div>
                    </a>
                    </a>
                    <a href="boardReply=${bdto.bno}">
                        <div class="lsit">답변달기</div>
                    </a>
                    </a>
                    <a href="boardReply=
                        <div class="lsit">다음글
                        </div>
                    </a>
                </section>
            </body>

            </html>