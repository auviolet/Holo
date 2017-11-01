package com.holo.vo;

public class BlogVO {
	private int total;
	private String title;
	private String link;
	private String description;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
    public String toString() {
        return "Blog [total=" + total + ", title=" + title + ", link=" + link + ", description=" + description + "]";
    }
}
