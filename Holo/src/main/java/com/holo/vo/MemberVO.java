package com.holo.vo;

import java.util.List;

public class MemberVO {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_nickname;
	private int member_sex;
	private int member_level;
	private int member_count;
	private List<GuestBookVO> guestbook;
	
	public MemberVO(){
		super();
	}
	
	public MemberVO(String member_id, String member_pw, String member_name, String member_nickname, int member_sex,
			int member_level) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_nickname = member_nickname;
		this.member_sex = member_sex;
		this.member_level = member_level;
	}
	public MemberVO(String member_id, String member_nickname, int member_sex,
			int member_level, List<GuestBookVO> guestbook) {
		super();
		this.member_id = member_id;
		this.member_nickname = member_nickname;
		this.member_sex = member_sex;
		this.member_level = member_level;
		this.guestbook = guestbook;
	}

	public List<GuestBookVO> getGuestbook() {
		return guestbook;
	}

	public void setGuestbook(List<GuestBookVO> guestbook) {
		this.guestbook = guestbook;
	}

	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public int getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(int member_sex) {
		this.member_sex = member_sex;
	}
	public int getMember_level() {
		return member_level;
	}
	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}

	public int getMember_count() {
		return member_count;
	}

	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}
	
}
