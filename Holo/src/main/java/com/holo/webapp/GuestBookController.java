package com.holo.webapp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.holo.dao.GuestBookDAO;
import com.holo.dao.MemberDAO;
import com.holo.vo.Criteria;
import com.holo.vo.GuestBookVO;
import com.holo.vo.PageMaker;

@Controller
public class GuestBookController {
	
	@Autowired
	MemberDAO mDao;
	
	@Autowired
	GuestBookDAO gbDao;
	
	@Autowired
	HttpSession session;

	List<GuestBookVO> list;
	
	@RequestMapping("/guestbookList.do")
	public ModelAndView guestBookList(@ModelAttribute("cri")Criteria cri) throws Exception{
		ModelAndView mav = new ModelAndView();
			
		list = gbDao.listCriteria(cri);
	
		List<GuestBookVO> list= gbDao.listAll();
		
		
		if(list.size() !=0){	
			mav.addObject("list", list);
		}
		
		//System.out.println("show pagemake."); 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);		    
	    pageMaker.setTotalCount(guestbookListCountCriteria(cri));
	    mav.addObject("pageMaker", pageMaker);
		
	   
		mav.setViewName("guestBookView");
		return mav;	
	}	

	public int guestbookListCountCriteria(Criteria cri){
		int gbCnt = gbDao.countPaging(cri);
		return gbCnt;
	}
	
	@RequestMapping("/guestbookWrite.do")
	public ModelAndView guestBookWrite(){
		ModelAndView mav = new ModelAndView();
		
		/*String today = gbDao.regdate();
	
		mav.addObject("today", today);*/
		mav.setViewName("guestBook/guestBookWriteForm");
		return mav;	
	}
	
	@RequestMapping(value="/guestbookInsert.do", method = RequestMethod.POST)
	public String guestBookInsert(GuestBookVO vo){
		
		vo.setGuestbook_count(0);
		vo.setGuestbook_hit(0);
		vo.setGuestbook_regdate(new java.sql.Date(new java.util.Date().getTime()));
		gbDao.insert(vo);
				
		return "redirect:/guestbookList.do";
	}
	
	@RequestMapping("/guestbookUpdate.do")
	public ModelAndView guestBookUpdate(int guestbook_idx){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("guestBook/guestBookWriteForm");
		return mav;
	}
	
	@RequestMapping("/guestbookDelete.do")
	public ModelAndView guestBookDelete(int guestbook_idx){
		ModelAndView mav = new ModelAndView();
		gbDao.delete(guestbook_idx);
		list = gbDao.listAll();
		
		if(list.size() != 0){
			mav.addObject("list", list);
		}
		mav.setViewName("guestBookView");
		return mav;
	}
	
	/* 방명록 modal 창에서 insert*/
	/*
	@RequestMapping(value="/mypageNotesInsert.do", method = RequestMethod.POST)
	public String noteInsert(){
		
		String note_writer = (String) session.getAttribute("memberNickname");
		
		nvo.setNote_writer(note_writer);
		nvo.setNote_regdate(new java.sql.Date(new java.util.Date().getTime()));
		nDao.insert(nvo);
		
		
		return "redirect/guestbookList.do";
	}
	*/
	
}