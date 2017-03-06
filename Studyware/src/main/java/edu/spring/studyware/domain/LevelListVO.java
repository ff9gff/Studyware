package edu.spring.studyware.domain;

// 공부수준 테스트용 VO입니다.
// 테스트 후 삭제할 예정입니다.

public class LevelListVO {
	
	private int level_no;
	private String level_name;
	
	public LevelListVO() {
		
	}
	
	public LevelListVO(int level_no, String level_name) {
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
