package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.BoardDto;
import com.java.service.BoardService;

@Controller
public class FController {

	@Autowired
	BoardService boardService;

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	@RequestMapping("/notice")
	public String notice(Model model) {
		ArrayList<BoardDto> list = boardService.selectBoardAll();
		model.addAttribute("list", list);

		return "notice";
	}

	@RequestMapping("/noticeView")
	public String noticeView(int bno, Model model) {

		return "noticeView";
	}

}
