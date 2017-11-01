package com.holo.webapp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.holo.dao.GuestBookDAO;
import com.holo.dao.MemberDAO;
import com.holo.dao.NoteDAO;
import com.holo.dao.ReviewDAO;
import com.holo.vo.GuestBookVO;
import com.holo.vo.MemberVO;
import com.holo.vo.NewsVO;
import com.holo.vo.NoteVO;
import com.holo.vo.ReviewVO;

@Controller
public class MyPageController {
	
	@Autowired
	MemberDAO mDao;
	
	@Autowired
	NoteDAO nDao;
	
	@Autowired
	ReviewDAO rDao;
	
	@Autowired
	GuestBookDAO gbDao;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("/mypage.do")
	public ModelAndView myPageList(){
		ModelAndView mav = new ModelAndView();
		
		String member_id = (String) session.getAttribute("member_id");
		String memberNickname = (String) session.getAttribute("memberNickname");
		
		MemberVO mvo = mDao.memberInfo(member_id);
		
		String note_receiver = (String) session.getAttribute("memberNickname");
		List<NoteVO> noteList = nDao.listReceiver(note_receiver);
		List<GuestBookVO> gbList = gbDao.myPageGuestBooklist(memberNickname);
		List<ReviewVO> reviewList = rDao.listReview(memberNickname);
		
		mav.addObject("mvo", mvo);
		mav.addObject("noteList", noteList);
		mav.addObject("gbList", gbList);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("myPage");
		return mav;
	}
	
	@RequestMapping(value="/mypageNotesInsert.do", method = RequestMethod.POST)
	public ModelAndView notesInsert(NoteVO nvo){
		ModelAndView mav = new ModelAndView();
		String note_writer = (String) session.getAttribute("memberNickname");
		
		String member_id = (String) session.getAttribute("member_id");
		String memberNickname = (String) session.getAttribute("memberNickname");
		
		MemberVO mvo = mDao.memberInfo(member_id);
		
		String note_receiver = (String) session.getAttribute("memberNickname");
		List<NoteVO> noteList = nDao.listReceiver(note_receiver);
		List<GuestBookVO> gbList = gbDao.myPageGuestBooklist(memberNickname);
		List<ReviewVO> reviewList = rDao.listReview(memberNickname);
		
		mav.addObject("mvo", mvo);
		mav.addObject("noteList", noteList);
		mav.addObject("gbList", gbList);
		mav.addObject("reviewList", reviewList);
		
		
		nvo.setNote_writer(note_writer);
		nvo.setNote_regdate(new java.sql.Date(new java.util.Date().getTime()));
		nDao.insert(nvo);
			
		mav .setViewName("myPage");
		return mav;
	}
 
	
	@RequestMapping("/news.do")
	public ModelAndView news() throws IOException{
		ModelAndView mav = new ModelAndView();
		List<NewsVO> newsList = new ArrayList<NewsVO>();
		
		Document doc = Jsoup.connect("http://news.naver.com/main/search/search.nhn?query=%C8%A5%B9%E4&ie=MS949").get();
		
		Elements titles = doc.select("#search_div .tit");
		Elements links = doc.select("#search_div .tit");
		Elements content =doc.select("#search_div .dsc");

		for(int i=0; i<titles.size();i++){
			Element title = titles.get(i);
			Element url = links.get(i);
			Element con = content.get(i);
			
			NewsVO nvo= new NewsVO();
			
			nvo.setTitle(title.text());
			nvo.setUrl(url.attr("abs:href"));
			nvo.setContent(con.text());
			
			newsList.add(i, nvo);
			
			mav.addObject("nvo", nvo);
			
		}
		
		mav.addObject("newsList", newsList);
		
		mav.setViewName("news");
		return mav;
	}

}
