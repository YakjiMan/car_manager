//번호판 사진 정보 클래스
package car_manager_vo;

public class photoVO 
{
	private String photo_no;      //사진번호(pk)
	private String photo_fname;   //원본파일명
	private String photo_pname;   //변환파일명
	private String move_no;       //입출관리번호(fk)
	private String user_no;       //회원번호(fk)
	
	//생성자
	public photoVO()
	{
		photo_no    = "";
		photo_fname = "";
		photo_pname = "";
		move_no     = "";
		user_no     = "";
	}

	//getter
	public String getPhoto_no()    { return photo_no;    }
	public String getPhoto_fname() { return photo_fname; }
	public String getPhoto_pname() { return photo_pname; }
	public String getMove_no()     { return move_no;     }
	public String getUser_no()     { return user_no;     }

	//setter
	public void setPhoto_no(String photo_no)       { this.photo_no = photo_no;       }
	public void setPhoto_fname(String photo_fname) { this.photo_fname = photo_fname; }
	public void setPhoto_pname(String photo_pname) { this.photo_pname = photo_pname; }
	public void setMove_no(String move_no)         { this.move_no = move_no;         }
	public void setUser_no(String user_no)         { this.user_no = user_no;         }
	
	
	
	
}
