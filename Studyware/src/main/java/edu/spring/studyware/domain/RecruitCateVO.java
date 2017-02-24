package edu.spring.studyware.domain;

public class RecruitCateVO {
	private int recruit_cate_no;
	private String name_recruit_cate;
	
	public RecruitCateVO() {
		
	}
	
	public RecruitCateVO(int recruit_cate_no, String name_recruit_cate) {
		this.recruit_cate_no = recruit_cate_no;
		this.name_recruit_cate = name_recruit_cate;
	}

	public int getRecruit_cate_no() {
		return recruit_cate_no;
	}

	public void setRecruit_cate_no(int recruit_cate_no) {
		this.recruit_cate_no = recruit_cate_no;
	}

	public String getName_recruit_cate() {
		return name_recruit_cate;
	}

	public void setName_recruit_cate(String name_recruit_cate) {
		this.name_recruit_cate = name_recruit_cate;
	}
	
	@Override
	public String toString() {
		return name_recruit_cate;
	}
	
	
}
