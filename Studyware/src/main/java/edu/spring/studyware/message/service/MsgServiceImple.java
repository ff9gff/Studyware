package edu.spring.studyware.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.MemberNickDTO;
import edu.spring.studyware.domain.msgVO;
import edu.spring.studyware.member.persistance.MemberDAO;
import edu.spring.studyware.message.persistance.MsgDAO;

@Service
public class MsgServiceImple implements MsgService {

	@Autowired
	private MsgDAO msgDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int create(msgVO vo) {
		return msgDAO.insert(vo);
	}

	@Override
	public List<msgVO> read(int member_no) {
		return msgDAO.select(member_no);
	}

	@Override
	public msgVO readRow(int msg_no) {
		return msgDAO.selectRow(msg_no);
	}
	
	@Override
	public int updateState(int msg_no) {
		return msgDAO.updateState(msg_no);
	}

	
	@Override
	public int delete(String member, int msg_no) {
		msgVO vo = msgDAO.selectRow(msg_no);
		
		if(member.equals("setter")){
			if(vo.getRe_del()==1){
				return msgDAO.delete(msg_no);
			}else{
				return msgDAO.deleteSe(msg_no);
			}
		}else{
			if(vo.getSe_del()==1){
				return msgDAO.delete(msg_no);
			}else{
				return msgDAO.deleteRe(msg_no);
			}
		}
	}
	
	@Override
	public Map<Integer, String> readNick() {
		List<MemberNickDTO> list = memberDAO.selectNicklist();
		Map<Integer, String> map = new HashMap<Integer, String>();
		
		for(int i = 0; i<list.size(); i++){
			map.put(new Integer(list.get(i).getMember_no()),
					list.get(i).getNick());
		}
		
		return map;
	}

}
