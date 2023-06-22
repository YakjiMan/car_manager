<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import= "java.util.*" %>
<%@ page import= "java.text.*" %>
<%@ page import="car_manager_vo.*" %>
<%@ page import="car_manager_dto.*" %>
<%
	String park_no  = request.getParameter("park_no");
	String park_car = request.getParameter("park_car");
	
	parkDTO dto = new parkDTO();
	dto.ParkBook(park_no);
	
	
	
%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<script>
	window.onload = function()
	{
		alert("예약이 완료되었습니다.");
		history.back();
	}
</script>
</body>
</html>

