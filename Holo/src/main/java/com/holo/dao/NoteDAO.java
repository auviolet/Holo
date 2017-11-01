package com.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.holo.vo.NoteVO;

@Repository
public class NoteDAO {
	
	@Autowired
	SqlSession session;
	
	public List<NoteVO> listAll(){
		List<NoteVO> list = null;
		
		try{
			String statement = "resource.NoteMapper.selectAllNote";
			list = session.selectList(statement);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public List<NoteVO> listReceiver(String note_receiver){
		List<NoteVO> list = null;
		
		System.out.println(note_receiver);
		try{
			String statement = "resource.NoteMapper.selectReceiverNote";
			list = session.selectList(statement, note_receiver);
		} catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean insert(NoteVO nvo) {
		boolean flag = false;
		try {
			String statement = "resource.NoteMapper.insertNote";
			session.insert(statement, nvo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
