<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.util.*" %>
<%@ page import= "java.text.*" %>
<%@ page import="car_manager_vo.*" %>
<%@ page import="car_manager_dto.*" %>
<%
String move_no = request.getParameter("move_no");

moveDTO dto = new moveDTO();
moveVO mvo = dto.Read(move_no);
String move_car = mvo.getMove_car();
String move_time = mvo.getMove_time();

ArrayList<moveVO> List = dto.GetList_out(move_car);
moveVO vo = dto.Read_out_time(move_time);
moveVO VO = dto.out_Read();

System.out.println("move_no :" + move_no);


photoDTO DTO = new photoDTO();
photoVO ptvo = DTO.Read(move_car,move_no);

System.out.println(ptvo.getPhoto_fname());

int cost = (Integer.parseInt(VO.getMove_ptime()) / 30) * 5000;
if (cost == 0)
{
	cost = 5000;
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link href="../css/more_infomation.css" rel="stylesheet">
</head>
<script>
	function payment(){
		alert("결제가 완료되었습니다.");
		self.close() 
	}
</script>
<body>
	<table id="main_tbl">
		<tr>
			<td id="title">
				주차차량 요금정보
			</td>
		</tr>
		<tr>
			<td>
				<img src="../testpicture/plate_save/<%= ptvo.getPhoto_fname() %>" id="img1">
			</td>
		</tr>
		<tr>
			<td>
				<table id="info_tbl">
					<tr>
						<td>
							차량번호
						</td>
						<td>
							<%= move_car %>
						</td>
					</tr>
					<tr>
						<td>
							입차시간
						</td>
						<td>
							<%= move_time %>
						</td>
					</tr>
					<tr>
						<td>
							주차시간
						</td>
						<td>
							<%= vo.getMove_ptime() %>분
						</td>
					</tr>
					<tr>
						<td>
							결제금액
						</td>
						<td>
							<%= cost %> 원
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table id="input_tbl">
					<tr>
						<td style="cursor:pointer;">
							<input type="button" value="결제" onclick="payment();">
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="처음으로" onclick="javascript:self.close();">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>