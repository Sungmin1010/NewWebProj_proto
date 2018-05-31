<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
     
     <form id="registerForm" action="/boards" method="post">
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
       <div class="form-group row">
         <label for="exampleFormControlFile1" class="col-sm-2 col-form-label">File</label>
         <div class="col-sm-10">
           
           <div class="fileDrop bg-light rounded p-4">
             <label class="font-italic">File DROP Here</label>
           </div>
           <div class="box-footer">
       	     <div>
       		   <hr>
          	 </div>
          	 <div class="container">
          	   <div class="row" id="uploadedList">
          	     <%-- <div class="col-md-2">
          	       <div class="card mb-4 box-shadow">
          	         <img class="card-img-top" style="width: 100%;" src="${pageContext.request.contextPath}/resources/img/sample.png"/>
          	         <div class="card-body pb-0"><a href="#" class="card-link">text.jpg</a></div>
          	         <div class="align-items-right"><a href="#" class="close text-danger"><span aria-hidden="true">&times;</span></a></div>
          	       </div>
          	     </div> --%>
          	   </div>
          	 </div>
           </div>
           
         </div>
       </div>
       
       
       
       <div class="form-group row justify-content-center">
         <button class="btn btn-lg btn-primary btn-block col-sm-5" type="submit">Submit</button>
       </div>
       
</form>

    </main> <!-- //container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
    <script id="template" type="text/x-handlebars-templage">
<div class="col-md-2" id="box-footer">
  <div class="card mb-4 box-shadow">
    <img class="card-img-top" style="width: 100%;" src="{{imgsrc}}" alt="Attachment"/>
    <div class="card-body pb-0"><a href="{{getLink}}" class="card-link">text.jpg</a></div>
    <div class="align-items-right" id="removeBtn"><span class="close text-danger" aria-hidden="true" data-src="{{fullName}}">&times;</span></div>
  </div>
</div>
	</script>
	<script>
	//drag and drop
	var template = Handlebars.compile($("#template").html());
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		var formData = new FormData();
		formData.append("file", file);
		//ajax
		$.ajax({
			url: '/uploadAjax',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data){
				console.log(data);
				var fileInfo = getFileInfo(data);
				console.log(fileInfo);
				var html = template(fileInfo);
				$("#uploadedList").append(html);
			}
		});
	});
	
	
	$("#uploadedList").on("click", "#removeBtn", function(event){
		//console.log("click x!!");
		var that = $(this);
		//console.log($("#removeBtn span").attr("data-src"));
		 $.ajax({
			url:"/deleteFile",
			type:"post",
			data: {fileName:$("#removeBtn span").attr("data-src")},
			dataType:"text",
			success:function(result){
				if(result == 'deleted'){
					that.parents("div #box-footer").remove();
					alert("deleted");
				}
			}
		});
	});
	
	//form submit
	$("#registerForm").submit(function(event){
		event.preventDefault();
		var that = $(this);
		var str = "";
		$("#uploadedList .close").each(function(index){
			str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("data-src") + "'>";
		});
		that.append(str);
		that.get(0).submit();
	});
	</script>
    
    
  </body>
</html>

