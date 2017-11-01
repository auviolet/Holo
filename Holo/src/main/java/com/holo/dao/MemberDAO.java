package com.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.holo.vo.MemberVO;
@Repository
public class MemberDAO {
	@Autowired
	SqlSession session;
	
	public MemberVO login(MemberVO vo) {
		MemberVO result = null;
		try {
			String statement = "resource.MemberMapper.selectMember";
			result = session.selectOne(statement, vo);		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean join(MemberVO vo) {
		boolean flag = false;
		try {
			String statement = "resource.MemberMapper.joinMember";
			session.insert(statement, vo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}	
	

	public MemberVO checkAccount(String account) {
		MemberVO vo = null;
		String statement;
		try {
			statement = "resource.MemberMapper.selectMemberOne";
			vo = session.selectOne(statement, account);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public MemberVO memberInfo(String mId_mNickname){
		MemberVO vo = null;
		
		try{
			String statement = "resource.MemberMapper.selectMemberInfo";
			vo = session.selectOne(statement, mId_mNickname);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
		
	}
	
	public List<MemberVO> memberLevel(){
		List<MemberVO> mlist= null;
		
		try{
			String statement="resource.MemberMapper.selectMemberLevel";
			mlist = session.selectOne(statement);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mlist;	
	}
	public int countMembers(){
		int count=0;
		
		try{
			String statement = "resource.MemberMapper.memberCount";
			count = session.selectOne(statement);			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
}
