<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <%-- <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet"> --%>
  </head>

  <body>
  <nav class="navbar navbar-expand navbar-dark bg-dark">
      <a class="navbar-brand" href="#">Always expand</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample02">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="/home">Home</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="/boards">BOARD <span class="sr-only">(current)</span></a>
          </li>
        </ul>
        <form class="form-inline my-2 my-md-0">
          <input class="form-control" type="text" placeholder="Search">
        </form>
      </div>
    </nav>

     <main role="main" class="container">
     <div class="my-3">
     	<div class="h1">
     	BOARD <button type="button" class="btn btn-primary" onclick="window.location='/boards/new';"> + NEW </button>
     	</div>
     	
     </div>

<div class="table-responsive">


      <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">title</th>
      <th scope="col">writer</th>
      <th scope="col">date</th>
      <th scope="col">hit</th>
    </tr>
  </thead>
  <tbody>
    
    <c:forEach items="${voList}" var="vo" varStatus="sta">
    <tr onclick="window.location='/boards/${vo.bseq}';">
      <th scope="row">${sta.count}</th>
      <td>${vo.title}</td>
      <td>${vo.nick }</td>
      <td>${vo.datetime }</td>
      <td>${vo.hit }</td>
      </tr>
    </c:forEach>
    
  </tbody>
</table>

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  	<c:if test="${pageMaker.prev}">
  		<li class="page-item"><a class="page-link" href="boards?${pageMaker.makeQuery(pageMaker.startPage-1)}" tabindex="-1">Previous</a></li>
  	</c:if>
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="page-item <c:out value="${pageMaker.paging.page == idx ? 'active':''}"/> ">
    	
    	<a class="page-link" href="boards${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>
    
    <c:if test="$pageMaker.next && pageMaker.endPage > 0">
    	<li class="page-item"><a class="page-link" href="#">Next</a></li>
    </c:if>
    
  </ul>
</nav>
</div>

    </main> <!-- //container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
    
    <script>
    	var result = '${msg}';
    	if(result == 'success'){
    		alert("처리가 완료되었습니다.");
    	}
    </script>
  </body>
</html>

