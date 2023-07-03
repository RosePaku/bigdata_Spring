package com.java.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.MemberDto;
import com.java.service.MemberService;

@Controller
public class MemberController {

	@Autowired MemberService memberService;
	@Autowired HttpSession session;
	
	@GetMapping("/member/login")
	public String login(String nowpage,Model model) {
		model.addAttribute("nowpage",nowpage);
		return "member/login";
	}
	
	@PostMapping("/member/login")
	public String login(MemberDto memberDto,Model model) {
		System.out.println("memberDto 1 : "+memberDto.getId());
		System.out.println("memberDto 2 : "+memberDto.getPw());
		MemberDto mdto = memberService.selectLogin(memberDto);
		if(mdto!=null) {
			session.setAttribute("sessionId", mdto.getId());
			session.setAttribute("sessionName", mdto.getName());
		}else {
			model.addAttribute("loginCheck","fail");
			return "/member/login";
		}
		
		return "redirect:/index?loginCheck=success";
	}
	
	@RequestMapping("/member/logout")
	public String logout() {
		session.invalidate(); //섹션 모두삭제
		return "redirect:/index";
	}
	
	
	
	
	
	
	
	
	
}
