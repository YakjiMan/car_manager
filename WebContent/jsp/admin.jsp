<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="car_manager_vo.*" %>
<%@ page import="car_manager_dto.*" %>
<%@page import="java.util.ArrayList"%>
<%

	ArrayList<String> parkNum = new ArrayList<String>();
	
	

	parkDTO dto = new parkDTO();
	
	String count1 = dto.ParkCount("1F");
	String count2 = dto.ParkCount("2F");
	String count3 = dto.ParkCount("3F");
	String count4 = dto.ParkCount("4F");
	
	int value_int1 = Integer.parseInt(count1);
	int value_int2 = Integer.parseInt(count2);
	int value_int3 = Integer.parseInt(count3);
	int value_int4 = Integer.parseInt(count4);

	value_int1 = 108-value_int1;
	value_int2 = 108-value_int2;
	value_int3 = 108-value_int3;
	value_int4 = 108-value_int4;

	System.out.println(value_int1);
	
	ArrayList<parkVO> list = dto.AdminList();
	for(parkVO vo : list)
	{
		
		parkNum.add(vo.getPark_no());
//		System.out.println("vo.getPark_no():"+vo.getPark_no());
		
	}
	ArrayList<String> parkNum1 = new ArrayList<String>();
	ArrayList<String> parkNum2 = new ArrayList<String>();
	ArrayList<String> parkNum3 = new ArrayList<String>();
	ArrayList<String> parkNum4 = new ArrayList<String>();

	for(int i=0; i<parkNum.size()-1; i++){
		//System.out.println(parkNum.get(i).substring(0,1));
		if(parkNum.get(i).substring(0,1).equals("1")){
			parkNum1.add(parkNum.get(i));
			
			//System.out.println("parkNum1:"+parkNum1);
		}else if(parkNum.get(i).substring(0,1).equals("2")){
			parkNum2.add(parkNum.get(i));	
			//System.out.println("parkNum2:"+parkNum2);
		}else if(parkNum.get(i).substring(0,1).equals("3")){
			parkNum3.add(parkNum.get(i));
			//System.out.println("parkNum3:"+parkNum3);
		}else{
			parkNum4.add(parkNum.get(i));
			//System.out.println("parkNum4:"+parkNum4);
		}
		
	}
