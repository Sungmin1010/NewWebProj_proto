package com.spring.example.vo;

public class UserVO {
	
	private int useq;
	private String nick;
	private String email;
	private String pwd;
	private int ustatus;
	public UserVO(int useq, String nick, String email, String pwd, int ustatus) {
		super();
		this.useq = useq;
		this.nick = nick;
		this.email = email;
		this.pwd = pwd;
		this.ustatus = ustatus;
	}
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getUseq() {
		return useq;
	}
	public void setUseq(int useq) {
		this.useq = useq;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getUstatus() {
		return ustatus;
	}
	public void setUstatus(int ustatus) {
		this.ustatus = ustatus;
	}
	@Override
	public String toString() {
		return "UerVO [useq=" + useq + ", nick=" + nick + ", email=" + email + ", pwd=" + pwd + ", ustatus=" + ustatus
				+ "]";
	}
	
	

}
