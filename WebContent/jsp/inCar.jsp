<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import= "java.util.*" %>
<%@ page import= "java.text.*" %>
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
	
	moveVO vo   = dto.in_Read(move_car);
	
	parkDTO pdto = new parkDTO();
	parkVO pvo   = pdto.ParkRead(move_no);
	
	photoDTO ptdto = new photoDTO();
	photoVO ptvo   = ptdto.Read(move_no);
	
	String floor = pvo.getPark_no().substring(0,1);
	System.out.println(pvo.getPark_no());
	System.out.println(floor);
	
	String floorzone = pvo.getPark_no().substring(2,3)+"_"+pvo.getPark_no().substring(3);
	System.out.println(floorzone);
	
	String zone = pvo.getPark_no().replace("F", "층 ");
	zone = zone + "열";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>입차화면</title>
	</head>
<link href="../css/inCar.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
<script type="text/javascript" src="http://davidlynch.org/projects/maphilight/jquery.maphilight.min.js"></script>
	<script>
		$(document).ready(function() {
						
			$.fn.maphilight.defaults = {
				    fill: true,  //이미지맵 링크에 마우스가 올라오면 색을 넣을 건지 여부
				    fillColor: 'ffffff',  // 색상지정
				    fillOpacity: 0.3,  // 투명도 지정 0~1
				    stroke: true,    // border를 넣을건지 여부 
				    strokeColor: 'ffffff',  //border 색상
				    strokeOpacity: 1,  //border 투명도
				    strokeWidth: 6  //border 폭
				}
			
			$('img[usemap]').rwdImageMaps();
			//$('area[alt="E_21"]').maphilight();
			
			$.ajax
			({
				type: "get",
				url: "InCar"+<%=floor%>+".jsp",
				dataType:"html",
				success: function(data)
				{	
					$("#mainimg").html(data);
					$('img[usemap]').rwdImageMaps();
				}
			});		
			OverlapImage("<%=floorzone%>");
			
		});
		function OverlapImage(pAlt)
		{
//			var ops    = $("img[usemap]").offset();
//			var coords = $('area[alt="' + pAlt + '"]').attr("coords").split(",");
//			var pos_left = ops.left + parseInt(coords[0]*0.7);
//			var pos_top  = ops.top  + parseInt(coords[1]*0.7);
			switch(pAlt){
				case "A_1":	$("#overlap").css("left",1635.5);$("#overlap").css("top",724.562);break;
				case "A_2":	$("#overlap").css("left",1607.5);$("#overlap").css("top",724.562);break;
				case "A_3":	$("#overlap").css("left",1578.5);$("#overlap").css("top",724.562);break;
				case "A_4":	$("#overlap").css("left",1535.5);$("#overlap").css("top",724.562);break;
				case "A_5":	$("#overlap").css("left",1507.5);$("#overlap").css("top",724.562);break;
				case "A_6":	$("#overlap").css("left",1478.5);$("#overlap").css("top",724.562);break;
				case "A_7":	$("#overlap").css("left",1434.5);$("#overlap").css("top",724.562);break;
				case "A_8":	$("#overlap").css("left",1405.5);$("#overlap").css("top",724.562);break;
				case "A_9":	$("#overlap").css("left",1377.5);$("#overlap").css("top",724.562);break;
				case "A_10":$("#overlap").css("left",1318.5);$("#overlap").css("top",724.562);break;
				case "A_11":$("#overlap").css("left",1290.5);$("#overlap").css("top",724.562);break;
				case "A_12":$("#overlap").css("left",1261.5);$("#overlap").css("top",724.562);break;
				case "A_13":$("#overlap").css("left",1218.5);$("#overlap").css("top",724.562);break;
				case "A_14":$("#overlap").css("left",1190.5);$("#overlap").css("top",724.562);break;
				case "A_15":$("#overlap").css("left",1161.5);$("#overlap").css("top",724.562);break;
				case "A_16":$("#overlap").css("left",1117.5);$("#overlap").css("top",724.562);break;
				case "A_17":$("#overlap").css("left",1089.5);$("#overlap").css("top",724.562);break;
				case "A_18":$("#overlap").css("left",1060.5);$("#overlap").css("top",724.562);break;
				
				case "B_1":	$("#overlap").css("left",1635.5);$("#overlap").css("top",636.562);break;
				case "B_2":	$("#overlap").css("left",1607.5);$("#overlap").css("top",636.562);break;
				case "B_3":	$("#overlap").css("left",1578.5);$("#overlap").css("top",636.562);break;
				case "B_4":	$("#overlap").css("left",1535.5);$("#overlap").css("top",636.562);break;
				case "B_5":	$("#overlap").css("left",1507.5);$("#overlap").css("top",636.562);break;
				case "B_6":	$("#overlap").css("left",1477.5);$("#overlap").css("top",636.562);break;
				case "B_7":	$("#overlap").css("left",1434.5);$("#overlap").css("top",636.562);break;
				case "B_8":	$("#overlap").css("left",1405.5);$("#overlap").css("top",636.562);break;
				case "B_9":	$("#overlap").css("left",1377.5);$("#overlap").css("top",636.562);break;
				case "B_10":$("#overlap").css("left",1318.5);$("#overlap").css("top",636.562);break;
				case "B_11":$("#overlap").css("left",1290.5);$("#overlap").css("top",636.562);break;
				case "B_12":$("#overlap").css("left",1261.5);$("#overlap").css("top",636.562);break;
				case "B_13":$("#overlap").css("left",1218.5);$("#overlap").css("top",636.562);break;
				case "B_14":$("#overlap").css("left",1190.5);$("#overlap").css("top",636.562);break;
				case "B_15":$("#overlap").css("left",1161.5);$("#overlap").css("top",636.562);break;
				case "B_16":$("#overlap").css("left",1117.5);$("#overlap").css("top",636.562);break;
				case "B_17":$("#overlap").css("left",1089.5);$("#overlap").css("top",636.562);break;
				case "B_18":$("#overlap").css("left",1060.5);$("#overlap").css("top",636.562);break;

				case "C_1":	$("#overlap").css("left",1635.5);$("#overlap").css("top",508.562);break;
				case "C_2":	$("#overlap").css("left",1607.5);$("#overlap").css("top",508.562);break;
				case "C_3":	$("#overlap").css("left",1578.5);$("#overlap").css("top",508.562);break;
				case "C_4":	$("#overlap").css("left",1535.5);$("#overlap").css("top",508.562);break;
				case "C_5":	$("#overlap").css("left",1507.5);$("#overlap").css("top",508.562);break;
				case "C_6":	$("#overlap").css("left",1477.5);$("#overlap").css("top",508.562);break;
				case "C_7":	$("#overlap").css("left",1434.5);$("#overlap").css("top",508.562);break;
				case "C_8":	$("#overlap").css("left",1405.5);$("#overlap").css("top",508.562);break;
				case "C_9":	$("#overlap").css("left",1377.5);$("#overlap").css("top",508.562);break;
				case "C_10":$("#overlap").css("left",1318.5);$("#overlap").css("top",508.562);break;
				case "C_11":$("#overlap").css("left",1290.5);$("#overlap").css("top",508.562);break;
				case "C_12":$("#overlap").css("left",1261.5);$("#overlap").css("top",508.562);break;
				case "C_13":$("#overlap").css("left",1218.5);$("#overlap").css("top",508.562);break;
				case "C_14":$("#overlap").css("left",1190.5);$("#overlap").css("top",508.562);break;
				case "C_15":$("#overlap").css("left",1161.5);$("#overlap").css("top",508.562);break;
				case "C_16":$("#overlap").css("left",1117.5);$("#overlap").css("top",508.562);break;
				case "C_17":$("#overlap").css("left",1089.5);$("#overlap").css("top",508.562);break;
				case "C_18":$("#overlap").css("left",1060.5);$("#overlap").css("top",508.562);break;
				
				case "D_1":	$("#overlap").css("left",1635.5);$("#overlap").css("top",420.562);break;
				case "D_2":	$("#overlap").css("left",1607.5);$("#overlap").css("top",420.562);break;
				case "D_3":	$("#overlap").css("left",1578.5);$("#overlap").css("top",420.562);break;
				case "D_4":	$("#overlap").css("left",1535.5);$("#overlap").css("top",420.562);break;
				case "D_5":	$("#overlap").css("left",1507.5);$("#overlap").css("top",420.562);break;
				case "D_6":	$("#overlap").css("left",1477.5);$("#overlap").css("top",420.562);break;
				case "D_7":	$("#overlap").css("left",1434.5);$("#overlap").css("top",420.562);break;
				case "D_8":	$("#overlap").css("left",1405.5);$("#overlap").css("top",420.562);break;
				case "D_9":	$("#overlap").css("left",1377.5);$("#overlap").css("top",420.562);break;
				case "D_10":$("#overlap").css("left",1318.5);$("#overlap").css("top",420.562);break;
				case "D_11":$("#overlap").css("left",1290.5);$("#overlap").css("top",420.562);break;
				case "D_12":$("#overlap").css("left",1261.5);$("#overlap").css("top",420.562);break;
				case "D_13":$("#overlap").css("left",1218.5);$("#overlap").css("top",420.562);break;
				case "D_14":$("#overlap").css("left",1190.5);$("#overlap").css("top",420.562);break;
				case "D_15":$("#overlap").css("left",1161.5);$("#overlap").css("top",420.562);break;
				case "D_16":$("#overlap").css("left",1117.5);$("#overlap").css("top",420.562);break;
				case "D_17":$("#overlap").css("left",1089.5);$("#overlap").css("top",420.562);break;
				case "D_18":$("#overlap").css("left",1060.5);$("#overlap").css("top",420.562);break;
				
				case "E_1":	$("#overlap").css("left",1634.5);$("#overlap").css("top",256.562);break;
				case "E_2":	$("#overlap").css("left",1605.5);$("#overlap").css("top",256.562);break;
				case "E_3":	$("#overlap").css("left",1577.5);$("#overlap").css("top",256.562);break;
				case "E_4":	$("#overlap").css("left",1534.5);$("#overlap").css("top",256.562);break;
				case "E_5":	$("#overlap").css("left",1505.5);$("#overlap").css("top",256.562);break;
				case "E_6":	$("#overlap").css("left",1477.5);$("#overlap").css("top",256.562);break;
				case "E_7":	$("#overlap").css("left",1432.5);$("#overlap").css("top",256.562);break;
				case "E_8":	$("#overlap").css("left",1404.5);$("#overlap").css("top",256.562);break;
				case "E_9":	$("#overlap").css("left",1376.5);$("#overlap").css("top",256.562);break;
				case "E_10":$("#overlap").css("left",1335.5);$("#overlap").css("top",256.562);break;
				case "E_11":$("#overlap").css("left",1307.5);$("#overlap").css("top",256.562);break;
				case "E_12":$("#overlap").css("left",1278.5);$("#overlap").css("top",256.562);break;
				case "E_13":$("#overlap").css("left",1235.5);$("#overlap").css("top",256.562);break;
				case "E_14":$("#overlap").css("left",1206.5);$("#overlap").css("top",256.562);break;
				case "E_15":$("#overlap").css("left",1178.5);$("#overlap").css("top",256.562);break;
				case "E_16":$("#overlap").css("left",1135.5);$("#overlap").css("top",256.562);break;
				case "E_17":$("#overlap").css("left",1107.5);$("#overlap").css("top",256.562);break;
				case "E_18":$("#overlap").css("left",1078.5);$("#overlap").css("top",256.562);break;
				case "E_19":$("#overlap").css("left",1034.5);$("#overlap").css("top",256.562);break;
				case "E_20":$("#overlap").css("left",1005.5);$("#overlap").css("top",256.562);break;
				case "E_21":$("#overlap").css("left",977.5);$("#overlap").css("top",256.562);break;
				
				case "F_1":	$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",341.562);break;
				case "F_2":	$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",370.562);break;
				case "F_3":	$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",399.562);break;
				case "F_4":	$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",442.562);break;
				case "F_5":	$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",470.562);break;
				case "F_6":	$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",498.562);break;
				case "F_7":	$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",543.562);break;
				case "F_8":	$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",571.562);break;
				case "F_9":	$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",599.562);break;
				case "F_10":$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",643.562);break;
				case "F_11":$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",671.562);break;
				case "F_12":$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",699.562);break;
				case "F_13":$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",744.562);break;
				case "F_14":$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",772.562);break;
				case "F_15":$("#overlap").css("width",64);$("#overlap").css("height",26);$("#overlap").css("left",878);$("#overlap").css("top",800.562);break;
			}
		}
	</script>
	<body>
		<img id="overlap">
		<table border="1" id="inCar_main">
			<tr>
				<td id="main_h1"><h1>주차장이름 주차정산기</h1></td>
				<td id="main_p"><p><%=format1.format(date)+"&nbsp;"+format2.format(date) %></p></td>
			</tr>
			<tr>
				<td rowspan="2">
					<table border="1" >
						<tr>
							<td id="img">
								<img src="../testpicture/plate_save/<%= ptvo.getPhoto_fname() %>" id="img1">	
							</td>
						</tr>
						<tr>
							<td>
								<table id="img_inner">
									<tr>
										<td>
											<b>차량번호</b>	
										</td>
									</tr>
									<tr>
										<td id="img_menu" class="img_menu1">
											<input type="text" value="<%= vo.getMove_car() %>" readonly>
										</td>
									</tr>
									<tr>
										<td id="img_menu" class="img_menu2">
											<b>입차시간 :</b>  <input type="text" value="<%= vo.getMove_time() %>" readonly>
										</td>
									</tr>
									<tr>
										<td id="img_menu" class="img_menu3">
											<b>주차공간 :</b>  <input type="text" value="<%= zone %>" readonly>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td id="mainimg">
					<img src="../img/InfoParking1.jpg" usemap="#image-map">
					<map class="parking" name="image-map">
					    <area  target="_self" alt="A_1" title="A_1" href="javascript:;" coords="1095,677,1136,770" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_2" title="A_2" href="javascript:;" coords="1092,771,1053,676" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_3" title="A_3" href="/A-3" coords="1012,676,1051,770" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_4" title="A_4" href="/A-4" coords="949,677,989,770" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_5" title="A_5" href="/A-5" coords="909,677,946,769" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_6" title="A_6" href="/A-6" coords="869,675,908,770" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_7" title="A_7" href="/A-7" coords="803,677,844,771" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_8" title="A_8" href="/A-8" coords="761,680,800,770" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_9" title="A_9" href="/A-9" coords="724,677,759,771" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_10" title="A_10" href="/A-10" coords="637,676,676,770" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_11" title="A_11" href="/A-11" coords="597,676,634,771" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_12" title="A_12" href="/A-12" coords="556,679,595,771" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_13" title="A_13" href="/A-13" coords="491,676,531,773" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_14" title="A_14" href="/A-14" coords="451,677,488,771" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_15" title="A_15" href="/A-15" coords="411,677,447,770" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_16" title="A_16" href="/A-16" coords="345,677,386,770" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_17" title="A_17" href="/A-17" coords="306,677,342,769" shape="rect" id="volume_up">
					    <area  target="_self" alt="A_18" title="A_18" href="/A-18" coords="265,675,301,771" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_1" title="B_1" href="/B-1" coords="1093,549,1136,646" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_2" title="B_2" href="/B-2" coords="1053,549,1097,648" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_3" title="B_3" href="/B-3" coords="1012,550,1055,647" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_4" title="B_4" href="/B-4" coords="950,551,991,644" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_5" title="B_5" href="/B-5" coords="909,552,948,643" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_6" title="B_6" href="/B-6" coords="868,552,907,643" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_7" title="B_7" href="/B-7" coords="807,552,845,644" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_8" title="B_8" href="/B-8" coords="765,551,804,643" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_9" title="B_9" href="/B-9" coords="724,552,763,644" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_10" title="B_10" href="/B-10" coords="639,551,679,645" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_11" title="B_11" href="/B-11" coords="598,551,638,643" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_12" title="B_12" href="/B-12" coords="555,551,597,644" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_13" title="B_13" href="/B-13" coords="492,551,531,643" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_14" title="B_14" href="/B-14" coords="451,551,490,643" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_15" title="B_15" href="/B-15" coords="408,551,450,645" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_16" title="B_16" href="/B-16" coords="347,552,386,645" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_17" title="B_17" href="/B-17" coords="307,551,345,644" shape="rect" id="volume_up">
					    <area  target="_self" alt="B_18" title="B_18" href="/B-18" coords="265,551,305,645" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_1" title="C_1" href="/C-1" coords="1092,362,1135,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_2" title="C_2" href="/C-2" coords="1052,362,1094,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_3" title="C_3" href="/C-3" coords="1011,362,1054,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_4" title="C_4" href="/C-4" coords="949,360,992,458" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_5" title="C_5" href="/C-5" coords="907,360,950,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_6" title="C_6" href="/C-6" coords="866,361,908,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_7" title="C_7" href="/C-7" coords="800,362,846,460" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_8" title="C_8" href="/C-8" coords="760,362,804,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_9" title="C_9" href="/C-9" coords="719,362,764,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_10" title="C_10" href="/C-10" coords="634,362,679,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_11" title="C_11" href="/C-11" coords="594,362,637,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_12" title="C_12" href="/C-12" coords="552,362,596,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_13" title="C_13" href="/C-13" coords="489,361,535,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_14" title="C_14" href="/C-14" coords="449,362,493,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_15" title="C_15" href="/C-15" coords="409,363,455,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_16" title="C_16" href="/C-16" coords="343,363,388,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_17" title="C_17" href="/C-17" coords="303,363,345,460" shape="rect" id="volume_up">
					    <area  target="_self" alt="C_18" title="C_18" href="/C-18" coords="262,363,307,459" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_1" title="D_1" href="/D-1" coords="1093,236,1136,333" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_2" title="D_2" href="/D-2" coords="1053,237,1095,334" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_3" title="D_3" href="/D-3" coords="1012,237,1055,334" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_4" title="D_4" href="/D-4" coords="948,237,991,335" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_5" title="D_5" href="/D-5" coords="907,236,950,335" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_6" title="D_6" href="/D-6" coords="866,237,908,335" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_7" title="D_7" href="/D-7" coords="802,236,848,334" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_8" title="D_8" href="/D-8" coords="762,237,806,334" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_9" title="D_9" href="/D-9" coords="719,237,764,334" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_10" title="D_10" href="/D-10" coords="635,236,680,333" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_11" title="D_11" href="/D-11" coords="595,236,638,333" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_12" title="D_12" href="/D-12" coords="553,237,597,334" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_13" title="D_13" href="/D-13" coords="488,236,534,334" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_14" title="D_14" href="/D-14" coords="449,236,493,333" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_15" title="D_15" href="/D-15" coords="405,237,451,333" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_16" title="D_16" href="/D-16" coords="343,237,388,333" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_17" title="D_17" href="/D-17" coords="306,237,348,334" shape="rect" id="volume_up">
					    <area  target="_self" alt="D_18" title="D_18" href="/D-18" coords="263,237,308,333" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_1" title="E_1" href="/E-1" coords="1094,1,1137,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_2" title="E_2" href="/E-2" coords="1052,1,1094,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_3" title="E_3" href="/E-3" coords="1010,1,1053,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_4" title="E_4" href="/E-4" coords="947,0,990,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_5" title="E_5" href="/E-5" coords="906,0,949,99" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_6" title="E_6" href="/E-6" coords="864,0,906,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_7" title="E_7" href="/E-7" coords="801,0,847,98" shape="rect" id="volume_up" >
					    <area  target="_self" alt="E_8" title="E_8" href="/E-8" coords="761,1,805,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_9" title="E_9" href="/E-9" coords="719,1,764,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_10" title="E_10" href="/E-10" coords="658,1,703,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_11" title="E_11" href="/E-11" coords="619,1,662,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_12" title="E_12" href="/E-12" coords="577,1,621,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_13" title="E_13" href="/E-13" coords="511,0,557,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_14" title="E_14" href="/E-14" coords="471,1,515,98" shape="rect" id="volume_up" >
					    <area  target="_self" alt="E_15" title="E_15" href="/E-15" coords="430,2,476,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_16" title="E_16" href="/E-16" coords="368,2,413,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_17" title="E_17" href="/E-17" coords="328,1,370,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_18" title="E_18" href="/E-18" coords="287,2,332,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_19" title="E_19" href="/E-19" coords="223,0,265,98" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_20" title="E_20" href="/E-20" coords="183,1,222,99" shape="rect" id="volume_up">
					    <area  target="_self" alt="E_21" title="E_21" href="/E-21" coords="140,0,181,99" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-1" title="F-1" href="/F-1" coords="0,124,98,169" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-2" title="F-2" href="/F-2" coords="0,167,97,209" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-3" title="F-3" href="/F-3" coords="0,208,98,249" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-4" title="F-4" href="/F-4" coords="0,268,97,311" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-5" title="F-5" href="/F-5" coords="0,309,98,351" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-6" title="F-6" href="/F-6" coords="0,349,99,393" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-7" title="F-7" href="/F-7" coords="0,412,98,457" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-8" title="F-8" href="/F-8" coords="0,457,99,497" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-9" title="F-9" href="/F-9" coords="0,497,98,538" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-10" title="F-10" href="/F-10" coords="0,557,98,602" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-11" title="F-11" href="/F-11" coords="0,601,98,643" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-12" title="F-12" href="/F-12" coords="0,642,98,682" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-13" title="F-13" href="/F-13" coords="0,703,98,749" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-14" title="F-14" href="/F-14" coords="0,748,98,788" shape="rect" id="volume_up">
					    <area  target="_self" alt="F-15" title="F-15" href="/F-15" coords="0,787,99,828" shape="rect" id="volume_up">
					</map>
				</td>
			</tr>
		</table>
	</body>
</html>