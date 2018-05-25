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
     <div class="py-5 text-center">
        <h2>New Post</h2>
        <p class="lead">Below is an example form built entirely with Bootstrap's form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
      </div>
     
     <form action="/boards" method="post">
       <div class="form-group row">
         <label for="staticNickname" class="col-sm-2 col-form-label">Nick Name</label>
         <div class="col-sm-10">
           <input type="text" readonly class="form-control-plaintext" id="staticNickname" value="${userInfo.nick}"/>
         </div>
       </div>
       <div class="form-group row">
         <label for="inputTitle" class="col-sm-2 col-form-label">Title</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="inputTitle" placeholder="Title" name="title">
         </div>
       </div>
       <div class="form-group row">
         <label for="exampleFormControlTextarea1" class="col-sm-2 col-form-label">Content</label>
         <div class="col-sm-10">
           <textarea style="resize: none;" class="form-control" id="exampleFormControlTextarea1" rows="5" name="content"></textarea>
         </div>
       </div>
       <!-- <div class="form-group row">
         <label for="exampleFormControlFile1" class="col-sm-2 col-form-label">Example file input</label>
         <div class="col-sm-10">
           <input type="file" class="form-control-file" id="exampleFormControlFile1">
         </div>
       </div> file upload form  -->
       
       <div class="form-group row justify-content-center">
         <button class="btn btn-lg btn-primary btn-block col-sm-5" type="submit">Submit</button>
       </div>
       
</form>

    </main> <!-- //container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    
  </body>
</html>

