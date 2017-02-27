package edu.spring.studyware.management.service;

import java.util.List;

import edu.spring.studyware.domain.MemberDTO;

public interface AdminService {

	public abstract List<MemberDTO> read();
	public abstract int updateAuth(int member_no, int member_auth_no);
}// end interface
