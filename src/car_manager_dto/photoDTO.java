package car_manager_dto;

import car_manager_vo.*;
import car_manager_dao.*;
import java.util.*;

public class photoDTO extends DBManager
{
	//사진찍힌 번호판의 입출차 내역를 불러온다
	public photoVO Read(String move_no)
	{
		this.DBOpen();
		
		String sql = "";

		sql  = "select photo_fname,photo_pname,photo_no ";
		sql += "from photo where move_no = " + move_no;
		this.RunQuery(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		photoVO vo = new photoVO();
		vo.setPhoto_no(this.GetValue("photo_no"));
		vo.setPhoto_fname(this.GetValue("photo_fname"));
		vo.setPhoto_pname(this.GetValue("photo_pname"));
		vo.setMove_no(move_no);
		
		this.DBClose();
		return vo;
	}
	
	public photoVO Read(String move_car,String move_no)
	{
		this.DBOpen();
		
		String sql = "";
		sql = "SELECT * FROM photo WHERE photo_fname LIKE '%" + move_car + "%'  and move_no = " + move_no + " limit 1 ";
		this.RunQuery(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		photoVO vo = new photoVO();
		vo.setPhoto_no(this.GetValue("photo_no"));
		vo.setPhoto_fname(this.GetValue("photo_fname"));
		vo.setPhoto_pname(this.GetValue("photo_pname"));
		vo.setMove_no(move_no);
		
		this.DBClose();
		return vo;
	}

	//사진을 등록
	public boolean Insert(photoVO vo)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql  = "insert into photo ";
		sql += "(photo_fname,photo_pname,move_no,user_no) ";
		sql += "values (";
		sql += "'" + vo.getPhoto_fname() + "',";
		sql += "'" + vo.getPhoto_pname() + "',";
		sql += "'" + vo.getMove_no() + "',";
		sql += "'" + vo.getUser_no() + "')";
		this.RunCommand(sql);
		
		this.DBClose();
		
 		return true;
	}
	
	//사진을 삭제
	public boolean Delete(String no)
	{
		this.DBOpen();
		
		String sql = "";
		sql = "delete from photo where photo_no=" + no;
		this.RunCommand(sql);
		
		return true;
	}
	
	//사진을 수정
	public boolean Update(photoVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update photo set ";
		sql += "photo_fname='" + vo.getPhoto_fname() + "',";
		sql += "photo_pname='" + vo.getPhoto_pname() + "',";
		sql += "move_no='" + vo.getMove_no() + "',";
		sql += "user_no='" + vo.getUser_no() + "' ";
		sql += "where photo_no=" + vo.getPhoto_no();
		
		this.RunCommand(sql);
		this.DBClose();
		
		return true;
	}
}
