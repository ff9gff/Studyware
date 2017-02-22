package edu.spring.studyware.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.MemberDTO;
import edu.spring.studyware.member.persistance.MemberDAO;

@Service
public class AdminServiceImple implements AdminService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<MemberDTO> read() {
		return memberDAO.selectList();
	}

}
