package edu.spring.studyware.domain;

public class MemberNickDTO {
	private int member_no;
	private String nick;
	
	public MemberNickDTO(){}

	public MemberNickDTO(int member_no, String nick) {
		this.member_no = member_no;
		this.nick = nick;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
	
	
}// end class
