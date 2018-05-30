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
    <style type="text/css">
    	.popup {
    		position: absolute;
    	}
    	.back {
    		background-color: gray;
    		opacity:0.5;
    		width:100%;
    		height: 300%;
    		overflow: hidden;
    		z-index:1101;
    	}
    	.front {
    		z-index:1110;
    		opacity:1;
    		boarder:1px;
    		margin: auto;
    	}
    	.show {
    		position: relative;
    		max-width: 1200px;
    		max-height: 800px;
    		overflow: auto;
    	}
    </style>
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
    
    <div class="popup back" style="display:none;"></div>
		  <div id="popup_front" class="popup front" style="display:none;">
		    <img id="popup_img">
		  </div>

     <main role="main" class="container">
		<div class="card-deck mb-3 py-5">
			<div class="card mb-4 box-shadow">
				<div class="card-body">
				  <h3 class="card-title mb-0 text-dark">${vo.title}</h3><small class="text-muted text-right">${vo.datetime }</small>
				  <p class="card-title">${vo.nick}</p>
				  <p class="card-text">${vo.content }</p>
				</div>
				<hr>
				<div class="container">
          	      <div class="row" id="uploadedList">
          	        
          	      </div>
          	    </div>
			</div>
		</div>
		
		<div class="card-deck mb-3">
			<div class="card mb-4 box-shadow">
				<div class="card-header">COMMENT</div>
				<div class="card-body">
				<p class="card-title">${vo.nick} <small class="text-muted">${vo.datetime }</small></p>
				<p class="card-text">${vo.content }</p>
				</div>
			</div>
		</div>
		<div class="row justify-content-center mb-3">
		<c:if test="${sessionScope.userInfo.nick eq vo.nick}">
		<button class="btn btn-lg btn-primary btn-block col-sm-4" onclick="window.location='/boards/modify?bseq=${vo.bseq};">modify</button>
		</c:if>
		</div>
		
		
		
</main>

    <!-- Bootstrap core JavaScript
    ================================================== style="width: 100%;" -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
    <script id="templateAttach" type=text/x-handlebars-template>
    	
          <div class="col-sm-2 card mb-3 box-shadow">
            <img class="card-img-top" style="display:block;" src="{{imgsrc}}"/>
            <div class="card-body"><a id="file" href="{{getLink}}" class="card-link">{{fileName}}</a></div>
          </div>
        
    </script>
    <script>
    	var bseq=${vo.bseq};
    	
    	var template = Handlebars.compile($("#templateAttach").html());
    	
    	$.getJSON("/boards/getAttach/" +bseq, function(list){
    		console.log(list);
    		$(list).each(function(){
    			var fileInfo = getFileInfo(this);
    			var html = template(fileInfo);
    			$("#uploadedList").append(html);
    		});
    	});
    
    </script>
    <script>
    	$("#uploadedList").on("click", "#file", function(event){
    		
    		var fileLink = $(this).attr("href");
    		if(checkImageType(fileLink)){
    			event.preventDefault();
    			var imgTag = $("#popup_img");
    			imgTag.attr("src", fileLink);
    			
    			console.log(imgTag.attr("src"));
    			
    			$(".popup").show('slow');
    			imgTag.addClass("show");
    		}
    	});
    	$("#popup_img").on("click", function(){
    		$(".popup").hide('slow');
    	});
    </script>
    
  </body>
</html>

