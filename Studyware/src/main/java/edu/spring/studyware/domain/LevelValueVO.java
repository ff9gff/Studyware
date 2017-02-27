package edu.spring.studyware.domain;

public class LevelValueVO {
	
	private int level_value_no;
	private String level1_value;
	private String level2_value;
	private String level3_value;
	private String level4_value;
	private String level5_value;
	
	public LevelValueVO() {
		
	}
	
	public LevelValueVO(String level1_value, String level2_value, String level3_value,
			String level4_value, String level5_value) {
		this.level1_value = level1_value;
		this.level2_value = level2_value;
		this.level3_value = level3_value;
		this.level4_value = level4_value;
		this.level5_value = level5_value;
	}

	public LevelValueVO(int level_value_no, String level1_value, String level2_value, String level3_value,
			String level4_value, String level5_value) {
		this.level_value_no = level_value_no;
		this.level1_value = level1_value;
		this.level2_value = level2_value;
		this.level3_value = level3_value;
		this.level4_value = level4_value;
		this.level5_value = level5_value;
	}

	public int getLevel_value_no() {
		return level_value_no;
	}

	public void setLevel_value_no(int level_value_no) {
		this.level_value_no = level_value_no;
	}

	public String getLevel1_value() {
		return level1_value;
	}

	public void setLevel1_value(String level1_value) {
		this.level1_value = level1_value;
	}

	public String getLevel2_value() {
		return level2_value;
	}

	public void setLevel2_value(String level2_value) {
		this.level2_value = level2_value;
	}

	public String getLevel3_value() {
		return level3_value;
	}

	public void setLevel3_value(String level3_value) {
		this.level3_value = level3_value;
	}

	public String getLevel4_value() {
		return level4_value;
	}

	public void setLevel4_value(String level4_value) {
		this.level4_value = level4_value;
	}

	public String getLevel5_value() {
		return level5_value;
	}

	public void setLevel5_value(String level5_value) {
		this.level5_value = level5_value;
	}

}
