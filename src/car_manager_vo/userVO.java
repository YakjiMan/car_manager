//ȸ������ Ŭ����
package car_manager_vo;

public class userVO 
{
	private String user_no;       //ȸ�� ��ȣ(pK)
	private String user_name;     //ȸ�� �̸�
	private String user_phone;    //ȸ�� ��ȭ��ȣ
	private String user_car;      //ȸ�� ����ȣ
	private String user_date;     //ȸ����� ��¥
	private String user_point;    //ȸ�� �ܿ�����Ʈ
	private String user_mail;     //ȸ�������ּ�
	private String user_id;       //ȸ�� ���̵�
	private String user_pw;       //ȸ�� ��й�ȣ
	
	//������
	public userVO()
	{
		user_no    = "";
		user_name  = "";
		user_phone = "";
		user_car   = "";
		user_date  = "";
		user_point = "";
		user_mail  = "";
		user_id    = "";
		user_pw    = "";
	}

	//getter
	public String getUser_no()    { return user_no;    }
	public String getUser_name()  { return user_name;  }
	public String getUser_phone() { return user_phone; }
	public String getUser_car()   { return user_car;   }
	public String getUser_date()  { return user_date;  }
	public String getUser_point() { return user_point; }
	public String getUser_mail()  { return user_mail;  }
	public String getUser_id()    { return user_id;    }
	public String getUser_pw()    { return user_pw;    }

	
	//setter
	public void setUser_no(String user_no)       { this.user_no    = user_no;     }
	public void setUser_name(String user_name)   { this.user_name  = user_name;   }
	public void setUser_phone(String user_phone) { this.user_phone = user_phone;  }
	public void setUser_car(String user_car)     { this.user_car   = user_car;    }
	public void setUser_date(String user_date)   { this.user_date  = user_date;   }
	public void setUser_point(String user_point) { this.user_point = user_point;  }
	public void setUser_mail(String user_mail)   { this.user_mail  = user_mail;   }
	public void setUser_id(String user_id)       { this.user_id    = user_id;     }
	public void setUser_pw(String user_pw)       { this.user_pw    = user_pw;     }
	
}