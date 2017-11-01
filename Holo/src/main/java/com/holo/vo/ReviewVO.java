package com.holo.vo;

import java.sql.Date;

public class ReviewVO {
	private int review_idx;
	private int review_grade;
	private Date review_date;
	private String review_comment;
	private String member_id;
	private int bistro_idx;
	private String member_nickname;
	
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public int getBistro_idx() {
		return bistro_idx;
	}
	public void setBistro_idx(int bistro_idx) {
		this.bistro_idx = bistro_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public int getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getReview_comment() {
		return review_comment;
	}
	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}

	

}
