package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {
	
	private String id,pw,name,phone,gender;
	private String[] hobbys;
	private String hobby;

}
