package edu.spring.studyware.domain;

import java.util.Date;

public class msgVO {
	
	private int msg_no;
	private int se_member_no;
	private int re_member_no;
	private String content;
	private Date reg_date;
	private int state;
	private int se_del;
	private int re_del;
	
	public msgVO(){}
	
	public msgVO(int msg_no, int se_member_no, int re_member_no,String content, Date reg_date,
			int state, int se_del, int re_del) {
		this.msg_no = msg_no;
		this.se_member_no = se_member_no;
		this.re_member_no = re_member_no;
		this.content = content;
		this.reg_date = reg_date;
		this.state = state;
		this.se_del = se_del;
		this.re_del = re_del;
	}
	
	public msgVO(int se_member_no, int re_member_no, String content){
		this.se_member_no = se_member_no;
		this.re_member_no = re_member_no;
		this.content =content;
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

	public int getSe_del() {
		return se_del;
	}

	public void setSe_del(int se_del) {
		this.se_del = se_del;
	}

	public int getRe_del() {
		return re_del;
	}

	public void setRe_del(int re_del) {
		this.re_del = re_del;
	}
	
	
	
	
	
	
	
	
}// end class
