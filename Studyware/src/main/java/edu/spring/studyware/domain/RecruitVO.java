package edu.spring.studyware.domain;

import java.util.Date;

public class RecruitVO {
	private int board_name_no;
	private int recruit_no;
	private int recruit_cate_no;
	private int recruit_type_no;
	private int member_no;
	private int num_now;
	private int num_max;
	private int region_no;
	private int level_no;
	private String recruit_title;
	private String recruit_date;
	private String recruit_content;
	private Date reg_date;
	private int expire;
	private int hit;
	
	public RecruitVO() {
		
	}

	public RecruitVO(int board_name_no, int recruit_cate_no, int recruit_type_no, int member_no, int num_now,
			int num_max, int region_no, int level_no, String recruit_title, String recruit_date, String recruit_content,
			Date reg_date, int expire, int hit) {
		super();
		this.board_name_no = board_name_no;
		this.recruit_cate_no = recruit_cate_no;
		this.recruit_type_no = recruit_type_no;
		this.member_no = member_no;
		this.num_now = num_now;
		this.num_max = num_max;
		this.region_no = region_no;
		this.level_no = level_no;
		this.recruit_title = recruit_title;
		this.recruit_date = recruit_date;
		this.recruit_content = recruit_content;
		this.reg_date = reg_date;
		this.expire = expire;
		this.hit = hit;
	}

	public RecruitVO(int board_name_no, int recruit_no, int recruit_cate_no, int recruit_type_no, int member_no,
			int num_now, int num_max, int region_no, int level_no, String recruit_title, String recruit_date,
			String recruit_content, Date reg_date, int expire, int hit) {
		super();
		this.board_name_no = board_name_no;
		this.recruit_no = recruit_no;
		this.recruit_cate_no = recruit_cate_no;
		this.recruit_type_no = recruit_type_no;
		this.member_no = member_no;
		this.num_now = num_now;
		this.num_max = num_max;
		this.region_no = region_no;
		this.level_no = level_no;
		this.recruit_title = recruit_title;
		this.recruit_date = recruit_date;
		this.recruit_content = recruit_content;
		this.reg_date = reg_date;
		this.expire = expire;
		this.hit = hit;
	}

	public int getBoard_name_no() {
		return board_name_no;
	}

	public void setBoard_name_no(int board_name_no) {
		this.board_name_no = board_name_no;
	}

	public int getRecruit_no() {
		return recruit_no;
	}

	public void setRecruit_no(int recruit_no) {
		this.recruit_no = recruit_no;
	}

	public int getRecruit_cate_no() {
		return recruit_cate_no;
	}

	public void setRecruit_cate_no(int recruit_cate_no) {
		this.recruit_cate_no = recruit_cate_no;
	}

	public int getRecruit_type_no() {
		return recruit_type_no;
	}

	public void setRecruit_type_no(int recruit_type_no) {
		this.recruit_type_no = recruit_type_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getNum_now() {
		return num_now;
	}

	public void setNum_now(int num_now) {
		this.num_now = num_now;
	}

	public int getNum_max() {
		return num_max;
	}

	public void setNum_max(int num_max) {
		this.num_max = num_max;
	}

	public int getRegion_no() {
		return region_no;
	}

	public void setRegion_no(int region_no) {
		this.region_no = region_no;
	}

	public int getLevel_no() {
		return level_no;
	}

	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}

	public String getRecruit_title() {
		return recruit_title;
	}

	public void setRecruit_title(String recruit_title) {
		this.recruit_title = recruit_title;
	}

	public String getRecruit_date() {
		return recruit_date;
	}

	public void setRecruit_date(String recruit_date) {
		this.recruit_date = recruit_date;
	}

	public String getRecruit_content() {
		return recruit_content;
	}

	public void setRecruit_content(String recruit_content) {
		this.recruit_content = recruit_content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getExpire() {
		return expire;
	}

	public void setExpire(int expire) {
		this.expire = expire;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return recruit_title;
	}

}
