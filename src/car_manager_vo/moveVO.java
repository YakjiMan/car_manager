//입출차 내역 클래스
package car_manager_vo;

public class moveVO 
{
	private String move_no;        //입출관리번호(pk)
	private String move_time;      //입출 시간
	private String move_inout;     //입출차 구분
	private String user_no;        //회원번호(fk)
	private String move_car;       //입출차 번호
	private String move_ptime;     //주차시간
	
	//생성자
	public moveVO()
	{
		move_no    = "";
		move_time  = "";
		move_inout = "";
		user_no    = "";
		move_car   = "";
		move_ptime = "";
	}

	//getter
	public String getMove_no()    { return move_no;    }
	public String getMove_time()  { return move_time;  }
	public String getMove_inout() {	return move_inout; }
	public String getUser_no()    { return user_no;    }
	public String getMove_car()   { return move_car;   }
	public String getMove_ptime() { return move_ptime; }

	//setter
	public void setMove_no(String move_no)       { this.move_no    = move_no;    }
	public void setMove_time(String move_time)   { this.move_time  = move_time;  }
	public void setMove_inout(String move_inout) { this.move_inout = move_inout; }
	public void setUser_no(String user_no)       { this.user_no    = user_no;    }
	public void setMove_car(String move_car)     { this.move_car   = move_car;   }
	public void setMove_ptime(String move_ptime) { this.move_ptime = move_ptime; }
	
	
	
}
