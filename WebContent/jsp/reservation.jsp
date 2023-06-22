<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.util.*" %>
<%@ page import= "java.text.*" %>
<%@ page import="car_manager_vo.*" %>
<%@ page import="car_manager_dto.*" %>
<!DOCTYPE html>
<%
	parkDTO dto = new parkDTO();
	String count1 = dto.ParkCount("1F");
	String count2 = dto.ParkCount("2F");
	String count3 = dto.ParkCount("3F");
	String count4 = dto.ParkCount("4F");
%>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<link href="../css/reservation.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		var car_count = document.getElementById("car_count1").innerText;
			if(car_count == 108){
				$("#full1").html("만차"); 
			}else if(car_count < 108 && car_count > 40){
				$("#full1").html("혼잡");
			}else{
				$("#full1").html("원활");
			}	
		var car_confuse = document.getElementById("full1").innerText;
			switch(car_confuse){
				case "만차" :$("#main_tbl tr:nth-child(1) td:nth-child(2)").css("background-color","#FF0559");$("#main_tbl tr:nth-child(1)").css("border","2px solid #FF0559");break;
				case "혼잡" :$("#main_tbl tr:nth-child(1) td:nth-child(2)").css("background-color","#F9A855");$("#main_tbl tr:nth-child(1)").css("border","2px solid #F9A855");break;
				case "원활" :$("#main_tbl tr:nth-child(1) td:nth-child(2)").css("background-color","#05DFBD");$("#main_tbl tr:nth-child(1)").css("border","2px solid #05DFBD");break;
			}
		var car_count = document.getElementById("car_count2").innerText;
			if(car_count == 108){
				$("#full2").html("만차"); 
			}else if(car_count < 108 && car_count > 40){
				$("#full2").html("혼잡");
			}else{
				$("#full2").html("원활");
			}	
		var car_confuse = document.getElementById("full2").innerText;
		switch(car_confuse){
			case "만차" :$("#main_tbl tr:nth-child(3) td:nth-child(2)").css("background-color","#FF0559");$("#main_tbl tr:nth-child(3)").css("border","2px solid #FF0559");break;
			case "혼잡" :$("#main_tbl tr:nth-child(3) td:nth-child(2)").css("background-color","#F9A855");$("#main_tbl tr:nth-child(3)").css("border","2px solid #F9A855");break;
			case "원활" :$("#main_tbl tr:nth-child(3) td:nth-child(2)").css("background-color","#05DFBD");$("#main_tbl tr:nth-child(3)").css("border","2px solid #05DFBD");break;
		}
		var car_count = document.getElementById("car_count3").innerText;
			if(car_count == 108){
				$("#full3").html("만차"); 
			}else if(car_count < 108 && car_count > 40){
				$("#full3").html("혼잡");
			}else{
				$("#full3").html("원활");
			}	
		var car_confuse = document.getElementById("full3").innerText;
		switch(car_confuse){
			case "만차" :$("#main_tbl tr:nth-child(5) td:nth-child(2)").css("background-color","#FF0559");$("#main_tbl tr:nth-child(5)").css("border","2px solid #FF0559");break;
			case "혼잡" :$("#main_tbl tr:nth-child(5) td:nth-child(2)").css("background-color","#F9A855");$("#main_tbl tr:nth-child(5)").css("border","2px solid #F9A855");break;
			case "원활" :$("#main_tbl tr:nth-child(5) td:nth-child(2)").css("background-color","#05DFBD");$("#main_tbl tr:nth-child(5)").css("border","2px solid #05DFBD");break;
		}
		var car_count = document.getElementById("car_count4").innerText;
			if(car_count == 108){
				$("#full4").html("만차"); 
			}else if(car_count < 108 && car_count > 40){
				$("#full4").html("혼잡");
			}else{
				$("#full4").html("원활");
			}
		var car_confuse = document.getElementById("full4").innerText;
		switch(car_confuse){
			case "만차" :$("#main_tbl tr:nth-child(7) td:nth-child(2)").css("background-color","#FF0559");$("#main_tbl tr:nth-child(7)").css("border","2px solid #FF0559");break;
			case "혼잡" :$("#main_tbl tr:nth-child(7) td:nth-child(2)").css("background-color","#F9A855");$("#main_tbl tr:nth-child(7)").css("border","2px solid #F9A855");break;
			case "원활" :$("#main_tbl tr:nth-child(7) td:nth-child(2)").css("background-color","#05DFBD");$("#main_tbl tr:nth-child(7)").css("border","2px solid #05DFBD");break;
		}
			
	});
	function reservation(num){
		location.href = "reservation_inner.jsp?level="+num;
	}
	</script>
	<body>
		<header>
			<table>
				<tr>
					<td><a href="../index.jsp">EZEN</a></td>
					<td>주차 예약 서비스</td>	
					<td><img src="../img/menu.png"></td>
				</tr>
			</table>
		</header>
		<table id="main_tbl_notice">
			<tr>
				<td><b>현재 주차중인 차량 수</b></td>
			</tr>
		</table>
			<table id="main_tbl" >
				<tr id="content" onclick="reservation(1)">
					<td>
						<b id="floor">1F</b> &nbsp;&nbsp;&nbsp;<b id="car_count1"><%= count1 %></b> 대
					</td>
					<td>
						<b id="full1"></b>
					</td>
				</tr>
				<tr id="space" ><td colspan="2"></td></tr>
				<tr id="content" onclick="reservation(2)">
					<td>
						<b id="floor">2F</b> &nbsp;&nbsp;&nbsp;<b id="car_count2"><%= count2 %></b> 대
					</td>
					<td>
						<b id="full2"></b>
					</td>
				</tr>
				<tr id="space" ><td colspan="2"></td></tr>
				<tr id="content" onclick="reservation(3)">
					<td>
						<b id="floor">3F</b> &nbsp;&nbsp;&nbsp;<b id="car_count3"><%= count3 %></b> 대
					</td>
					<td>
						<b id="full3"></b>
					</td>
				</tr>
				<tr id="space" ><td colspan="2"></td></tr>
				<tr id="content" onclick="reservation(4)">
					<td>
						<b id="floor">4F</b> &nbsp;&nbsp;&nbsp;<b id="car_count4"><%= count4 %></b> 대
					</td>
					<td>
						<b id="full4"></b>
					</td>
				</tr>
				<tr id="space" ><td colspan="2"></td></tr>
			</table>
<!-- 		<footer>
			<table id="footer_button">
				<tr>
					<td><img src="../img/left.jpg"></td>
					<td><img src="../img/middle.jpg"></td>
					<td><img src="../img/right.jpg"></td>
				</tr>
			</table>
		</footer> -->
	</body>
</html>