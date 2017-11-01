package com.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.holo.vo.Criteria;
import com.holo.vo.GuestBookVO;

@Repository
public class GuestBookDAO {

	@Autowired
	SqlSession session;

	public List<GuestBookVO> listAll() {
		List<GuestBookVO> list = null;

		try {
			String statement = "resource.GuestBookMapper.selectGuestBook";
			list = session.selectList(statement);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<GuestBookVO> myPageGuestBooklist(String member_nickname){
		List<GuestBookVO> list = null;

		try {
			String statement = "resource.GuestBookMapper.selectGuestBookMember";
			list = session.selectList(statement, member_nickname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean insert(GuestBookVO vo) {
		boolean flag = false;
		try {
			String statement = "resource.GuestBookMapper.insertGuestBook";
			session.insert(statement, vo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(GuestBookVO vo) {
		boolean flag = false;
		
		try{
			String statement = "resource.GuestBookMapper.updateGuestBook";
			session.update(statement, vo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public int delete(int guestbook_idx) {
		int deleteNum = 0;

		try {
			String statement = "resource.GuestBookMapper.deleteGuestBook";
			deleteNum = session.delete(statement, guestbook_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deleteNum;
	}

	public String regdate(int guestbook_idx) {
		String regdateStr = null;

		try {
			String statement = "resource.GuestBookMapper.guestBookDateFormat";
			regdateStr = session.selectOne(statement);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return regdateStr;
	}

	public List<GuestBookVO> listCriteria(Criteria cri) throws Exception {
		List<GuestBookVO> list = null;

		System.out.println("PageStart:" + cri.getPageStart());
		try {
			String statement = "resource.GuestBookMapper.guestBooklistCriteria";
			list = session.selectList(statement, cri);
			System.out.println("++++++++++++++++++++DAO의 listCriteria  "+list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public int countGuestbooks(){
		int count =0;
		
		try{
			String statement = "resource.GuestBookMapper.guestbookCount";
			count = session.selectOne(statement);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int myPageGuestbooksCount(int member_nickname){
		int count =0;
		
		try{
			String statement = "resource.GuestBookMapper.myPageGuestBookInfo";
			count = session.selectOne(statement);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int countPaging(Criteria cri){
	int totalcnt =0;
		
		try{
			String statement = "resource.GuestBookMapper.countPaging";
			totalcnt = session.selectOne(statement, cri);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return totalcnt;
	}
}
