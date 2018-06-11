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
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

	
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
		<div class="card-deck py-5">
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
				<div class="card-header">ADD NEW REPLY</div>
				
				<div class="card-body row">
				
				  <textarea id="replyComment" class="col-sm-9" rows="3" style="resize: none;"></textarea>
				  <button id="replyAddBtn" class="btn btn-outline-primary col-sm-2">ADD</button>
				
				</div>
			</div>
		</div>
		
		<div class="card mb-3">
			<div class="card-header">COMMENT</div>
			<ul class="list-group list-group-flush" id="commentList">
				
				

			</ul>
			
		</div>
		<nav aria-label="Page navigation example">
  			<ul class="pagination justify-content-center">
  
  			</ul>
  			</nav>
		
		<div class="justify-content-center mb-3">
		<c:if test="${sessionScope.userInfo.nick eq vo.nick}">
		<form class="form-inline" id="deleteForm" action="/boards/${vo.bseq}" method="post">
			<input type="hidden" name="_method" value="delete"/>
			<input type="hidden" name="bseq" value="${vo.bseq}"/>
		
		<button type="button" class="btn btn-primary mr-3 col-sm-3" onclick="window.location='/boards/revision/${vo.bseq}'">modify</button>
		<button type="button" id="removeBtn" class="btn btn-danger col-sm-3" >delete</button>
		
		</form>
		</c:if>
		</div>
		
		
		
</main>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

    <!-- Bootstrap core JavaScript
    ================================================== style="width: 100%;" -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
    <script id="templateAttach" type=text/x-handlebars-template>
    	
          <div class="col-sm-2 card mb-3 box-shadow" data-src='{{fullName}}'>
            <img class="card-img-top" style="display:block;" src="{{imgsrc}}"/>
            <div class="card-body"><a id="file" href="{{getLink}}" class="card-link">{{fileName}}</a></div>
          </div>
        
    </script>
    <script id="replyTemplate" type=text/x-handlebars-template>
	{{#each .}}
    	<li class='list-group-item' id='replyLi' data-rseq={{rseq}}>{{nick}} <small class='text-muted'>{{prettifyDate datetime}}</small>
      		<p class='card-text'>{{comment}}</p>
			
			{{#ifCond nick}}
			<button type='button' class='btn btn-outline-info btn-sm' id='><i class='fas fa-pencil-alt'></i></button>
			{{/ifCond}}
		</li>
	{{/each}}
    </script>
    <script>
    //reply function
    function loadReplyList(bseq){
    	$.getJSON("/replies/all/"+bseq, function(data){
        	var str = "";
        	$(data).each(function(){
        		str += "<li class='list-group-item'>"+this.nick+" <small class='text-muted'> "+preDate(this.datetime)+"</small></p>"
      		  		+  "<p class='card-text'>"+this.comment+"</p><button type='button' class='btn btn-outline-info btn-sm'><i class='fas fa-pencil-alt'></i></button></li>";
        	});
        	$("#commentList").html(str);
        });
    }
    
    function preDate(timeValue){
    	var dateObj = new Date(timeValue);
    	var year = dateObj.getFullYear();
    	var month = dateObj.getMonth() +1;
    	var date = dateObj.getDate();
    	return year+"/"+month+"/"+date;
    }
    
    </script>
    <script>
    Handlebars.registerHelper("prettifyDate", function(timeValue){
    	var dateObj = new Date(timeValue);
    	var year = dateObj.getFullYear();
    	var month = dateObj.getMonth() +1;
    	var date = dateObj.getDate();
    	return year+"/"+month+"/"+date;
    });
    Handlebars.registerHelper("ifCond", function(v1, options){
    	if(v1 === "${sessionScope.userInfo.nick}"){
    		return options.fn(this);
    	}
    });
    
    var printData = function(replyArr, target, templateObject){
    	var template = Handlebars.compile(templateObject.html());
    	var html = template(replyArr);
    	$("#replyLi").remove();
    	target.html(html);
    }
    function printPaging(pageMaker, target){
    	var str = "";
    	if(pageMaker.prev){
    		str += "<li class='page-item'><a class='page-link' href='(pageMaker.startPage-1)'>Previous</a></li>";
    	}
    	for( var i=pageMaker.startPage, len=pageMaker.endPage; i<= len; i++){
    		var strClass=pageMaker.paging.page == i? 'active':'';
    		str += "<li class='page-item " + strClass + "'>"
    			+ "<a class='page-link' href='" + i + "'>" + i + "</a></li>";
    	}
    	if(pageMaker.next){
    		str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage + 1) + "'>Next</a></li>";
    	}
    	target.html(str);
    }
    
    
    function getPage(pageInfo){
    	$.getJSON(pageInfo, function(data){
    		printData(data.list, $("#commentList"), $("#replyTemplate"));
    		printPaging(data.pageMaker, $(".pagination"));
    	});
    }
    </script>
    <script>
    
    	var bseq=${vo.bseq};
    	var replyPage = 1;
    	var template = Handlebars.compile($("#templateAttach").html());
    	
    	$.getJSON("/boards/getAttach/" +bseq, function(list){
    		console.log(list);
    		$(list).each(function(){
    			var fileInfo = getFileInfo(this);
    			var html = template(fileInfo);
    			$("#uploadedList").append(html);
    		});
    	});
    
    	//reply
    	//loadReplyList(bseq);
    	getPage("/replies/" + bseq + "/1");
    	
    </script>
    <script>
    	$("#replyAddBtn").on("click", function(event){
    		var comment = $("#replyComment").val();
    		var useq = ${sessionScope.userInfo.useq};
    		
    		$.ajax({
    			type: 'post',
    			url:'/replies',
    			headers : {
    				"Content-Type" : "application/json",
    				"X-HTTP-Method-Override" : "POST"
    			},
    			dataType: 'text',
    			data : JSON.stringify({
    				bseq:bseq,
    				useq:useq,
    				comment:comment
    			}),
    			success:function(result){
    				console.log("result: " + result);
    				if(result == 'SUCCESS'){
    					alert("등록 되었습니다.");
    					replyPage = 1;
    					getPage("/replies/" + bseq + "/" + replyPage);
    					$("#replyComment").val("");
    					//loadReplyList(bseq);
    				}
    			}
    		});
    		
    		
    	});
    	$(".pagination").on("click", "li a", function(event){
    		event.preventDefault();
    		console.log("stop");
    		replyPage = $(this).attr("href");
    		console.log(replyPage);
    		getPage("/replies/" + bseq + "/" + replyPage);
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
    	
    	//delete board
    	$("#removeBtn").on("click", function(){
    		var delAlert = confirm("해당 글을 삭제 하시겠습니까?")
    		if(delAlert==true){
    			var arr = [];
    			$("#uploadedList .box-shadow").each(function(index){
    				arr.push($(this).attr("data-src"));
    			});
    			
    			if(arr.length > 0){
    				$.post("/deleteAllFiles", {files:arr}, function(){
    					
    				});
    			}
    			 
    		}else{
    			
    		}
    	});
    	
    	
    </script>
    
  </body>
</html>

