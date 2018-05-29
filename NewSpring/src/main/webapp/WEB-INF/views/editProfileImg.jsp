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
    <style>
    iframe{
    	width: 0px;
    	height: 0px;
    	border: 0px;
    }
    small{
    	margin-left: 3px;
    	font-weight: bold;
    	color: gray;
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
          <li class="nav-item active">
            <a class="nav-link" href="/home">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/boards">BOARD</a>
          </li>
        </ul>
        <form class="form-inline my-2 my-md-0">
          <input class="form-control" type="text" placeholder="Search">
        </form>
      </div>
    </nav>
    
    <main role="main" class="container">
    	<form id="form1" action="edit" method="post" enctype="multipart/form-data" target="zeroFrame">
    		<input type="file" name="file" >
    		<input type="submit" value="upload">
    	</form>
    	
    	<iframe name="zeroFrame"></iframe>
    	
    	<div class="uploadedList">
    	
    	</div>
    	
    	
    	<script>
    		function addFilePath(msg){
    			alert(msg);
    			document.getElementById("form1").reset();
    		}
    		function checkImageType(fileName){
    			var pattern = /jpg$|gif$|png$|jpeg$/i;
    			return fileName.match(pattern);
    		}
    		function getOriginalName(fileName){
    			if(checkImageType(fileName)){
    				return;
    			}
    			var idx = fileName.indexOf("_") + 1;
    			return fileName.substr(idx);
    		}
    		function getImageLink(fileName){
    			if(!checkImageType(fileName)){
    				return;
    			}
    			var front = fileName.substr(0,12);
    			var end = fileName.substr(14);
    			return front + end;
    		}
    		
    		function upload(fileName){
    			var str="";
    			console.log("upload file");
    			if(checkImageType(fileName)){
    				str="<div>" 
    						+ "<a href='displayFile?fileName=" + getImageLink(fileName)+"'>"
    						+ "<img src='displayFile?fileName=" + fileName + "'/>"
    						+ "</a><small data-src=" + fileName+">x</small></div>";
    						//+ getImageLink(fileName) + "</a></div>";
    			}else{
    				str = "<div><a href='displayFile?fileName=" + fileName +"'>"
    						+getOriginalName(fileName)+ "</a>"
    						+"</a><small data-src=" + fileName+">x</small>";+"</div>";
    			}
    			
    			$(".uploadedList").append(str);
    		}
    	</script>
    	
   
    </main>




	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

	<script>
    		$(".uploadedList").on("click", "small", function(event){
    			console.log("click x!!");
    			var that = $(this);
    			
    			$.ajax({
    				url:"deleteFile",
    				type:"post",
    				data: {fileName:$(this).attr("data-src")},
    				dataType:"text",
    				success:function(result){
    					if(result == 'deleted'){
    						that.parent("div").remove();
    						alert("deleted");
    					}
    				}
    				
    			});
    		});
    	</script>

</body>
</html>