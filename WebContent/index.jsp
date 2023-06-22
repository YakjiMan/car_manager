<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="car_manager_dao.*" %>
<%@page import="car_manager_dto.*" %>
<%@page import="car_manager_vo.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>메인화면</title>
		<link href="css/index.css" rel="stylesheet">
	</head>
<%
	
%>
<script>
	function setThumbnail(event) {
	    var reader = new FileReader();
	
	    reader.onload = function(event) {
	      var img = document.createElement("img");
	      img.setAttribute("src", event.target.result);
	      document.querySelector("div#image_container").appendChild(img);
	    };
	
	    reader.readAsDataURL(event.target.files[0]);
	  }
</script>
<body>
	<div id="Center_img">
		<div id="input">
			<form action="jsp/fileUpload.jsp" method="post" enctype="multipart/form-data">
				 	<fieldset>
						<legend>차량 사진 감지</legend>
						<p>카메라 번호 : <input type="text" name="userName"></p>
						<p>파일명 : <input type="file" name="file" onchange="setThumbnail(event);"></p>
						<p><input type="submit" value="upload"></p>	 	
				 	</fieldset>
			 </form>
		</div>
		<div id="image_container"></div>
		<div id="top">
		</div>
		<div id="top_text">
			<p>주차 관제 시스템</p>
		</div>
		<div id="button_text">
			<a type="button" href="jsp/inpay.jsp">명세서</a>
			<a type="button" href="jsp/inCar.jsp">입차 화면</a>
			<a type="button" href="jsp/outCar.jsp">출차 화면</a>
			<a type="button" href="jsp/admin.jsp">주차장 관리 페이지</a>
			<a type="button" href="jsp/reservation.jsp">주차장 예약 페이지</a>
		</div>
		<img src="img/new-car-dashboard.jpg" alt="차 내부 사진">
	</div>
</body>
</html> 