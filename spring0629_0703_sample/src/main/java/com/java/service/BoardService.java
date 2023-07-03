package com.java.service;

import java.util.ArrayList;

import com.java.dto.BoardDto;
import com.java.dto.CommentDto;

public interface BoardService {

	//게시글 전체가져오기
	ArrayList<BoardDto> selectAll();

	//게시글 1개가져오기
	BoardDto selectOne(int bno);

	//하단댓글 전체가져오기
	ArrayList<CommentDto> selectComAll(int bno);

	//하단댓글 저장
	CommentDto commentInsert(CommentDto comDto);

	//하단댓글 1개삭제
	void commentDelete(int cno);

	//하단댓글 수정저장
	CommentDto commentUpdateSave(CommentDto comDto);

}
