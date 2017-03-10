package edu.spring.studyware.register.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.MemberVO;
import edu.spring.studyware.register.persistance.DirectOpenDAO;

@Service
public class DirectOpenServiceImpl implements DirectOpenService {
	
	@Autowired
	DirectOpenDAO directOpenDAO;

	@Override
	public MemberVO memberSearch(String id) {
		return directOpenDAO.memberSearch(id);
	}

}
