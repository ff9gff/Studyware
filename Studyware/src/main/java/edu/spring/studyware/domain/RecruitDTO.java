package edu.spring.studyware.domain;

import java.util.Date;

public class RecruitDTO {
	private String name_board;
	private int recruit_no;
	private String name_recruit_cate;
	private String name_recruit_type;
	private int member_no;
	private int num_now;
	private int num_max;
	private int region_no;
	private int level_np;
	private String recruit_title;
	private String recruit_content;
	private Date recruit_date;
	private Date reg_date;
	private int expire;
	private int hit;
	public RecruitDTO(String name_board, int recruit_no, String name_recruit_cate, String name_recruit_type,
			int member_no, int num_now, int num_max, int region_no, int level_np, String recruit_title,
			String recruit_content, Date recruit_date, Date reg_date, int expire, int hit) {
		super();
		this.name_board = name_board;
		this.recruit_no = recruit_no;
		this.name_recruit_cate = name_recruit_cate;
		this.name_recruit_type = name_recruit_type;
		this.member_no = member_no;
		this.num_now = num_now;
		this.num_max = num_max;
		this.region_no = region_no;
		this.level_np = level_np;
		this.recruit_title = recruit_title;
		this.recruit_content = recruit_content;
		this.recruit_date = recruit_date;
		this.reg_date = reg_date;
		this.expire = expire;
		this.hit = hit;
	}
	public String getName_board() {
		return name_board;
	}
	public void setName_board(String name_board) {
		this.name_board = name_board;
	}
	public int getRecruit_no() {
		return recruit_no;
	}
	public void setRecruit_no(int recruit_no) {
		this.recruit_no = recruit_no;
	}
	public String getName_recruit_cate() {
		return name_recruit_cate;
	}
	public void setName_recruit_cate(String name_recruit_cate) {
		this.name_recruit_cate = name_recruit_cate;
	}
	public String getName_recruit_type() {
		return name_recruit_type;
	}
	public void setName_recruit_type(String name_recruit_type) {
		this.name_recruit_type = name_recruit_type;
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
	public int getLevel_np() {
		return level_np;
	}
	public void setLevel_np(int level_np) {
		this.level_np = level_np;
	}
	public String getRecruit_title() {
		return recruit_title;
	}
	public void setRecruit_title(String recruit_title) {
		this.recruit_title = recruit_title;
	}
	public String getRecruit_content() {
		return recruit_content;
	}
	public void setRecruit_content(String recruit_content) {
		this.recruit_content = recruit_content;
	}
	public Date getRecruit_date() {
		return recruit_date;
	}
	public void setRecruit_date(Date recruit_date) {
		this.recruit_date = recruit_date;
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
	
	
}
