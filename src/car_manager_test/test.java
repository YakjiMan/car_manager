package car_manager_test;
import java.util.ArrayList;

import car_manager_dto.*;
import car_manager_vo.*;


public class test 
{
	public static void main(String[] args) 
	{
		moveDTO dto = new moveDTO();
		ArrayList<moveVO> list = dto.GetList();
		
		System.out.println(list);
//		parkDTO dto = new parkDTO();
//		parkVO vo = new parkVO();
//		
//		vo.setPark_exist("full");
//		vo.setUser_no("2");
//		vo.setMove_no("154");
//		vo.setPhoto_no("40");
//		vo.setPark_no("2FF1");
//		
//		dto.Update(vo);
//		photoDTO dto = new photoDTO();
//		photoVO vo = new photoVO();
		
		
//		
//		
//		
		
		
//		moveDTO dto = new moveDTO();
//		moveVO vo = new moveVO();
		
//		vo.setMove_car("38µÎ0354");
//		vo.setMove_inout("in");
//		vo.setUser_no("35");
//		System.out.println(vo);
//		
//		dto.Insert(vo);
//		
//		userDTO dto = new userDTO();
//		userVO vo = new userVO();
//		
//		vo.setUser_id("jmu3226");
//		vo.setUser_pw("1234");
//		vo.setUser_name("Á¤¸¼À½");
//		vo.setUser_phone("010-6655-1111");
//		vo.setUser_car("96´õ8134");
//		vo.setUser_mail("jmu@naver.com");
//		vo.setUser_point("1100");
//		
//		System.out.println(vo);
//		
//		dto.Join(vo);
	}
}