/* 	for(int i = 0; i<parkNum1.size(); i++){
	System.out.println(parkNum1.get(i));
	} 
	System.out.println(parkNum2);
	System.out.println(parkNum3);
	System.out.println(parkNum4); */
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<link href="../css/admin.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
<script type="text/javascript" src="http://davidlynch.org/projects/maphilight/jquery.maphilight.min.js"></script>
<script src="./js/admin_v.js"></script>
<script src="./js/admin_h.js"></script>
<script>
	$(document).ready(function() {
		
		$("#overlap").css('opacity','0');
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
		$('img[usemap]').maphilight(); 
		
		var car_count1 = document.getElementById("car_count1").innerText;
		if(car_count1 == 98){
			$("#car_count1").css("color","red"); 
		}else if(car_count1 < 98 && car_count1 > 60){
			$("#car_count1").css("color","orange");
		}else{
			$("#car_count1").css("color","#00D04D");
		}
		
		var fourth = document.getElementById("fourth").innerText;
		if(fourth > 80){
			$("#fourth").css("color","#00D04D"); 
			$("#fourth_1").css("color","#00D04D"); 
		}else if(fourth <81 && fourth > 50){
			$("#fourth").css("color","orange");
			$("#fourth_1").css("color","orange");
		}else{
			$("#fourth").css("color","red");
			$("#fourth_1").css("color","red");
		}

		var third = document.getElementById("third").innerText;
		if(third > 80){
			$("#third").css("color","#00D04D"); 
			$("#third_1").css("color","#00D04D"); 
		}else if(third <81 && third > 50){
			$("#third").css("color","orange");
			$("#third_1").css("color","orange");
		}else{
			$("#third").css("color","red");
			$("#third_1").css("color","red");
		}
		var second = document.getElementById("second").innerText;
		if(second > 80){
			$("#second").css("color","#00D04D"); 
			$("#second_1").css("color","#00D04D"); 
		}else if(second <81 && second > 50){
			$("#second").css("color","orange");
			$("#second_1").css("color","orange");
		}else{
			$("#second").css("color","red");
			$("#second_1").css("color","red");
		}
		var first = document.getElementById("first").innerText;
		if(first > 80){
			$("#first").css("color","#00D04D"); 
			$("#first_1").css("color","#00D04D"); 
		}else if(first <81 && first > 50){
			$("#first").css("color","orange");
			$("#first_1").css("color","orange");
		}else{
			$("#first").css("color","red");
			$("#first_1").css("color","red");
		}
		
		<%	
		for(int i = 0; i<parkNum1.size()-1; i++){
			//System.out.println("parkNum1.get(i):"+parkNum1.get(i));
			%>
			//console.log("[<%= parkNum1.get(i) %>]");
			if('<%=parkNum1.get(i).substring(2,3)%>' == 'F')
			{
				DisableBox2('<%=parkNum1.get(i)%>');
			}else{
				DisableBox1('<%=parkNum1.get(i)%>');
			}
			<%
		}
		%>
		ViewBottomData();
	});
	function ReLoad()
	{
		$('img[usemap]').rwdImageMaps();
		$('img[usemap]').maphilight(); 
	}
	function ViewTopData(pAlt)
 	{
		
		$.ajax
		({
			type: "get",
			url: "top_data.jsp?park=" + pAlt,
			dataType:"html",
			success: function(data)
			{	
				
				$("#top_data").html(data);
				ViewBottomData();
			}
		});		
	} 
	
	function ViewTopData(pArt)
 	{
		$.ajax
		({
			type: "get",
			url: "top_data.jsp?park=" + pArt,
			dataType:"html",
			success: function(data)
			{	
				$("#top_data").html(data);
				ViewBottomData();
			}
		});		
	} 
	
 	function ViewBottomData()
	{
		$.ajax
		({
			type: "get",
			url: "bottom_data.jsp",
			dataType:"html",
			success: function(data)
			{	
				$("#bottom_data").html(data);
			}
		});		
	} 
	

	function MainImage(floor)
	{
		var word = floor;
		$("#nthfloor h2 b").html(word+"층");
		$.ajax
		({
			type: "get",
			url: "admin_image"+floor+".jsp",
			dataType:"html",
			success: function(data)
			{	
				$(".overlap").css('width','0');
				$(".overlap").css('height','0');
				$("#overlap").css('opacity','0');
				$("#mainimg").html(data);
				ReLoad();
				if(floor == 1){
					$("#car_count1").html(<%=count1%>);
					<%	
					for(int i = 0; i<parkNum1.size()-1; i++){
						//System.out.println("parkNum1.get(i):"+parkNum1.get(i));
						%>
						//console.log("[<%= parkNum1.get(i) %>]");
						if('<%=parkNum1.get(i).substring(2,3)%>' == 'F')
						{
							DisableBox2('<%=parkNum1.get(i)%>');
						}else{
							DisableBox1('<%=parkNum1.get(i)%>');
						}
						<%
					}
					%>
					}else if(floor == 2){
						$("#car_count1").html(<%=count2%>);
						<%	
						for(int i = 0; i<parkNum2.size()-1; i++){
							//System.out.println("parkNum1.get(i):"+parkNum1.get(i));
							//System.out.println(parkNum2.get(i).substring(2,3));
							%>
							if('<%=parkNum2.get(i).substring(2,3)%>' == 'F'){
								DisableBox2('<%=parkNum2.get(i)%>');
								}else{
								DisableBox1('<%=parkNum2.get(i)%>');
								}
								<%
							}
						%>	
					}else if(floor == 3){
						$("#car_count1").html(<%=count3%>);
						<%	
						for(int i = 0; i<parkNum3.size()-1; i++){
							//System.out.println("parkNum1.get(i):"+parkNum1.get(i));
							%>
								if('<%=parkNum3.get(i).substring(2,3)%>' == 'F'){
								DisableBox2('<%=parkNum3.get(i)%>');
								}else{
								DisableBox1('<%=parkNum3.get(i)%>');
								}
								<%
							}
						%>	
					}else if(floor == 4){
						$("#car_count1").html(<%=count4%>);
						<%	
						for(int i = 0; i<parkNum4.size()-1; i++){
							//System.out.println("parkNum1.get(i):"+parkNum1.get(i));
							%>
								if('<%=parkNum4.get(i).substring(2,3)%>' == 'F'){
								
								DisableBox2('<%=parkNum4.get(i)%>');
								}else{
								DisableBox1('<%=parkNum4.get(i)%>');
								
									
								}
								<%
							}
						%>	
					}
			}
		});		
	}
	function DisableBox1(pAlt)
  	{
  		html = $("#listBox").html(); 
  		html += "<img class='overlap' id='overlap_" + pAlt + "'>";
  		$("#listBox").html(html);
  		DrawBox1(pAlt,"overlap_" + pAlt);	  		
  	}
	function DisableBox2(pArt)
  	{
  		html = $("#listBox").html(); 
  		html += "<img class='overlap' id='overlap_" + pArt + "'>";
  		$("#listBox").html(html);
  		DrawBox2(pArt,"overlap_" + pArt);	  		
  	}
	function checked(pAlt)
	{
		$("#overlap").css('opacity','0.8');
  		$("#overlap").css("width",32);$("#overlap").css("height",77);
  		var word1 = pAlt.substring(0,1);
		var word2 = pAlt.substring(1,2);
		var word3 = pAlt.substring(2,3);
		var word4 = pAlt.substring(3,5);	
		
		DrawBox1(pAlt,"overlap");
		ViewTopData(pAlt);
	
		
	}
		function checked2(pArt){
			$("#overlap").css('opacity','0.8');
			var word1 = pArt.substring(0,1);
			var word2 = pArt.substring(1,2);
			var word3 = pArt.substring(2,3);
			var word4 = pArt.substring(3,5);
		
			DrawBox2(pArt,"overlap");
			ViewTopData(pArt);
			
		}
			
