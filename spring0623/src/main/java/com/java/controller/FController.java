package com.java.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class FController {
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("/index")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	@RequestMapping("/logout")
	public String logout(Model model) {
		//섹션 전체삭제
		session.invalidate();
		model.addAttribute("logout",1);
		return "logoutCheck";
	}
	
	@RequestMapping("/doLogin")
	public String doLogin(String id,String pw,Model model) {
		System.out.println("id : "+id);
		System.out.println("pw : "+pw);
		//db검색
		if(id.equals("admin") && pw.equals("2222")) {
			//session설정
			//HttpServletRequest request;
			//HttpSession session = request.getSession();
			
			// @Autowired 객체받음
			session.setAttribute("sessionId", id);
			model.addAttribute("loginCheck",1);
		}else {
			model.addAttribute("loginCheck",0);
		}
		
		return "loginCheck";
	}//doLogin
	
	
	
	
	
	

}
