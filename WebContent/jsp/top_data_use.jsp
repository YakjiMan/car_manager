<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="car_manager_vo.*" %>
<%@ page import="car_manager_dto.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%

Date now = new Date();
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String formatedNow = formatter.format(now);

String park_no1 = request.getParameter("park");

parkDTO dto = new parkDTO();
parkVO vo   = dto.Read(park_no1);

String exist = vo.getPark_exist();

String move_no = vo.getMove_no();
String photo_no = vo.getPhoto_no();

moveDTO mdto = new moveDTO();
moveVO mvo   = mdto.Read(move_no);

photoDTO pdto = new photoDTO();
photoVO pvo   = pdto.Read(move_no);

long cost = 0;
try{
	move_no = vo.getMove_no();
	photo_no = vo.getPhoto_no();
	
	mdto = new moveDTO();
	mvo   = mdto.Read(move_no);
	
	String move_time = mvo.getMove_time();
	//System.out.println("시간:" + move_time);
	
	Date format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatedNow);
    Date format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(move_time);
    
	long diffMin = (format1.getTime() - format2.getTime()) / 60000;
	//System.out.println("계산시가 : " + diffMin);
	
	pdto = new photoDTO();
	pvo   = pdto.Read(move_no);
	
	cost = (diffMin / 30) * 5000;
	
	if (cost == 0)
	{
		cost = 5000;
	}
}catch(Exception e){
	System.out.println("진행중");
}
//System.out.println("주차자리 : " + park_no);
//System.out.println("요금:" + cost);
%>
	<tr>
		<td id="img_td">
			<img src="../testpicture/plate_save/<%= pvo.getPhoto_fname() %>">
		</td>
		<td	rowspan="2">
			<table  id="top_data_text">
				<tr>
					<td>
						차량 번호 :
					</td>
					<td>
						<input type="text" value="<%= mvo.getMove_car() %>" readonly>
					</td>
				</tr>
				<tr>
					<td>
						상태 : 
					</td>
					<td>
						<input type="text" value="주차 불가" readonly>
					</td>
				</tr>
				<tr>
					<td>
						입차 시간 : 
					</td>
					<td>
						<input type="text" value="<%= mvo.getMove_time() %>" readonly>
					</td>
				</tr>
				<tr>
					<td>
						현재 요금 : 
					</td>
					<td>
						<input type="text" value="<%= cost %> 원" readonly>
					</td>
				</tr>
			</table>
		</td>
	</tr>
