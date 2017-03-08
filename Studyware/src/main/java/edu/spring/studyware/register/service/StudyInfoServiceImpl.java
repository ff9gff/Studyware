package edu.spring.studyware.register.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.LevelNameVO;
import edu.spring.studyware.domain.LevelValueVO;
import edu.spring.studyware.domain.RecruitVO;
import edu.spring.studyware.register.persistance.StudyInfoDAO;

@Service
public class StudyInfoServiceImpl implements StudyInfoService {
	
	@Autowired
	private StudyInfoDAO studyInfoDAO;

	@Override
	public RecruitVO recruitInfo(int recruit_no) {
		return studyInfoDAO.recruitInfo(recruit_no);
	}

	@Override
	public int selectLevelNameNO(int level_no) {
		return studyInfoDAO.selectLevelNameNO(level_no);
	}
	@Override
	public int selectLevelValueNO(int level_no) {
		return studyInfoDAO.selectLevelValueNO(level_no);
	}

	@Override
	public int updateLevelName(LevelNameVO levelNameVO) {
		return studyInfoDAO.updateLevelName(levelNameVO);
	}
	@Override
	public int updateLevelValue(LevelValueVO levelValueVO) {
		return studyInfoDAO.updateLevelValue(levelValueVO);
	}

	@Override
	public int updateRecruit(RecruitVO recruitVO) {
		return studyInfoDAO.updateRecruit(recruitVO);
	}

	@Override
	public int deleteLevelName(int level_name_no) {
		return studyInfoDAO.deleteLevelName(level_name_no);
	}

	@Override
	public int deleteLevelValue(int level_value_no) {
		return studyInfoDAO.deleteLevelValue(level_value_no);
	}

	@Override
	public int deleteLevel(int level_no) {
		return studyInfoDAO.deleteLevel(level_no);
	}

	@Override
	public int deleteRecruit(int recruit_no) {
		return studyInfoDAO.deleteRecruit(recruit_no);
	}

}