</script>
<body>
	<img id="overlap">
	<table border="1" id="main_tbl">
		<tr>
			<td id="mainimg" colspan="2">
				<img src="../img/parkingA.jpg" usemap="#image-map">
				<map class="parking" name="image-map">
				 	<area onclick="MainImage(4);" target="_self" alt="4floor" title="4floor" href="javascript:;" coords="1202,797,1120,828,1203,858,1283,828" shape="poly">
				    <area onclick="MainImage(3);" target="_self" alt="3floor" title="3floor" href="javascript:;" coords="1158,842,1120,855,1202,883,1284,855,1248,842,1204,859" shape="poly">
				    <area onclick="MainImage(2);" target="_self" alt="2floor" title="2floor" href="javascript:;" coords="1158,869,1202,884,1246,869,1285,882,1202,910,1119,882" shape="poly">
				    <area onclick="MainImage(1);" target="_self" alt="1floor" title="1floor" href="javascript:;" coords="1158,897,1202,912,1248,895,1284,910,1202,940,1119,909" shape="poly">
				    <area onclick="checked('1FA1');"  target="_self" alt="A_1" title="A_1" href="javascript:;" coords="1095,677,1136,770" shape="rect" id="volume_up">
				    <area onclick="checked('1FA2');"  target="_self" alt="A_2" title="A_2" href="javascript:;" coords="1092,771,1053,676" shape="rect" id="volume_up">
				    <area onclick="checked('1FA3');"  target="_self" alt="A_3" title="A_3" href="javascript:;" coords="1012,676,1051,770" shape="rect" id="volume_up">
				    <area onclick="checked('1FA4');"  target="_self" alt="A_4" title="A_4" href="javascript:;" coords="949,677,989,770" shape="rect" id="volume_up">
				    <area onclick="checked('1FA5');"  target="_self" alt="A_5" title="A_5" href="javascript:;" coords="909,677,946,769" shape="rect" id="volume_up">
				    <area onclick="checked('1FA6');"  target="_self" alt="A_6" title="A_6" href="javascript:;" coords="869,675,908,770" shape="rect" id="volume_up">
				    <area onclick="checked('1FA7');"  target="_self" alt="A_7" title="A_7" href="javascript:;" coords="803,677,844,771" shape="rect" id="volume_up">
				    <area onclick="checked('1FA8');"  target="_self" alt="A_8" title="A_8" href="javascript:;" coords="761,680,800,770" shape="rect" id="volume_up">
				    <area onclick="checked('1FA9');"  target="_self" alt="A_9" title="A_9" href="javascript:;" coords="724,677,759,771" shape="rect" id="volume_up">
				    <area onclick="checked('1FA10');" target="_self" alt="A_10" title="A_10" href="javascript:;" coords="637,676,676,770" shape="rect" id="volume_up">
				    <area onclick="checked('1FA11');" target="_self" alt="A_11" title="A_11" href="javascript:;" coords="597,676,634,771" shape="rect" id="volume_up">
				    <area onclick="checked('1FA12');" target="_self" alt="A_12" title="A_12" href="javascript:;" coords="556,679,595,771" shape="rect" id="volume_up">
				    <area onclick="checked('1FA13');" target="_self" alt="A_13" title="A_13" href="javascript:;" coords="491,676,531,773" shape="rect" id="volume_up">
				    <area onclick="checked('1FA14');" target="_self" alt="A_14" title="A_14" href="javascript:;" coords="451,677,488,771" shape="rect" id="volume_up">
				    <area onclick="checked('1FA15');" target="_self" alt="A_15" title="A_15" href="javascript:;" coords="411,677,447,770" shape="rect" id="volume_up">
				    <area onclick="checked('1FA16');" target="_self" alt="A_16" title="A_16" href="javascript:;" coords="345,677,386,770" shape="rect" id="volume_up">
				    <area onclick="checked('1FA17');" target="_self" alt="A_17" title="A_17" href="javascript:;" coords="306,677,342,769" shape="rect" id="volume_up">
				    <area onclick="checked('1FA18');" target="_self" alt="A_18" title="A_18" href="javascript:;" coords="265,675,301,771" shape="rect" id="volume_up">
				    <area onclick="checked('1FB1');"  target="_self" alt="B_1" title="B_1" href="javascript:;" coords="1093,549,1136,646" shape="rect" id="volume_up">
				    <area onclick="checked('1FB2');"  target="_self" alt="B_2" title="B_2" href="javascript:;" coords="1053,549,1097,648" shape="rect" id="volume_up">
				    <area onclick="checked('1FB3');"  target="_self" alt="B_3" title="B_3" href="javascript:;" coords="1012,550,1055,647" shape="rect" id="volume_up">
				    <area onclick="checked('1FB4');"  target="_self" alt="B_4" title="B_4" href="javascript:;" coords="950,551,991,644" shape="rect" id="volume_up">
				    <area onclick="checked('1FB5');"  target="_self" alt="B_5" title="B_5" href="javascript:;" coords="909,552,948,643" shape="rect" id="volume_up">
				    <area onclick="checked('1FB6');"  target="_self" alt="B_6" title="B_6" href="javascript:;" coords="868,552,907,643" shape="rect" id="volume_up">
				    <area onclick="checked('1FB7');"  target="_self" alt="B_7" title="B_7" href="javascript:;" coords="807,552,845,644" shape="rect" id="volume_up">
				    <area onclick="checked('1FB8');"  target="_self" alt="B_8" title="B_8" href="javascript:;" coords="765,551,804,643" shape="rect" id="volume_up">
				    <area onclick="checked('1FB9');"  target="_self" alt="B_9" title="B_9" href="javascript:;" coords="724,552,763,644" shape="rect" id="volume_up">
				    <area onclick="checked('1FB10');" target="_self" alt="B_10" title="B_10" href="javascript:;" coords="639,551,679,645" shape="rect" id="volume_up">
				    <area onclick="checked('1FB11');" target="_self" alt="B_11" title="B_11" href="javascript:;" coords="598,551,638,643" shape="rect" id="volume_up">
				    <area onclick="checked('1FB12');" target="_self" alt="B_12" title="B_12" href="javascript:;" coords="555,551,597,644" shape="rect" id="volume_up">
				    <area onclick="checked('1FB13');" target="_self" alt="B_13" title="B_13" href="javascript:;" coords="492,551,531,643" shape="rect" id="volume_up">
				    <area onclick="checked('1FB14');" target="_self" alt="B_14" title="B_14" href="javascript:;" coords="451,551,490,643" shape="rect" id="volume_up">
				    <area onclick="checked('1FB15');" target="_self" alt="B_15" title="B_15" href="javascript:;" coords="408,551,450,645" shape="rect" id="volume_up">
				    <area onclick="checked('1FB16');" target="_self" alt="B_16" title="B_16" href="javascript:;" coords="347,552,386,645" shape="rect" id="volume_up">
				    <area onclick="checked('1FB17');" target="_self" alt="B_17" title="B_17" href="javascript:;" coords="307,551,345,644" shape="rect" id="volume_up">
				    <area onclick="checked('1FB18');" target="_self" alt="B_18" title="B_18" href="javascript:;" coords="265,551,305,645" shape="rect" id="volume_up">
				    <area onclick="checked('1FC1');"  target="_self" alt="C_1" title="C_1" href="javascript:;" coords="1092,362,1135,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC2');"  target="_self" alt="C_2" title="C_2" href="javascript:;" coords="1052,362,1094,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC3');"  target="_self" alt="C_3" title="C_3" href="javascript:;" coords="1011,362,1054,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC4');"  target="_self" alt="C_4" title="C_4" href="javascript:;" coords="949,360,992,458" shape="rect" id="volume_up">
				    <area onclick="checked('1FC5');"  target="_self" alt="C_5" title="C_5" href="javascript:;" coords="907,360,950,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC6');"  target="_self" alt="C_6" title="C_6" href="javascript:;" coords="866,361,908,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC7');"  target="_self" alt="C_7" title="C_7" href="javascript:;" coords="800,362,846,460" shape="rect" id="volume_up">
				    <area onclick="checked('1FC8');"  target="_self" alt="C_8" title="C_8" href="javascript:;" coords="760,362,804,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC9');"  target="_self" alt="C_9" title="C_9" href="javascript:;" coords="719,362,764,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC10');" target="_self" alt="C_10" title="C_10" href="javascript:;" coords="634,362,679,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC11');" target="_self" alt="C_11" title="C_11" href="javascript:;" coords="594,362,637,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC12');" target="_self" alt="C_12" title="C_12" href="javascript:;" coords="552,362,596,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC13');" target="_self" alt="C_13" title="C_13" href="javascript:;" coords="489,361,535,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC14');" target="_self" alt="C_14" title="C_14" href="javascript:;" coords="449,362,493,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC15');" target="_self" alt="C_15" title="C_15" href="javascript:;" coords="409,363,455,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC16');" target="_self" alt="C_16" title="C_16" href="javascript:;" coords="343,363,388,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FC17');" target="_self" alt="C_17" title="C_17" href="javascript:;" coords="303,363,345,460" shape="rect" id="volume_up">
				    <area onclick="checked('1FC18');" target="_self" alt="C_18" title="C_18" href="javascript:;" coords="262,363,307,459" shape="rect" id="volume_up">
				    <area onclick="checked('1FD1');"  target="_self" alt="D_1" title="D_1" href="javascript:;" coords="1093,236,1136,333" shape="rect" id="volume_up">
				    <area onclick="checked('1FD2');"  target="_self" alt="D_2" title="D_2" href="javascript:;" coords="1053,237,1095,334" shape="rect" id="volume_up">
				    <area onclick="checked('1FD3');"  target="_self" alt="D_3" title="D_3" href="javascript:;" coords="1012,237,1055,334" shape="rect" id="volume_up">
				    <area onclick="checked('1FD4');"  target="_self" alt="D_4" title="D_4" href="javascript:;" coords="948,237,991,335" shape="rect" id="volume_up">
				    <area onclick="checked('1FD5');"  target="_self" alt="D_5" title="D_5" href="javascript:;" coords="907,236,950,335" shape="rect" id="volume_up">
				    <area onclick="checked('1FD6');"  target="_self" alt="D_6" title="D_6" href="javascript:;" coords="866,237,908,335" shape="rect" id="volume_up">
				    <area onclick="checked('1FD7');"  target="_self" alt="D_7" title="D_7" href="javascript:;" coords="802,236,848,334" shape="rect" id="volume_up">
				    <area onclick="checked('1FD8');"  target="_self" alt="D_8" title="D_8" href="javascript:;" coords="762,237,806,334" shape="rect" id="volume_up">
				    <area onclick="checked('1FD9');"  target="_self" alt="D_9" title="D_9" href="javascript:;" coords="719,237,764,334" shape="rect" id="volume_up">
				    <area onclick="checked('1FD10');" target="_self" alt="D_10" title="D_10" href="javascript:;" coords="635,236,680,333" shape="rect" id="volume_up">
				    <area onclick="checked('1FD11');" target="_self" alt="D_11" title="D_11" href="javascript:;" coords="595,236,638,333" shape="rect" id="volume_up">
				    <area onclick="checked('1FD12');" target="_self" alt="D_12" title="D_12" href="javascript:;" coords="553,237,597,334" shape="rect" id="volume_up">
				    <area onclick="checked('1FD13');" target="_self" alt="D_13" title="D_13" href="javascript:;" coords="488,236,534,334" shape="rect" id="volume_up">
				    <area onclick="checked('1FD14');" target="_self" alt="D_14" title="D_14" href="javascript:;" coords="449,236,493,333" shape="rect" id="volume_up">
				    <area onclick="checked('1FD15');" target="_self" alt="D_15" title="D_15" href="javascript:;" coords="405,237,451,333" shape="rect" id="volume_up">
				    <area onclick="checked('1FD16');" target="_self" alt="D_16" title="D_16" href="javascript:;" coords="343,237,388,333" shape="rect" id="volume_up">
				    <area onclick="checked('1FD17');" target="_self" alt="D_17" title="D_17" href="javascript:;" coords="306,237,348,334" shape="rect" id="volume_up">
				    <area onclick="checked('1FD18');" target="_self" alt="D_18" title="D_18" href="javascript:;" coords="263,237,308,333" shape="rect" id="volume_up">
				    <area onclick="checked('1FE1');"  target="_self" alt="E_1" title="E_1" href="javascript:;" coords="1094,1,1137,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE2');"  target="_self" alt="E_2" title="E_2" href="javascript:;" coords="1052,1,1094,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE3');"  target="_self" alt="E_3" title="E_3" href="javascript:;" coords="1010,1,1053,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE4');"  target="_self" alt="E_4" title="E_4" href="javascript:;" coords="947,0,990,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE5');"  target="_self" alt="E_5" title="E_5" href="javascript:;" coords="906,0,949,99" shape="rect" id="volume_up">
				    <area onclick="checked('1FE6');"  target="_self" alt="E_6" title="E_6" href="javascript:;" coords="864,0,906,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE7');"  target="_self" alt="E_7" title="E_7" href="javascript:;" coords="801,0,847,98" shape="rect" id="volume_up" >
				    <area onclick="checked('1FE8');"  target="_self" alt="E_8" title="E_8" href="javascript:;" coords="761,1,805,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE9');"  target="_self" alt="E_9" title="E_9" href="javascript:;" coords="719,1,764,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE10');" target="_self" alt="E_10" title="E_10" href="javascript:;" coords="658,1,703,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE11');" target="_self" alt="E_11" title="E_11" href="javascript:;" coords="619,1,662,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE12');" target="_self" alt="E_12" title="E_12" href="javascript:;" coords="577,1,621,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE13');" target="_self" alt="E_13" title="E_13" href="javascript:;" coords="511,0,557,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE14');" target="_self" alt="E_14" title="E_14" href="javascript:;" coords="471,1,515,98" shape="rect" id="volume_up" >
				    <area onclick="checked('1FE15');" target="_self" alt="E_15" title="E_15" href="javascript:;" coords="430,2,476,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE16');" target="_self" alt="E_16" title="E_16" href="javascript:;" coords="368,2,413,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE17');"target="_self" alt="E_17" title="E_17" href="javascript:;" coords="328,1,370,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE18');" target="_self" alt="E_18" title="E_18" href="javascript:;" coords="287,2,332,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE19');" target="_self" alt="E_19" title="E_19" href="javascript:;" coords="223,0,265,98" shape="rect" id="volume_up">
				    <area onclick="checked('1FE20');" target="_self" alt="E_20" title="E_20" href="javascript:;" coords="183,1,222,99" shape="rect" id="volume_up">
				    <area onclick="checked('1FE21');" target="_self" alt="E_21" title="E_21" href="javascript:;" coords="140,0,181,99" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF1');" target="_self" alt="F-1" title="F-1" href="javascript:;" coords="0,124,98,169" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF2');" target="_self" alt="F-2" title="F-2" href="javascript:;" coords="0,167,97,209" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF3');" target="_self" alt="F-3" title="F-3" href="javascript:;" coords="0,208,98,249" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF4');" target="_self" alt="F-4" title="F-4" href="javascript:;" coords="0,268,97,311" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF5');" target="_self" alt="F-5" title="F-5" href="javascript:;" coords="0,309,98,351" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF6');" target="_self" alt="F-6" title="F-6" href="javascript:;" coords="0,349,99,393" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF7');" target="_self" alt="F-7" title="F-7" href="javascript:;" coords="0,412,98,457" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF8');" target="_self" alt="F-8" title="F-8" href="javascript:;" coords="0,457,99,497" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF9');" target="_self" alt="F-9" title="F-9" href="javascript:;" coords="0,497,98,538" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF10');" target="_self" alt="F-10" title="F-10" href="javascript:;" coords="0,557,98,602" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF11');" target="_self" alt="F-11" title="F-11" href="javascript:;" coords="0,601,98,643" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF12');" target="_self" alt="F-12" title="F-12" href="javascript:;" coords="0,642,98,682" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF13');" target="_self" alt="F-13" title="F-13" href="javascript:;" coords="0,703,98,749" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF14');" target="_self" alt="F-14" title="F-14" href="javascript:;" coords="0,748,98,788" shape="rect" id="volume_up">
				    <area onclick="checked2('1FF15');" target="_self" alt="F-15" title="F-15" href="javascript:;" coords="0,787,99,828" shape="rect" id="volume_up">
				</map>
			</td>
			<td rowspan="2">
				<table border="1" id="side_data">
					<tr>
						<td id="top_data">
							<table border="1">
								<tr>
									<td id="img_td" style="text-align:center">
										차량 없음
									</td>
									<td	rowspan="2">
										<table  id="top_data_text">
											<tr>
												<td id="text_value">
													차량 번호 :
												</td>
												<td>
													<input type="text" value="차량정보가 없습니다." readonly>
												</td>
											</tr>
											<tr>
												<td id="text_value">
													입차 시간 : 
												</td>
												<td>
													<input type="text" value="차량정보가 없습니다." readonly>
												</td>
											</tr>
											<tr>
												<td id="text_value">
													현재 요금 : 
												</td>
												<td>
													<input type="text" value="차량정보가 없습니다." readonly>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>	
					</tr>
					<tr>
						<td id="bottom_data" valign="top">
							<table border="1">
								<tr>
									<td>
										<h3>현황판</h3>
									</td>
								</tr>
								<tr>
									<td>	
										<div id="bottom_board">
											<table border="1" id="bottom_data_tbl">
											<tr>
												<th>차고번호</th>
												<th>주차상태</th>
												<th>차량번호</th>
											</tr>
											<tr>
											</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td id="nthfloor_td1">
				<table id="nthfloor">
					<tr>
						<td colspan="5"><h2><b>1층</b> 주차 현황</h2></td>
					</tr>
					<tr>
						<td id="icon"><img src="../img/parkingicon.png"></td>
						<td>108</td>
						<td>/</td>
						<td id="car_count1"><%=count1 %></td>
						<td></td>
					</tr>
					<tr>
						<td id="icon"></td>
						<td></td>
						<td></td>
						<td id="car_count2"></td>
						<td></td>
					</tr>
					<tr>
						<td id="icon"></td>
						<td></td>
						<td></td>
						<td id="car_count3"></td>
						<td></td>
					</tr>
						<tr>
						<td id="icon"></td>
						<td></td>
						<td></td>
						<td id="car_count4"></td>
						<td></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
			<td id="nthfloor_td2">
				<table id="nthfloor2">
					<tr>
						<td colspan="5"><h2>층별 주차 가능 대수</h2></td>
					</tr>
					<tr>
						<td id="icon"><img src="../img/4flooricon.png"></td>
						<td>4층</td>
						<td id="fourth"><%=value_int4%></td>
						<td id="fourth_1">대</td>
					</tr>
					<tr>
						<td id="icon"><img src="../img/3flooricon.png"></td>
						<td>3층</td>
						<td id="third"><%=value_int3%></td>
						<td id="third_1">대</td>
					</tr>	
					<tr>
						<td id="icon"><img src="../img/2flooricon.png"></td>
						<td>2층</td>
						<td id="second"><%=value_int2%></td>
						<td id="second_1">대</td>
					</tr>
					<tr>
						<td id="icon"><img src="../img/1flooricon.png"></td>
						<td>1층</td>
						<td id="first"><%=value_int1%></td>
						<td id="first_1">대</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<span id="listBox"></span>
</body>
</html>