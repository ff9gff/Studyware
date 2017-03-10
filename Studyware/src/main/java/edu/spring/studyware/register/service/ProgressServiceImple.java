package edu.spring.studyware.register.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.ApplyVO;
import edu.spring.studyware.domain.RecruitDTO;
import edu.spring.studyware.register.persistance.StudyCreateDAO;

@Service
public class ProgressServiceImple implements ProgressService {

	@Autowired
	private StudyCreateDAO studyCreateDAO;
	
	@Override
	public List<RecruitDTO> readRecruitList(int member_no) {
		return studyCreateDAO.selectRecruitProgress(member_no);
	}

	@Override
	public List<ApplyVO> readApplyList(int member_no) {
		return studyCreateDAO.selectApplyProgress(member_no);
	}

}
