package com.holo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.holo.vo.BistroCriteria;
import com.holo.vo.BistroVO;

@Repository
public class BistroDAO {
	@Autowired
	SqlSession session;
	
	public List<BistroVO> listAll() {
		List<BistroVO> list = null;
		try {
			String statement = "resource.BistroMapper.selectBistro";
			list = session.selectList(statement);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<BistroVO> search(String key) {
		List<BistroVO> list = null;
		try {
			String statement = "resource.BistroMapper.selectBistroSearch";
			list = session.selectList(statement, key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public BistroVO listOne(int bistro_idx) {
		BistroVO vo = null;
		String statement;
		try {
			statement = "resource.BistroMapper.selectBistroOne";
			vo = session.selectOne(statement, bistro_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int countBistros() {
		int count=0;
		try {
			String statement = "resource.BistroMapper.bistroCount";
			count = session.selectOne(statement);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	//寃��깋�뿉 �뵲瑜� �럹�씠吏� 泥섎━
		public List<BistroVO> listCriteria(BistroCriteria cri){
			
			List<BistroVO> list = new ArrayList<BistroVO>();
			try{
				String statement = "resource.BistroMapper.listCriteria";
				list = session.selectList(statement, cri);
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
		}
		public int countPaging(BistroCriteria cri) {
			int count=0;
			try {
				String statement = "resource.BistroMapper.countPaging";
				count = session.selectOne(statement, cri);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return count;
		}
}
