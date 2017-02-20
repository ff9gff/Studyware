package edu.spring.studyware.domain;

public class MemberAuthVO {
	private int member_auth_no;
	private String name;
	
	public MemberAuthVO() {
		
	}
	
	public MemberAuthVO(int member_auth_no, String name) {
		this.member_auth_no = member_auth_no;
		this.name = name;
	}

	public int getMember_auth_no() {
		return member_auth_no;
	}

	public void setMember_auth_no(int member_auth_no) {
		this.member_auth_no = member_auth_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
