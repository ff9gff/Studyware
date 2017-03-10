package edu.spring.studyware.domain;

import java.util.Date;

public class ApplyVO {
	private int recruit_no;
	private int apply_no;
	private int member_no;
	private int level_no;
	private String content;
	private Date reg_date;
	private int agree;
	
	public ApplyVO(){}
	
	public ApplyVO(int recruit_no, int apply_no, int member_no, int level_no, String content, Date reg_date,
			int agree) {
		super();
		this.recruit_no = recruit_no;
		this.apply_no = apply_no;
		this.member_no = member_no;
		this.level_no = level_no;
		this.content = content;
		this.reg_date = reg_date;
		this.agree = agree;
	}
	public int getRecruit_no() {
		return recruit_no;
	}
	public void setRecruit_no(int recruit_no) {
		this.recruit_no = recruit_no;
	}
	public int getApply_no() {
		return apply_no;
	}
	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getLevel_no() {
		return level_no;
	}
	public void setLevel_no(int level_no) {
		this.level_no = level_no;
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
	public int getAgree() {
		return agree;
	}
	public void setAgree(int agree) {
		this.agree = agree;
	}
	
	
}
