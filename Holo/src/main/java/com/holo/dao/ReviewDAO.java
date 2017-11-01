package com.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.holo.vo.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	SqlSession session;
	

	public List<ReviewVO> listReview(int review_idx) {
		List<ReviewVO> list = null;
		try {
			String statement = "resource.ReviewMapper.selectReview";
			list = session.selectList(statement, review_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ReviewVO> listReview(String member_nickname) {
		List<ReviewVO> list = null;
		try {
			String statement = "resource.ReviewMapper.selectReviewMember";
			list = session.selectList(statement, member_nickname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public boolean reviewInsert(ReviewVO vo) {
		boolean flag = false;
		try {
			String statement = "resource.ReviewMapper.insertReview";
			session.insert(statement, vo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return flag;
	}
	public int reviewDelete(int review_idx) {
		int deleteNum = 0;
		try {
			String statement = "resource.ReviewMapper.deleteReview";
			deleteNum = session.delete(statement, review_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deleteNum;
	}	
}
