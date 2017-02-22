package edu.spring.studyware.domain;

import java.util.Date;

public class MemberDTO {
	private int member_no;
	private String id;
	private String name;
	private String nick;
	private String phone;
	private String email;
	private String depth1;
	private String depth2;
	private String name_auth;
	private Date joindate;
	
	public MemberDTO(){}

	public MemberDTO(int member_no, String id, String name, String nick, String phone, String email, String depth1,
			String depth2, String name_auth, Date joindate) {
		this.member_no = member_no;
		this.id = id;
		this.name = name;
		this.nick = nick;
		this.phone = phone;
		this.email = email;
		this.depth1 = depth1;
		this.depth2 = depth2;
		this.name_auth = name_auth;
		this.joindate = joindate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public int getMember_no() {
		return member_no;
	}

	public String getDepth1() {
		return depth1;
	}

	public String getDepth2() {
		return depth2;
	}

	public String getName_auth() {
		return name_auth;
	}
	
	
	
	
}// end class
