package com.holo.vo;

import java.sql.Date;

public class NoteVO {
	private int note_idx;
	private String note_writer;
	private String note_receiver;
	private String note_content;
	private Date note_regdate;
	private int note_rec_num;
	
	
	public int getNote_idx() {
		return note_idx;
	}
	public void setNote_idx(int note_idx) {
		this.note_idx = note_idx;
	}
	public String getNote_writer() {
		return note_writer;
	}
	public void setNote_writer(String note_writer) {
		this.note_writer = note_writer;
	}
	public String getNote_receiver() {
		return note_receiver;
	}
	public void setNote_receiver(String note_receiver) {
		this.note_receiver = note_receiver;
	}
	public String getNote_content() {
		return note_content;
	}
	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}
	public Date getNote_regdate() {
		return note_regdate;
	}
	public void setNote_regdate(Date note_regdate) {
		this.note_regdate = note_regdate;
	}
	public int getNote_rec_num() {
		return note_rec_num;
	}
	public void setNote_rec_num(int note_rec_num) {
		this.note_rec_num = note_rec_num;
	}
	
	
}
