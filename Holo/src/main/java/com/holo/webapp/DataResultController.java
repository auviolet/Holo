package com.holo.webapp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.holo.dao.BistroDAO;
import com.holo.dao.DataResultDAO;
import com.holo.dao.GuestBookDAO;
import com.holo.dao.MemberDAO;
import com.holo.dao.ReviewDAO;
import com.holo.vo.GPAVO;
import com.holo.vo.GuestBookVO;

@Controller
public class DataResultController {
	
	@Autowired
	MemberDAO mDao;
	@Autowired
	GuestBookDAO gbDao;
	@Autowired
	DataResultDAO drDao;
	@Autowired
	BistroDAO bDao;
	@Autowired
	ReviewDAO rDao;

	@Autowired
	HttpSession session;

	List<GuestBookVO> list;
	
	@RequestMapping("/dataResultList.do")
	public ModelAndView dataResultList(){
		ModelAndView mav = new ModelAndView();

		List<GPAVO> gpalist=drDao.reviewGPARank();
		
		if(gpalist.size()>=5){
			gpalist=gpalist.subList(0,5);
		}
		
		mav.addObject("memberCount", mDao.countMembers());
		mav.addObject("bistroCount", bDao.countBistros());
		mav.addObject("guestbookCount", gbDao.countGuestbooks());
		
		mav.addObject("gpalist", gpalist);
		mav.setViewName("dataResultView");
		return mav;
		
	}

}