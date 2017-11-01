package com.holo.vo;

public class Criteria {
	private int page;
	private int perPageNum;

	public Criteria() {
		this.page = 1;
		this.perPageNum = 5;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 5; // 리스트당 데이터의 수
			return;
		}
		this.perPageNum = perPageNum;
	}

	// method ofr MyBatis SQL Mapper
	// limit 구문에서 시작위치 지정할 때 사용. (in MySQL)
	// ex)10개씩 출력 하는 경우 3페이지의 데이터는 20과 10
	public int getPageStart() {
		// 시작 데이터 번호 = (페이지번호 -1)*페이지당 보여지는 개수
		return (this.page - 1) * perPageNum;
	}

	public int getOraPerPageNum() {
		int pagenum;
		pagenum = this.perPageNum + getPageStart() + 1;
		return pagenum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
