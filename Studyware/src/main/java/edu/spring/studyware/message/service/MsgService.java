package edu.spring.studyware.message.service;

import java.util.List;
import java.util.Map;

import edu.spring.studyware.domain.msgVO;

public interface MsgService {

	public abstract int create(msgVO vo);
	public abstract List<msgVO> read(int member_no);
	public abstract int update(int msg_no);
	public abstract int delete(int msg_no);
	public abstract Map<Integer, String> readNick();
	
	
}// end interface
