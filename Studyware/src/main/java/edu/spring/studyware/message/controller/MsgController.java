package edu.spring.studyware.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	// 쪽지보내기 처음 팝업 실행
	@RequestMapping(value = "/popupMsg", method = RequestMethod.POST)
	public String toggleMsg(int msg_setter, int[] msg_getter, Model model) {
		model.addAttribute("msg_setter", msg_setter);
		model.addAttribute("msg_getter", msg_getter);

		return "msg";
	}
	
	// 쪽지보내기 - DB insert
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
		model.addAttribute("my_no", member_no);
		
		
		return "mypage/msg_box";
	}
	
	// 쪽지 삭제하기
	@RequestMapping(value="/deleteMsg", method=RequestMethod.POST)
	public String delteMsg(int delete_member_no, String delete_member, int[] delete_msg_no, RedirectAttributes attr){

		int result = 0;
		for(int i=0; i<delete_msg_no.length; i++){
			result = msgService.delete(delete_member, delete_msg_no[i]);
		}

		if(result ==1){
			attr.addFlashAttribute("delete_result","success");
		}else{
			attr.addFlashAttribute("delete_result","fail");
		}
		
		return "redirect:msgbox?member_no=" + delete_member_no;
	}
	
	// 쪽지보기
	@RequestMapping(value="/readMsg", method=RequestMethod.POST)
	public String readMsg(int read_msg_no, String read_type, Model model){
		
		msgVO vo = msgService.readRow(read_msg_no);
		
		if(vo.getState() == 0){
			msgService.updateState(read_msg_no);
		}
		
		model.addAttribute("msgVO", vo);
		model.addAttribute("readType", read_type);

		return "msg_re";
	}

}// end MsgController
