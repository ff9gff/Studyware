package edu.spring.studyware.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.msgVO;
import edu.spring.studyware.message.persistance.MsgDAO;

@Service
public class MsgServiceImple implements MsgService {

	@Autowired
	private MsgDAO msgDAO;
	
	@Override
	public int create(msgVO vo) {
		return msgDAO.insert(vo);
	}

	@Override
	public List<msgVO> read(int member_no) {
		return msgDAO.select(member_no);
	}

	@Override
	public int update(int msg_no) {
		return msgDAO.update(msg_no);
	}

	@Override
	public int delete(int msg_no) {
		return msgDAO.delete(msg_no);
	}

}
