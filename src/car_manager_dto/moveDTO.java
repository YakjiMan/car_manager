package car_manager_dto;

import car_manager_vo.*;
import car_manager_dao.*;
import java.util.*;

public class moveDTO extends DBManager
{
	public moveVO Read(String no)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select move_no,move_time,move_inout,user_no,move_car ";
		sql += "from move where move_no = " + no;
		this.RunQuery(sql);
		System.out.println(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		moveVO vo = new moveVO();
		vo.setMove_car(this.GetValue("move_car"));
		vo.setMove_no(no);
		vo.setMove_inout(this.GetValue("move_inout"));
		vo.setMove_time(this.GetValue("move_time"));
		vo.setUser_no(this.GetValue("user_no"));
		
		this.DBClose();
		return vo;
	}
	//최근기록 읽어오기
	public moveVO LastRead()
	{
		this.DBOpen();
		
		String sql = "";
		
		sql = "select * from move order by move_no desc limit 1 ";
		this.RunQuery(sql);
		System.out.println(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		moveVO vo = new moveVO();
		vo.setMove_car(this.GetValue("move_car"));
		vo.setMove_no(this.GetValue("move_no"));
		vo.setMove_inout(this.GetValue("move_inout"));
		vo.setMove_time(this.GetValue("move_time"));
		vo.setMove_ptime(this.GetValue("move_ptime"));
		vo.setUser_no(this.GetValue("user_no"));
		
		this.DBClose();
		return vo;
	}
	
	//입차시 최신순
	public moveVO in_Read(String car)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql = "select * from move where (move_inout='in' and move_car='" + car + "') order by move_no desc limit 1 ";
		this.RunQuery(sql);
		System.out.println(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		moveVO vo = new moveVO();
		vo.setMove_car(car);
		vo.setMove_no(this.GetValue("move_no"));
		vo.setMove_inout(this.GetValue("move_inout"));
		vo.setMove_time(this.GetValue("move_time"));
		vo.setUser_no(this.GetValue("user_no"));
		
		this.DBClose();
		return vo;
	}
	
	//입차시 최신순2
	public moveVO in_Read()
	{
		this.DBOpen();
		
		String sql = "";
		
		sql = "select * from move where move_inout='in' order by move_no desc limit 1 ";
		this.RunQuery(sql);
		System.out.println(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		moveVO vo = new moveVO();
		vo.setMove_car(this.GetValue("move_car"));
		vo.setMove_no(this.GetValue("move_no"));
		vo.setMove_inout(this.GetValue("move_inout"));
		vo.setMove_time(this.GetValue("move_time"));
		vo.setUser_no(this.GetValue("user_no"));
		
		this.DBClose();
		return vo;
	}
	
	//출차시 최신순(번호)
	public moveVO out_Read(String car)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql = "select * from move where (move_inout='out' and move_car='" + car + "') order by move_no desc limit 1 ";
		this.RunQuery(sql);
		System.out.println(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		moveVO vo = new moveVO();
		vo.setMove_car(car);
		vo.setMove_no(this.GetValue("move_no"));
		vo.setMove_inout(this.GetValue("move_inout"));
		vo.setMove_time(this.GetValue("move_time"));
		vo.setUser_no(this.GetValue("user_no"));
		vo.setMove_ptime(this.GetValue("move_ptime"));
		
		this.DBClose();
		return vo;
	}
	
	//출차시 최신순(시간)
	public moveVO Read_out_time(String time)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql = "select * from move where (move_inout='out' and move_time='" + time + "') order by move_no desc limit 1 ";
		this.RunQuery(sql);
		System.out.println(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		moveVO vo = new moveVO();
		vo.setMove_car(time);
		vo.setMove_no(this.GetValue("move_no"));
		vo.setMove_inout(this.GetValue("move_inout"));
		vo.setMove_time(this.GetValue("move_car"));
		vo.setUser_no(this.GetValue("user_no"));
		vo.setMove_ptime(this.GetValue("move_ptime"));
		
		this.DBClose();
		return vo;
	}
	
	//출차시 최신순2
	public moveVO out_Read()
	{
		this.DBOpen();
		
		String sql = "";
		
		sql = "select * from move where move_inout='out' order by move_no desc limit 1 ";
		this.RunQuery(sql);
		System.out.println(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		moveVO vo = new moveVO();
		vo.setMove_car(this.GetValue("move_car"));
		vo.setMove_no(this.GetValue("move_no"));
		vo.setMove_inout(this.GetValue("move_inout"));
		vo.setMove_time(this.GetValue("move_time"));
		vo.setUser_no(this.GetValue("user_no"));
		vo.setMove_ptime(this.GetValue("move_ptime"));
		
		this.DBClose();
		return vo;
	}
		
	//입차 내역을 불러온다
	public ArrayList<moveVO> GetList()
	{
		ArrayList<moveVO> list = new ArrayList<moveVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select move_no,move_time,move_inout,user_no,move_car,move_ptime ";
		sql += "from move ";
		sql += "order by move_no desc ";
		System.out.println(sql);
		this.RunQuery(sql);
		while( this.GetNext() == true)
		{
			moveVO vo = new moveVO();
			vo.setMove_no(this.GetValue("move_no"));
			vo.setMove_time(this.GetValue("move_time"));
			vo.setMove_inout(this.GetValue("move_inout"));
			vo.setUser_no(this.GetValue("user_no"));
			vo.setMove_car(this.GetValue("move_car"));
			vo.setMove_ptime(this.GetValue("move_ptime"));
			
			list.add(vo);
		}		
		this.DBClose();
		list.forEach(System.out::println);
		return list;
	}
	
		
	//출차 내역을 불러온다
	public ArrayList<moveVO> Out_GetList()
	{
		ArrayList<moveVO> list = new ArrayList<moveVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select move_no,move_time,move_inout,user_no,move_car,move_ptime ";
		sql += "from move where move_inout = 'out' ";
		sql += "order by move_no desc ";
		System.out.println(sql);
		this.RunQuery(sql);
		while( this.GetNext() == true)
		{
			moveVO vo = new moveVO();
			vo.setMove_no(this.GetValue("move_no"));
			vo.setMove_time(this.GetValue("move_time"));
			vo.setMove_inout(this.GetValue("move_inout"));
			vo.setUser_no(this.GetValue("user_no"));
			vo.setMove_car(this.GetValue("move_car"));
			vo.setMove_ptime(this.GetValue("move_ptime"));
			
			list.add(vo);
		}		
		this.DBClose();
		list.forEach(System.out::println);
		return list;
	}
	
	//입차 내역을 불러온다(차번호)
	public ArrayList<moveVO> GetList_in(String move_car)
	{
		ArrayList<moveVO> list = new ArrayList<moveVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select move_no,move_time,move_inout,user_no,move_car,move_ptime ";
		sql += "from move where move_car = '" + move_car + "' and move_inout = 'in' ";
		sql += "order by move_no desc ";
		System.out.println(sql);
		this.RunQuery(sql);
		while( this.GetNext() == true)
		{
			moveVO vo = new moveVO();
			vo.setMove_no(this.GetValue("move_no"));
			vo.setMove_time(this.GetValue("move_time"));
			vo.setMove_inout(this.GetValue("move_inout"));
			vo.setUser_no(this.GetValue("user_no"));
			vo.setMove_car(this.GetValue("move_car"));
			vo.setMove_ptime(this.GetValue("move_ptime"));
			
			list.add(vo);
		}		
		this.DBClose();
		list.forEach(System.out::println);
		return list;
	}
	
	//출차 내역을 불러온다(차번호)
	public ArrayList<moveVO> GetList_out(String move_car)
	{
		ArrayList<moveVO> list = new ArrayList<moveVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select move_no,move_time,move_inout,user_no,move_car,move_ptime ";
		sql += "from move where move_car = '" + move_car + "' and move_inout = 'out' ";
		sql += "order by move_no desc ";
		System.out.println(sql);
		this.RunQuery(sql);
		while( this.GetNext() == true)
		{
			moveVO vo = new moveVO();
			vo.setMove_no(this.GetValue("move_no"));
			vo.setMove_time(this.GetValue("move_time"));
			vo.setMove_inout(this.GetValue("move_inout"));
			vo.setUser_no(this.GetValue("user_no"));
			vo.setMove_car(this.GetValue("move_car"));
			vo.setMove_ptime(this.GetValue("move_ptime"));
			
			list.add(vo);
		}		
		this.DBClose();
		list.forEach(System.out::println);
		return list;
	}
	
	//출차시 차번호의 갯수를 얻는다
		public int Get_count()
		{
			this.DBOpen();
			
			String sql = "";
			
			sql  = "select count(*) as total from move where move_inout = 'out' ";
			
			this.RunQuery(sql);
			this.GetNext();	
			int count = Integer.parseInt(this.GetValue("total"));
			
			this.DBClose();
			return count;
		}
	
	//출차시 차번호의 갯수를 얻는다(차번호)
	public int Get_count(String move_car)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total from move where move_car = '" + move_car + "' and move_inout = 'out' ";
		
		this.RunQuery(sql);
		this.GetNext();	
		int count = Integer.parseInt(this.GetValue("total"));
		
		this.DBClose();
		return count;
	}

	public boolean Insert(moveVO vo)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql  = "insert into move ";
		sql += "(move_car,move_inout,user_no) ";
		sql += "values (";
		sql += "'" + vo.getMove_car() + "',";
		sql += "'" + vo.getMove_inout() + "',";
		sql += "'" + vo.getUser_no() + "')";
		this.RunCommand(sql);
		System.out.println(sql);
		this.DBClose();
		
 		return true;
	}
	
	public boolean Delete(String no)
	{
		this.DBOpen();
		
		String sql = "";
		sql = "delete from move where move_no=" + no;
		this.RunCommand(sql);
		
		return true;
	}
	
	public boolean Update(moveVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update move set ";
		sql += "move_car='" + _R(vo.getMove_car()) + "',";
		sql += "move_inout='" + _R(vo.getMove_inout()) + "' ";
		sql += "where move_no=" + vo.getMove_no();
		
		this.RunCommand(sql);
		this.DBClose();
		
		return true;
	}
}
