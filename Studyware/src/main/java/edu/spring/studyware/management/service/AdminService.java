package edu.spring.studyware.management.service;

import java.util.List;

import edu.spring.studyware.domain.MemberDTO;

public interface AdminService {

	public abstract List<MemberDTO> read();
}// end interface
