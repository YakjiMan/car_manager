package car_manager_dto;

import java.util.ArrayList;

import car_manager_dao.DBManager;
import car_manager_dao.DBManager;
import java.util.*;
import car_manager_dao.*;
import car_manager_vo.*;

public class parkDTO extends DBManager
{
	//게시물을 등록한다.
	public boolean Insert(parkVO vo)
	{
		this.DBOpen();
		
		String sql = "";

//		sql  = "insert into park (park_no,park_exist,user_no,move_no,photo_no) ";
//		sql += "values ('" + vo.getPark_no() + "','" + vo.getPark_exist() + "','" + vo.getUser_no() + "','" + vo.getMove_no() + "','" + vo.getPhoto_no() + "') ";
		sql  = "insert into park (park_no,park_exist) ";
		sql += "values ('" + vo.getPark_no() + "','" + vo.getPark_exist() + "') ";
		this.RunCommand(sql);
		System.out.println(sql);
		
		this.DBClose();
		return true;
	}
	
	//게시물 정보를 변경한다.
	public boolean Update(parkVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update park set ";
		sql += "park_exist='" + vo.getPark_exist() + "',";
		sql += "user_no='" + vo.getUser_no() + "',";
		sql += "move_no='" + vo.getMove_no() + "',";
		sql += "photo_no='" + vo.getPhoto_no() + "' ";
		sql += "where park_no = '" + vo.getPark_no() + "' ";
		this.RunCommand(sql);
		System.out.println(sql);
		this.DBClose();
		return true;
	}
	
	public boolean Update2(parkVO vo ,String park_no)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update park set ";
		sql += "park_no='" + park_no + "' ";
		sql += "where park_no = " + vo.getPark_no();
		this.RunCommand(sql);
		vo.setPark_no(park_no);
		
		this.DBClose();
		return true;
	}
	public boolean ParkBook(String park_no)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update park set ";
		sql += "park_exist='full' ";
		sql += "where park_no='" + park_no + "'";
		this.RunCommand(sql);
		System.out.println(sql);
		
		this.DBClose();
		return true;
	}
	
	
	//게시물 정보를 삭제한다.
	public boolean Delete(String no)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from park where park_no = " + no;
		this.RunCommand(sql);
		System.out.println(sql);
		this.DBClose();
		return true;
	}
	
	//게시물 1개의 정보를 조회한다.
	public parkVO Read(String no)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select park_exist,user_no,move_no,photo_no ";
		sql += "from park where park_no = " + "'" + no + "'";
		this.RunQuery(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		parkVO vo = new parkVO();
		vo.setPark_no(no);
		vo.setPark_exist(this.GetValue("park_exist"));
		vo.setUser_no(this.GetValue("user_no"));
		vo.setPhoto_no(this.GetValue("photo_no"));
		vo.setMove_no(this.GetValue("move_no"));
		System.out.println(sql);
		this.DBClose();
		return vo;
	}
	
	//게시물의 목록을 얻는다.
		public ArrayList<parkVO> GetList()
		{
			ArrayList<parkVO> list = new ArrayList<parkVO>();
			
			this.DBOpen();
			
			String sql = "";
			
			sql  = "select park_no,park_exist,user_no,move_no,photo_no ";
			sql += "from park where (park_exist='full' and not move_no is null)" ;
			this.RunQuery(sql);
			System.out.println(sql);
			while( this.GetNext() == true)
			{
				parkVO vo = new parkVO();
				vo.setPark_no(this.GetValue("park_no"));
				vo.setPark_exist(this.GetValue("park_exist"));
				vo.setUser_no(this.GetValue("user_no"));
				vo.setMove_no(this.GetValue("move_no"));
				vo.setPhoto_no(this.GetValue("photo_no"));
				
				list.add(vo);
			}		
			this.DBClose();
			
			return list;
		}
		
		public ArrayList<parkVO> AdminList()
		{
			ArrayList<parkVO> list = new ArrayList<parkVO>();
			
			this.DBOpen();
			
			String sql = "";
			
			sql  = "select park_no,park_exist,user_no,move_no,photo_no ";
			sql += "from park where park_exist='full'" ;
			this.RunQuery(sql);
			System.out.println(sql);
			while( this.GetNext() == true)
			{
				parkVO vo = new parkVO();
				vo.setPark_no(this.GetValue("park_no"));
				vo.setPark_exist(this.GetValue("park_exist"));
				vo.setUser_no(this.GetValue("user_no"));
				vo.setMove_no(this.GetValue("move_no"));
				vo.setPhoto_no(this.GetValue("photo_no"));
				
				list.add(vo);
			}		
			this.DBClose();
			
			return list;
		}
		
		public ArrayList<parkVO> AllList()
		{
			ArrayList<parkVO> list = new ArrayList<parkVO>();
			
			this.DBOpen();
			
			String sql = "";
			
			sql  = "select park_no,park_exist,user_no,move_no,photo_no from park";
			this.RunQuery(sql);
			System.out.println(sql);
			while( this.GetNext() == true)
			{
				parkVO vo = new parkVO();
				vo.setPark_no(this.GetValue("park_no"));
				vo.setPark_exist(this.GetValue("park_exist"));
				vo.setUser_no(this.GetValue("user_no"));
				vo.setMove_no(this.GetValue("move_no"));
				vo.setPhoto_no(this.GetValue("photo_no"));
				
				list.add(vo);
			}		
			this.DBClose();
			
			return list;
		}
		//게시물 1개의 정보를 조회한다.
		public parkVO ParkRead(String no)
		{
			String sql = "";
			
			this.DBOpen();

			sql  = "select park_no,park_exist,user_no,photo_no ";
			sql += "from park where move_no = " + "'" + no + "'";
			this.RunQuery(sql);
			if( this.GetNext() == false)
			{
				//해당 게시물 없음.
				this.DBClose();
				return null;
			}
			parkVO vo = new parkVO();
			vo.setPark_no(this.GetValue("park_no"));
			vo.setPark_exist(this.GetValue("park_exist"));
			vo.setUser_no(this.GetValue("user_no"));
			vo.setPhoto_no(this.GetValue("photo_no"));
			vo.setMove_no(no);
			System.out.println(sql);
			this.DBClose();
			return vo;
		}
		
		public String ParkCount(String floor)
		{
			String sql = "";
			
			this.DBOpen();

			sql  = "select count(*) as count ";
			sql += "from park where (park_exist='full' and park_no like '" + floor + "%%')";
			this.RunQuery(sql);
			if( this.GetNext() == false)
			{
				//해당 게시물 없음.
				this.DBClose();
				return null;
			}
			System.out.println(sql);
			
			String count = this.GetValue("count");
			
			this.DBClose();
			return count;
		}
		
	
}
