package edu.spring.studyware.domain;

public class LevelVO {
	
	private int level_no;
	private int level_name_no;
	private int level_value_no;
	
	public LevelVO() {

	}

	public LevelVO(int level_name_no, int level_value_no) {
		this.level_name_no = level_name_no;
		this.level_value_no = level_value_no;
	}
	
	public LevelVO(int level_no, int level_name_no, int level_value_no) {
		this.level_no = level_no;
		this.level_name_no = level_name_no;
		this.level_value_no = level_value_no;
	}

	public int getLevel_no() {
		return level_no;
	}

	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}

	public int getLevel_name_no() {
		return level_name_no;
	}

	public void setLevel_name_no(int level_name_no) {
		this.level_name_no = level_name_no;
	}

	public int getLevel_value_no() {
		return level_value_no;
	}

	public void setLevel_value_no(int level_value_no) {
		this.level_value_no = level_value_no;
	}

}
