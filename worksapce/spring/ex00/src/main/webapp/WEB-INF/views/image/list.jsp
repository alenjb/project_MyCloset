<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 리스트</title>
<style type="text/css">
.dataRow: hover{
	cursor: pointer;
	background: #eee;
}

</style>
</head>
<body>
<div class="container">
	<h2>이미지 리스트</h2>
	
	<div class="row">
		<!-- 	col-md-3 : 한 줄에 사진 4장 표시 3 * 4 = 12  -->
		<c:forEach items="${list }" var="vo" varStatus="vs">
					<div class="col-md-3">
			<div class="thumbnail dataRow" 
			onclick="location='view.jsp?no=${vo.no}&page=${pageObject.page }&perPageNum=${pageObject.perPageNum }&key=${pageObject.key}&word=${pageObject.word}'">
				<img src="${vo.fileName }" alt="Photo Lists" style="width:100%;height: 300px;">
				<div class="caption">
					<p>[${vo.no }] ${vo.title }</p>
					${vo.name }(${vo.id }) - 
					<fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/> 
				</div>
			</div>
		</div>
		<c:if test="${vs.count % 4 ==0 && vs.count != list.size()}">
			<!-- 			한줄을 마감하고 새로운 줄을 시작한다 -->
			${"</div>" }
			${"</div class='row'>" }
		</c:if>
		</c:forEach>
	</div>

<div>
	<pageNav:pageNav listURI="list.jsp" pageObject="${pageObject}" query="&key=${pageObject.key}&word=${pageObject.word}"/>
</div>
<c:if test= "${!empty login}">
	<a href="write.do?perPageNum=${pageObject.perPageNum }" class="btn btn-default">등록</a>
</c:if>
<a href="list.do?&page=${pageObject.page }&perPageNum=${pageObject.perPageNum }&key=${pageObject.key}&word=${pageObject.word}" class="btn btn-default">새로고침</a>
</div>
</body>
</html>