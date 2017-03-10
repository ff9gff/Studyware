package edu.spring.studyware.register.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.ApplyVO;
import edu.spring.studyware.domain.RecruitDTO;

public interface ProgressService {
	public abstract List<RecruitDTO> readRecruitList(int member_no);
	public abstract List<ApplyVO> readApplyList(int member_no);
}
