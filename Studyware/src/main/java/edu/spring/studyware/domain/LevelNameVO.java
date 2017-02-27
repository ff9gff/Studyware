package edu.spring.studyware.domain;

public class LevelNameVO {
	
	private int level_name_no;
	private String level1_name;
	private String level2_name;
	private String level3_name;
	private String level4_name;
	private String level5_name;
	
	public LevelNameVO() {

	}
	
	public LevelNameVO(String level1_name, String level2_name, String level3_name,
			String level4_name, String level5_name) {
		this.level1_name = level1_name;
		this.level2_name = level2_name;
		this.level3_name = level3_name;
		this.level4_name = level4_name;
		this.level5_name = level5_name;
	}

	public LevelNameVO(int level_name_no, String level1_name, String level2_name, String level3_name,
			String level4_name, String level5_name) {
		this.level_name_no = level_name_no;
		this.level1_name = level1_name;
		this.level2_name = level2_name;
		this.level3_name = level3_name;
		this.level4_name = level4_name;
		this.level5_name = level5_name;
	}

	public int getLevel_name_no() {
		return level_name_no;
	}

	public void setLevel_name_no(int level_name_no) {
		this.level_name_no = level_name_no;
	}

	public String getLevel1_name() {
		return level1_name;
	}

	public void setLevel1_name(String level1_name) {
		this.level1_name = level1_name;
	}

	public String getLevel2_name() {
		return level2_name;
	}

	public void setLevel2_name(String level2_name) {
		this.level2_name = level2_name;
	}

	public String getLevel3_name() {
		return level3_name;
	}

	public void setLevel3_name(String level3_name) {
		this.level3_name = level3_name;
	}

	public String getLevel4_name() {
		return level4_name;
	}

	public void setLevel4_name(String level4_name) {
		this.level4_name = level4_name;
	}

	public String getLevel5_name() {
		return level5_name;
	}

	public void setLevel5_name(String level5_name) {
		this.level5_name = level5_name;
	}

}
