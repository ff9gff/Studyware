package edu.spring.studyware.management.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.studyware.domain.MemberDTO;
import edu.spring.studyware.management.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	
	// 어드민 페이지 불러오기
	@RequestMapping(method = RequestMethod.GET)
	public String admin(Model model){
		List<MemberDTO> list = adminService.read();
		model.addAttribute("memberList", list);
		
		return "management/admin";
	}
	
	// 쪽지보내기 처음 팝업 실행
	@RequestMapping(value = "/msg", method = RequestMethod.POST)
	public String toggleMsg(int msg_setter, int[] msg_getter, Model model) {
		System.out.println("setter: " + msg_setter);
		System.out.println("getter: " + msg_getter);

		model.addAttribute("msg_setter", msg_setter);
		model.addAttribute("msg_getter", msg_getter);

		return "msg";
	}
	

}// end class AdminController
