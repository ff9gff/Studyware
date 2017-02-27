package edu.spring.studyware.domain;

public class RecruitTypeVO {
	private int recruit_type_no;
	private String name_recruit_type;
	
	public RecruitTypeVO() {
		
	}

	public RecruitTypeVO(int recruit_type_no, String name_recruit_type) {
		this.recruit_type_no = recruit_type_no;
		this.name_recruit_type = name_recruit_type;
	}

	public int getRecruit_type_no() {
		return recruit_type_no;
	}

	public void setRecruit_type_no(int recruit_type_no) {
		this.recruit_type_no = recruit_type_no;
	}

	public String getName_recruit_type() {
		return name_recruit_type;
	}

	public void setName_recruit_type(String name_recruit_type) {
		this.name_recruit_type = name_recruit_type;
	}
	
	@Override
	public String toString() {
		return name_recruit_type;
	}
	
	
	
	
}
