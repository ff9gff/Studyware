package edu.spring.studyware.domain;

import java.util.Date;

public class msgVO {
	
	private int msg_no;
	private int se_member_no;
	private int re_member_no;
	private String title;
	private String content;
	private Date reg_date;
	private int state;
	
	public msgVO(){}
	
	public msgVO(int msg_no, int se_member_no, int re_member_no, String title, String content, Date reg_date,
			int state) {
		this.msg_no = msg_no;
		this.se_member_no = se_member_no;
		this.re_member_no = re_member_no;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.state = state;
	}

	public int getMsg_no() {
		return msg_no;
	}

	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}

	public int getSe_member_no() {
		return se_member_no;
	}

	public void setSe_member_no(int se_member_no) {
		this.se_member_no = se_member_no;
	}

	public int getRe_member_no() {
		return re_member_no;
	}

	public void setRe_member_no(int re_member_no) {
		this.re_member_no = re_member_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	
	
	
	
	
}// end class
