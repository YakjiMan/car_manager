//주차장 관리 클래스
package car_manager_vo;

public class parkVO 
{
	private String park_no;       //자리번호(pk)
	private String park_exist;    //주차여부
	private String user_no;       //회원번호(fk)
	private String move_no;       //입출관리번호(fk)
	private String photo_no;      //사진번호(fk)
	private String total;  //전체 갯수
	
	//생성자
	public parkVO()
	{
		park_no    = "";
		park_exist = "";
		user_no    = "";
		move_no    = "";
		photo_no   = "";
		total      = "";
	}

	//getter
	public String getPark_no()    { return park_no;    }
	public String getPark_exist() { return park_exist; }
	public String getUser_no()    { return user_no;    }
	public String getMove_no()    { return move_no;    }
	public String getPhoto_no()   { return photo_no;   }
	public String getTotal()	  { return total;      }
	
	//setter
	public void setPark_no(String park_no)       { this.park_no    = park_no;    }
	public void setPark_exist(String park_exist) { this.park_exist = park_exist; }
	public void setUser_no(String user_no)       { this.user_no    = user_no;    }
	public void setMove_no(String move_no)       { this.move_no    = move_no;    }
	public void setPhoto_no(String photo_no)     { this.photo_no   = photo_no;   }
	public void setTotal(String total)     		 { this.total      = total;      }
	
}
