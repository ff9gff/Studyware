package edu.spring.studyware.management.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// ���� ������ �ҷ�����
	@RequestMapping(method = RequestMethod.GET)
	public String admin(){
		return "management/admin";
	}
	
	// ó�� ���� �˾�â�� ����
	@RequestMapping(value = "/msg", method = RequestMethod.POST)
	public String toggleMsg(int msg_setter, int[] msg_getter, Model model) {
		System.out.println("setter: " + msg_setter);
		System.out.println("getter: " + msg_getter);

		model.addAttribute("msg_setter", msg_setter);
		model.addAttribute("msg_getter", msg_getter);

		return "msg";
	}
	

}// end class AdminController
