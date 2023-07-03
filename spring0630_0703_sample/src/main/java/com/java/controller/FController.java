package com.java.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.BoardDto;

@Controller
public class FController {

	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping("/form2")
	public String form2() {
		return "form2";
	}
	
	@RequestMapping("/form3")
	public String form3() {
		return "form3";
	}
	
	@RequestMapping("/doForm2")
	public String doForm2(BoardDto boardDto,List<MultipartFile> files,Model model) 
			throws Exception {
		String fNames="";
		int i=0;
		for(MultipartFile file : files) {
			
			//파일저장 소스 start
			String fileName="";
			String ori_fileName = file.getOriginalFilename();
			if(i==0) fNames += ori_fileName;
			else fNames += ","+ori_fileName;
			
			UUID uuid = UUID.randomUUID();
			fileName = uuid+"_"+ori_fileName;
			String uploadUrl = "c:/upload/";
			File f = new File(uploadUrl+fileName); //임시파일등록
			file.transferTo(f); //파일저장
			//파일저장 소스 end
			i++;
		}
		System.out.println("FController fNames : "+fNames);   // 1.jpg,2.jpg,3.jpg
		String[] splitNames = fNames.split(",");
		boardDto.setBfile(fNames);
		boardDto.setBfiles(splitNames);
		
		model.addAttribute("bdto",boardDto);
		
		return "fileCheck2";
	}
	
	
	@RequestMapping("/form1")
	public String form1() {
		return "form1";
	}
	@RequestMapping("/doForm1")
	public String doForm1(BoardDto boardDto,@RequestPart MultipartFile files,
			Model model) throws Exception {
		
		//파일저장 소스 start
		String fileName="";
		if(!files.isEmpty()) {
			String ori_fileName = files.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			fileName = uuid+"_"+ori_fileName;
			String uploadUrl = "c:/upload/";
			File f = new File(uploadUrl+fileName); //임시파일등록
			files.transferTo(f); //파일저장
		}
		//파일저장 소스 end
		
		System.out.println("FController fileName : "+fileName);
		System.out.println("FController btitle : "+boardDto.getBtitle());
		
		model.addAttribute("fileName",fileName);
		model.addAttribute("btitle",boardDto.getBtitle());
		
		
		return "fileCheck";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
