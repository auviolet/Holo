package com.holo.webapp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.holo.dao.BistroDAO;
import com.holo.dao.BlogDAO;
import com.holo.dao.DataResultDAO;
import com.holo.dao.ReviewDAO;
import com.holo.vo.BistroCriteria;
import com.holo.vo.BistroPageMaker;
import com.holo.vo.BistroVO;
import com.holo.vo.GPAVO;
import com.holo.vo.ReviewVO;

@Controller
public class ListController {
	@Autowired
	HttpSession session;
	@Autowired
	BistroDAO bDao;
	@Autowired
	ReviewDAO rDao;
	@Autowired
	DataResultDAO drDao;
	@Autowired
	private BlogDAO service;

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView listAll(@ModelAttribute("cri") BistroCriteria cri) {

		List<BistroVO> list = null;
		list = bDao.listCriteria(cri);
		ModelAndView mav = new ModelAndView();

		if (list.size() != 0) {
			mav.addObject("list", list);
		}

		BistroPageMaker bistroPageMaker = new BistroPageMaker();
		bistroPageMaker.setCri(cri);
		bistroPageMaker.setTotalCount(listCountCriteria(cri));
		mav.addObject("bistroPageMaker", bistroPageMaker);

		mav.setViewName("listView");
		return mav;

	}

	public int listCountCriteria(BistroCriteria cri) {

		int tCnt = bDao.countPaging(cri);

		return tCnt;
	}

	@RequestMapping("/search.do")
	public ModelAndView search(String key) {

		List<BistroVO> list = null;
		list = bDao.search(key);

		ModelAndView mav = new ModelAndView();

		if (list.size() != 0 && (key.isEmpty() == false)) {
			mav.addObject("key", key);
			mav.addObject("list", list);
		}

		mav.setViewName("listView");
		return mav;
	}

	@RequestMapping("/intro.do")
	public ModelAndView intro() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("introView");
		return mav;
	}

	@RequestMapping("/listOne.do")
	public ModelAndView listOne(int bistro_idx) {
		List<ReviewVO> list = null;
		BistroVO bvo = bDao.listOne(bistro_idx);
		list = rDao.listReview(bistro_idx);
		List<GPAVO> glist = drDao.reviewGPA(bistro_idx);
		ModelAndView mav = new ModelAndView();
		String name = (String) bvo.getBistro_name();

		if (bvo != null) {
			mav.addObject("bvo", bvo);
			mav.addObject("glist", glist);
			session.setAttribute("bistro_idx", bvo.getBistro_idx());
			if (list.size() != 0) {
				mav.addObject("list", list);
			}
		}

		mav.addObject("blogList", service.searchBlog(name, 10, 1));
		mav.setViewName("listSubView");
		return mav;
	}

	// 釉붾줈洹멸��깋
	@RequestMapping("/blogList.do")
	public ModelAndView bookList(@RequestParam(required = false) String keyword) {
		ModelAndView mav = new ModelAndView();

		if (keyword != null) {
			mav.addObject("blogList", service.searchBlog(keyword, 10, 1));
		}
		mav.setViewName("blogList");
		return mav;
	}

	@RequestMapping(value = "/reviewInsert.do", method = RequestMethod.POST)
	public String insert(ReviewVO vo, @RequestParam("url") String url) {
		ModelAndView mav = new ModelAndView();

		vo.setMember_id((String) session.getAttribute("member_id"));
		vo.setReview_date(new java.sql.Date(new java.util.Date().getTime()));
		vo.setBistro_idx((int) session.getAttribute("bistro_idx"));
		rDao.reviewInsert(vo);

		List<ReviewVO> list = null;
		BistroVO bvo = bDao.listOne(vo.getBistro_idx());
		list = rDao.listReview(vo.getBistro_idx());

		mav.addObject("bvo", bvo);
		mav.addObject("list", list);

		mav.setViewName("listSubView");
		return "redirect:/" + url;

	}

	@RequestMapping("/reviewDelete.do")
	public ModelAndView delete(int review_idx) {
		List<ReviewVO> list = null;
		rDao.reviewDelete(review_idx);
		List<GPAVO> glist = drDao.reviewGPA((int) session.getAttribute("bistro_idx"));
		BistroVO bvo = bDao.listOne((int) session.getAttribute("bistro_idx"));
		list = rDao.listReview((int) session.getAttribute("bistro_idx"));

		ModelAndView mav = new ModelAndView();

		mav.addObject("bvo", bvo);
		mav.addObject("glist", glist);
		mav.addObject("list", list);

		mav.setViewName("listSubView");
		return mav;
	}

}
