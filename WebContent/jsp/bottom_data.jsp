<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="car_manager_vo.*" %>
<%@ page import="car_manager_dto.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%
	
	ArrayList<String> parklist = new ArrayList<String>();

	parkDTO Bdto = new parkDTO();
	ArrayList<parkVO> Blist = Bdto.GetList();
	
	moveDTO mdto = new moveDTO();
	
	for(parkVO vo : Blist)
	{
		String move_no = vo.getMove_no();
		moveVO mvo = mdto.Read(move_no);
		String move_car = mvo.getMove_car();
		
		parklist.add(vo.getPark_no());
		parklist.add(vo.getPark_exist());
		//parklist.add(vo.getMove_no());
		parklist.add(move_car);
		System.out.println("vo.getPark_no():"+vo.getPark_no());
		System.out.println("vo.getPark_exist():"+vo.getPark_exist());
		System.out.println("vo.getPark_exist():"+vo.getPark_exist());
		System.out.println("차번호:" + move_car);
		
	}
	
%>
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
					<%
					for(parkVO vo : Blist)
					{
						String move_no = vo.getMove_no();
						moveVO mvo = mdto.Read(move_no);
						String move_car = mvo.getMove_car();
						%>
						<tr>
							<td><%= vo.getPark_no() %></td>
							<td><%= vo.getPark_exist() %></td>
							<td><%= move_car %></td>
						</tr>
						<%
					}
					%>
				</table>
			</div>
		</td>
	</tr>
</table>
