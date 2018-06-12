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
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
	<style>
	#modDiv{
		width:300px;
		height:100px;
		background-color:gray;
		position:absolute;
		top:50%;
		left:50%;
		margin-top:-50px;
		margin-left:-150px;
		padding:10px;
		z-index:1000;
	}
	</style>
    
  </head>

  <body>
  <h2>Ajax Test Page</h2>
  
  <div>
    <div>
      REPLYER <input type='text' name='replyer' id='newReplyWriter'>
    </div>
    <div>
      REPLY TEXT <input type='text' name='replytext' id='newReplyText'>
    </div>
    <button id="replyAddBtn">ADD REPLY</button>
  </div>
  
  <div id='modDiv' style="display:none;">
    <div class='modal-title'></div>
    <div>
      <input type='text' id='replytext'>
    </div>
    <div>
      <button type="button" id="replyModBtn">Modify</button>
      <button type="button" id="replyDelBtn">DELETE</button>
      <button type="button" id="closeBtn">Close</button>
    </div>
  </div>
  
  <ul id="replies">
  </ul>
  
  <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  
  </ul>
  </nav>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

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
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
    <script>
    function getAllList(){
    	$.getJSON("/replies/all/"+bseq, function(data){
        	var str = "";
        	console.log(data.length);
        	
        	$(data).each(function(){
        		str += "<li data-rseq='" + this.rseq + "' class='replyLi'>"
        			+ this.rseq + ":" + this.comment + 
        			"<button>MOD</button></li>";
        	});
        	
        	$("#replies").html(str);
        });
    }
    function getPageList(page){
    	
    	$.getJSON("/replies/" + bseq + "/" + page, function(data){
    		console.log(data.list.length);
    		var str = "";
    		
    		$(data.list).each(function(){
    			str += "<li data-rseq='" + this.rseq + "' class='replyLi'>"
    			+ this.rseq + ":" + this.comment + 
    			"<button>MOD</button></li>";
    		});
    		$("#replies").html(str);
    		printPaging(data.pageMaker);
    		
    	});
    }
    function printPaging(pageMaker){
    	var str = "";
    	if(pageMaker.prev){
    		str += "<li class='page-item'><a class='page-link' href='(pageMaker.startPage-1)'>Previous</a></li>";
    	}
    	for( var i=pageMaker.startPage, len=pageMaker.endPage; i<= len; i++){
    		var strClass=pageMaker.paging.page == i? 'active':'';
    		str += "<li class='page-item" + strClass + "'>"
    			+ "<a class='page-link' href='" + i + "'>" + i + "</a></li>";
    	}
    	if(pageMaker.next){
    		str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage + 1) + "'>Next</a></li>";
    	}
    	$('.pagination').html(str);
    }
    </script>
    <script>
    var bseq = 1;
    var replyPage = 1;
    //getAllList();
    getPageList(1);
    
    $("#replyAddBtn").on("click", function(){
    	var replyer = $("#newReplyWriter").val();
    	var replytext = $("#newReplyText").val();
    	
    	$.ajax({
    		type : 'post',
    		url : '/replies',
    		headers : {
    			"Content-Type" : "application/json",
    			"X-HTTP-Method-Override" : "POST"
    		},
    		dataType : 'text',
    		data : JSON.stringify({
    			bseq : bseq,
    			useq : replyer,
    			comment : replytext
    		}),
    		success : function(result){
    			if(result == 'SUCCESS'){
    				alert("등록되었습니다.");
    				getAllList();
    			}
    		}
    	});
    });
    
    $("#replies").on("click", ".replyLi button", function(){
    	var reply = $(this).parent();
    	var rseq = reply.attr("data-rseq");
    	var replytext = reply.text();
    	console.log(rseq);
    	//alert(rseq + " : " + replytext);
    	
    	$(".modal-title").html(rseq);
    	$("#replytext").val(replytext);
    	$("#modDiv").show("slow");
    });
    
    $("#replyDelBtn").on("click", function(){
    	var rseq = $(".modal-title").html();
    	var replytext = $("#replytext").val();
    	
    	$.ajax({
    		type: 'delete',
    		url : '/replies/' + rseq,
    		headers : {
    			"Content-Type": "application/json",
    			"X-HTTP-Method-Override" : "DELETE"
    		},
    		dataType : 'text',
    		success : function(result){
    			console.log("result : " + result);
    			if(result == 'SUCCESS'){
    				alert("삭제 되었습니다.");
    				$("#modDiv").hide("slow");
    				getAllList();
    			}
    		}
    	});
    	
    });
    
    $("#replyModBtn").on("click", function(){
    	var rseq = $(".modal-title").html();
    	var replytext = $("#replytext").val();
    	
    	$.ajax({
    		type:'put',
    		url: '/replies/'+ rseq,
    		headers:{
    			"Content-Type" : "application/json",
    			"X-HTTP-Method-Override" : "PUT"
    		},
    		data : JSON.stringify({comment : replytext}),
    		dataType : 'text',
    		success:function(result){
    			console.log("result : " + result);
    			if(result == 'SUCCESS'){
    				alert("수정되었습니다.");
    				$("#modDiv").hide("slow");
    				//getAllList();
    				//getPageList(replyPage);
    			}
    		}
    	});
    });
    
    $(".pagination").on("click", "li a", function(event){
    	event.preventDefault();
    	replyPage = $(this).attr("href");
    	getPageList(replyPage);
    });

    </script>
    
    
  </body>
</html>

