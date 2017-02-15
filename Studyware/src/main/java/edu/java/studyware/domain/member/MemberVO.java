package edu.java.studyware.domain.member;

import java.util.Date;

public class MemberVO {
	private int member_no;
	private String id;
	private String pwd;
	private String name;
	private String nick;
	private String phone;
	private String email;
	private int region_no;
	private int member_auth_no;
	private Date joindate;
	
	public MemberVO() {

	}
	
	public MemberVO(int member_no, String id, String pwd, String name, String nick, String phone, String email,
			int region_no, int member_auth_no, Date joindate) {
		super();
		this.member_no = member_no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nick = nick;
		this.phone = phone;
		this.email = email;
		this.region_no = region_no;
		this.member_auth_no = member_auth_no;
		this.joindate = joindate;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRegion_no() {
		return region_no;
	}

	public void setRegion_no(int region_no) {
		this.region_no = region_no;
	}

	public int getMember_auth_no() {
		return member_auth_no;
	}

	public void setMember_auth_no(int member_auth_no) {
		this.member_auth_no = member_auth_no;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	
}
