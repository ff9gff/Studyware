package edu.spring.studyware.register.persistance;

import java.util.List;

import edu.spring.studyware.domain.LevelNameVO;
import edu.spring.studyware.domain.LevelValueVO;
import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.RecruitVO;

public interface StudyInfoDAO {

	// 1. recruit_no를 이용해서 recruit 정보를 가져오자
	public abstract RecruitVO recruitInfo(int recruit_no);

	// 2. recruit 내용 수정 1단계: 공부레벨/내용 수정하기 위해 name_no, value_no를 찾아온다.
	public abstract int selectLevelNameNO(int level_no);
	public abstract int selectLevelValueNO(int level_no);

	// 3. level_name, level_value를 수정한다.
	public abstract int updateLevelName(LevelNameVO levelNameVO);
	public abstract int updateLevelValue(LevelValueVO levelValueVO);

	// 4. 모집글 업데이트!
	public abstract int updateRecruit(RecruitVO recruitVO);
	
	// 5. level_no, level_name_no, level_value_no 이용해서 내용 삭제
	public abstract int deleteLevelName(int level_name_no);
	public abstract int deleteLevelValue(int level_value_no);
	public abstract int deleteLevel(int level_no);
	
	// 6. 모집글 삭제
	public abstract int deleteRecruit(int recruit_no);

}
