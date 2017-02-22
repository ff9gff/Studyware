package edu.spring.studyware.message.controller;

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
	
	// 해야할것: insert, select, delete, update(상태)
	
	// 쪽지 보내기 - DB에 insert
	@RequestMapping(value = "/insertMsg", method = RequestMethod.POST)
	public String insertMsg(int msg_setter, int[] msg_getter, String msg_content, RedirectAttributes attr){
		logger.info("msg_setter ->"+msg_setter);
		
		int result = 0;
		for(int i=0; i<msg_getter.length; i++){
			msgVO vo = new msgVO(msg_setter, msg_getter[i], msg_content);
			result = msgService.create(vo);
		}
		
		logger.info("msg_content ->"+msg_content);
		
		if(result ==1){
			attr.addFlashAttribute("insert_result","success");
		}else{
			attr.addFlashAttribute("insert_result","fail");
		}
		
		return "redirect:msg";
		
	}// end insertMsg()
	
	// 쪽지를 보낸 후 결과값 리턴해주는 곳
	@RequestMapping(value = "/msg", method = RequestMethod.GET)
	public String popupMsg(){
		return "msg";
	}// end popupMsg
	
}// end MsgController
