package edu.spring.studyware.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.studyware.domain.msgVO;
import edu.spring.studyware.message.service.MsgService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MsgController {

	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);

	@Autowired
	private MsgService msgService;
	
	// �ؾ��Ұ�: insert, select, delete, update(����)
	
	// ���� ������ - DB�� insert
	@RequestMapping(value = "/insertMsg", method = RequestMethod.POST)
	public String insertMsg(int msg_setter, int[] msg_getter, String msg_content, RedirectAttributes attr){

		int result = 0;
		for(int i=0; i<msg_getter.length; i++){
			msgVO vo = new msgVO(msg_setter, msg_getter[i], msg_content);
			result = msgService.create(vo);
		}

		if(result ==1){
			attr.addFlashAttribute("insert_result","success");
		}else{
			attr.addFlashAttribute("insert_result","fail");
		}
		
		return "redirect:msg";
		
	}// end insertMsg()
	
	// ������ ���� �� ����� �������ִ� ��
	@RequestMapping(value = "/msg", method = RequestMethod.GET)
	public String popupMsg(){
		return "msg";
	}// end popupMsg
	
	// 쪽지함 불러오기
	@RequestMapping(value="/msgbox", method = RequestMethod.GET)
	public String msg(int member_no, Model model){
		List<msgVO> list = msgService.read(member_no);
		Map<Integer, String> map = msgService.readNick();
		
		model.addAttribute("msgList", list);
		model.addAttribute("nickMap", map);
		
		return "mypage/msg_box";
	}
}// end MsgController
