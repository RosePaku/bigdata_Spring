package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.BoardDto;
import com.java.dto.CommentDto;

@Mapper
public interface BoardMapper {

	//게시글 전체가져오기
	ArrayList<BoardDto> selectAll();

	//게시글 1개가져오기
	BoardDto selectOne(int bno);

	//하단댓글 전체가져오기
	ArrayList<CommentDto> selectComAll(int bno);

	//하단댓글 저장
	void commentInsert(CommentDto comDto);

	//하단댓글 1개가져오기
	CommentDto selectComOne(CommentDto comDto);

	//하단댓글 1개삭제
	void commentDelete(int cno);

	//하단댓글 수정저장
	void commentUpdateSave(CommentDto comDto);

}
