package edu.spring.studyware.domain;

public class TestLevelVO {
	
	private int level_no;
	private String level_name;
	
	public TestLevelVO() {
		
	}
	
	public TestLevelVO(int level_no, String level_name) {
		this.level_no = level_no;
		this.level_name = level_name;
	}

	public int getLevel_no() {
		return level_no;
	}

	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}

	public String getLevel_name() {
		return level_name;
	}

	public void setLevel_name(String level_name) {
		this.level_name = level_name;
	}
	
	@Override
	public String toString() {
		return level_name;
	}

}
