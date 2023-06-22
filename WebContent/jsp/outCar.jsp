<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="car_manager_vo.*" %>
<%@ page import="car_manager_dto.*" %>
<%
	Date date = new Date();
	SimpleDateFormat format0 = new SimpleDateFormat("yyyy년 MM월 dd일  HH시 mm분 ss초");
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy년 MM월 dd일 (E)요일");
	SimpleDateFormat format2 = new SimpleDateFormat("HH시 mm분");
	
	System.out.println(format0.format(date));
	
	moveDTO dto = new moveDTO();
	moveVO lvo  = dto.LastRead();
	
	String move_car = lvo.getMove_car();
	String move_no  = lvo.getMove_no();
	
	moveVO invo  = dto.in_Read(move_car);
	moveVO outvo = dto.out_Read(move_car);
	
	parkDTO pdto = new parkDTO();
	parkVO pvo   = pdto.ParkRead(move_no);
	
	photoDTO ptdto = new photoDTO();
	photoVO ptvo   = ptdto.Read(move_no);
	
	int cost = (Integer.parseInt(outvo.getMove_ptime()) / 30) * 5000;
	
	if (cost == 0)
	{
		cost = 5000;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>출차화면</title>
	</head>
<link href="../css/outCar.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
	<script>
		$(document).ready(function() {
			$('img[usemap]').rwdImageMaps();
		});
	</script>
	<body>
		<table  id="inCar_main">
			<tr>
				<td id="main_h1"><h1>주차장이름 주차정산기</h1></td>
				<td id="main_p"><p><%=format1.format(date)+"&nbsp;"+format2.format(date) %></p></td>
			</tr>
			<tr>
				<td rowspan="2">
					<table>
						<tr>
							<td id="img">
								<img src="../testpicture/plate_save/<%= ptvo.getPhoto_fname() %>" id="img1">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td id="mainimg">
					<table>
						<tr>
							<td id="img_menu" class="menu_cost">
								<b>결제금액</b> : <input type="text" value="<%= cost %> 원" readonly>
							</td>
						</tr>
						<tr>
							<td id="img_menu" class="menu_number">
								<b>차량번호</b> : <input type="text" value="<%= outvo.getMove_car() %>" readonly>
							</td>
						</tr>
						<tr>
							<td id="img_menu" class="menu_inCar">
								<b>입차시간</b> : <input type="text" value="<%= invo.getMove_time() %>" readonly>
							</td>
						</tr>
						<tr>
							<td id="img_menu" class="menu_outCar">
								<b>출차시간</b> : <input type="text" value="<%= outvo.getMove_time() %>" readonly>
							</td>
						</tr>
						<tr>
							<td id="img_menu" class="menu_space">
								<b>주차시간</b> : <input type="text" value="<%= outvo.getMove_ptime() %> 분" readonly>
							</td>
						</tr>
						<tr>
							<td id="img_menu" class="menu_money">
								<b>주차요금</b> : <input type="text" value="<%= cost %>" readonly>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>