package com.holo.vo;

import java.sql.Date;

public class GuestBookVO {
	private int guestbook_idx;
	private String guestbook_subject;
	private String guestbook_content;
	private Date guestbook_regdate;
	private int guestbook_count;
	private int guestbook_hit;
	private String guestbook_writer;
	private String member_id;
	private int member_sex;
	private int member_level;
	
	public int getGuestbook_idx() {
		return guestbook_idx;
	}
	public void setGuestbook_idx(int guestbook_idx) {
		this.guestbook_idx = guestbook_idx;
	}
	public String getGuestbook_subject() {
		return guestbook_subject;
	}
	public void setGuestbook_subject(String guestbook_subject) {
		this.guestbook_subject = guestbook_subject;
	}
	public String getGuestbook_content() {
		return guestbook_content;
	}
	public void setGuestbook_content(String guestbook_content) {
		this.guestbook_content = guestbook_content;
	}
	public Date getGuestbook_regdate() {
		return guestbook_regdate;
	}
	public void setGuestbook_regdate(Date guestbook_regdate) {
		this.guestbook_regdate = guestbook_regdate;
	}
	public int getGuestbook_count() {
		return guestbook_count;
	}
	public void setGuestbook_count(int guestbook_count) {
		this.guestbook_count = guestbook_count;
	}
	public int getGuestbook_hit() {
		return guestbook_hit;
	}
	public void setGuestbook_hit(int guestbook_hit) {
		this.guestbook_hit = guestbook_hit;
	}
	public String getGuestbook_writer() {
		return guestbook_writer;
	}
	public void setGuestbook_writer(String guestbook_writer) {
		this.guestbook_writer = guestbook_writer;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	
}
