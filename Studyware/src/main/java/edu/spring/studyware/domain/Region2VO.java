package edu.spring.studyware.domain;

public class Region2VO {
	private int region_no;
	private String depth1;
	private String depth2;
	
	public Region2VO() {
		
	}
	
	public Region2VO (int region_no, String depth1, String depth2) {
		this.region_no = region_no;
		this.depth1 = depth1;
		this.depth2 = depth2;
	}

	public int getRegion_no() {
		return region_no;
	}

	public void setRegion_no(int region_no) {
		this.region_no = region_no;
	}

	public String getDepth1() {
		return depth1;
	}

	public void setDepth1(String depth1) {
		this.depth1 = depth1;
	}

	public String getDepth2() {
		return depth2;
	}

	public void setDepth2(String depth2) {
		this.depth2 = depth2;
	}
	 
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return depth2;
	}
}
