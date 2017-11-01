package com.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.holo.vo.GPAVO;
@Repository
public class DataResultDAO {
	@Autowired
	SqlSession session;
	
	public List<GPAVO> reviewGPARank() {
		List<GPAVO> list = null;
		try {
			String statement = "resource.ReviewMapper.selectReviewGPARank";
			list = session.selectList(statement);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<GPAVO> reviewGPA(int bistro_idx) {
		List<GPAVO> list = null;
		try {
			String statement = "resource.ReviewMapper.selectReviewGPA";
			list = session.selectList(statement, bistro_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
