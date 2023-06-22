package car_manager_dto;

import car_manager_vo.*;
import car_manager_dao.*;
import java.util.*;


public class userDTO extends DBManager
{
	//아이디 중복 검사
	//리턴값 : true - 중복된 ID, false - 중복이 안된 ID
	public boolean CheckID(String id)
	{
		String sql = "";
		this.DBOpen();		
		sql = "select user_id from user where user_id = '" + this._R(id) + "' ";
		this.RunQuery(sql);
		if(this.GetNext() == true)
		{
			//아이디가 있음
			this.DBClose();
			return true;
		}		
		//아이디가 없음
		this.DBClose();
		return false;
	}
	
	//회원가입 처리 
	//리턴값 : true - 가입성공, false - 가입실패
	public boolean Join(userVO vo)
	{
		//중복된 아이디 인지 검사한다.
		if(CheckID(vo.getUser_id()) == true)
		{
			System.out.println("아이디가있음");
			return false;
		}
		
		this.DBOpen();

		//회원정보를 Insert 한다.(테스트완)
		String sql = "";
		sql  = "insert into user (user_id,user_pw,user_name,user_phone,user_car,user_point,user_mail) "; 
		sql += "values (";
		sql += "'" + _R(vo.getUser_id()) + "',";
		sql += "md5('" + _R(vo.getUser_pw()) + "'),";
		sql += "'" + _R(vo.getUser_name()) + "',";
		sql += "'" + _R(vo.getUser_phone()) + "',";
		sql += "'" + _R(vo.getUser_car()) + "',";
		sql += "'" + _R(vo.getUser_point()) + "',";
		sql += "'" + _R(vo.getUser_mail()) + "'";
		sql += ") ";
		
		System.out.println(sql);
		
		this.RunCommand(sql);		
		
		this.DBClose();
		return true;
	}
	
	//회원 로그인 처리
	public userVO Login(String id,String pw)
	{
		String sql = "";		
		this.DBOpen();		
		sql  = "select user_id,user_name,user_phone,user_car,user_date,user_point,user_mail ";
		sql += "from user ";
		sql += "where id = '" + _R(id) + "' and pw = md5('" + _R(pw) + "') ";
		this.RunQuery(sql);
		if(this.GetNext() == false)
		{
			//해당 회원 정보가 없음.
			this.DBClose();
			return null;
		}
		userVO vo = new userVO();
		vo.setUser_id(id);
		vo.setUser_name(this.GetValue("user_name"));
		vo.setUser_phone(this.GetValue("user_phone"));
		vo.setUser_car(this.GetValue("user_car"));		
		vo.setUser_date(this.GetValue("user_date"));	
		vo.setUser_point(this.GetValue("user_point"));	
		vo.setUser_mail(this.GetValue("user_mail"));	
		
		this.DBClose();		
		return vo;
	}
	
	//1명의 회원정보를 불러옴 (테스트완)
	public userVO Read(String no)
	{
		this.DBOpen();
		
		String sql = "";

		sql  = "select user_name,user_phone,user_car,user_date,user_point,user_mail,user_id,user_pw ";
		sql += "from user where user_no = " + no;
		this.RunQuery(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		userVO vo = new userVO();
		vo.setUser_no(no);
		vo.setUser_name(this.GetValue("user_name"));
		vo.setUser_phone(this.GetValue("user_phone"));
		vo.setUser_car(this.GetValue("user_car"));
		vo.setUser_date(this.GetValue("user_date"));
		vo.setUser_point(this.GetValue("user_point"));
		vo.setUser_mail(this.GetValue("user_mail"));
		vo.setUser_id(this.GetValue("user_id"));
		vo.setUser_pw(this.GetValue("user_pw"));
		
		this.DBClose();
		return vo;
	}
	
	//회원들의 목록을 얻는다.(테스트완)
	public ArrayList<userVO> GetList()
	{
		ArrayList<userVO> list = new ArrayList<userVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select user_no,user_name,user_phone,user_car,user_date,user_point,user_mail,user_id,user_pw ";
		sql += "from user ";
		sql += "order by user_no desc ";
		
		this.RunQuery(sql);
		while( this.GetNext() == true)
		{
			userVO vo = new userVO();
			vo.setUser_no(this.GetValue("user_no"));
			vo.setUser_name(this.GetValue("user_name"));
			vo.setUser_phone(this.GetValue("user_phone"));
			vo.setUser_car(this.GetValue("user_car"));
			vo.setUser_date(this.GetValue("user_date"));
			vo.setUser_point(this.GetValue("user_point"));
			vo.setUser_mail(this.GetValue("user_mail"));
			vo.setUser_id(this.GetValue("user_id"));
			vo.setUser_pw(this.GetValue("user_pw"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;
	}
	
	//회원 정보를 삭제한다.(테스트완)
	public boolean Delete(String no)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from user where user_no = " + no;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}
}
