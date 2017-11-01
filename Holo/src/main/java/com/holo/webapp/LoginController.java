package com.holo.webapp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.holo.dao.GuestBookDAO;
import com.holo.dao.MemberDAO;
import com.holo.vo.GuestBookVO;
import com.holo.vo.MemberVO;


@Controller
public class LoginController {
	@Autowired
	GuestBookDAO gbDao;
	@Autowired
	MemberDAO mdao;
	
	@Autowired
	HttpSession session;

	List<GuestBookVO> list;

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(MemberVO vo){
		ModelAndView mav=new ModelAndView();
		vo=mdao.login(vo);
		if(vo != null){	
				session.setAttribute("account", vo);
				session.setAttribute("memberNickname", vo.getMember_nickname());
				session.setAttribute("member_id", vo.getMember_id());
				return "redirect:/list.do";
		} else {
			mav.addObject("msg", "로그인에 실패했습니다");
			
			return "redirect:/";
		}
		
	} 
	
	 @RequestMapping("/logout.do")
		public ModelAndView logout(){
			ModelAndView mav=new ModelAndView();
			if(session != null) {
				session.removeAttribute("account");
			}else {
				mav.addObject("loginForm", "display");
			}
			mav.setViewName("index");
			return mav; 
		} 
	 

		@RequestMapping(value="/join.do", method=RequestMethod.POST)
		public ModelAndView join(MemberVO vo){
			ModelAndView mav=new ModelAndView();
			boolean result =mdao.join(vo);
			mav.addObject("loginForm", "display");
			if (result) {				
				mav.addObject("alertMsg", vo.getMember_name()+"님 회원 가입이 완료되었습니다.");
			} else {			
				mav.addObject("alertMsg", "회원 가입에 실패했어요ㅜㅜ");
			}
			mav.setViewName("index");
			return mav; 
		} 
		
		@RequestMapping("/checkAccount.do")
		public ModelAndView checkAccount(String member_id){
			MemberVO vo = mdao.checkAccount(member_id);
			ModelAndView mav=new ModelAndView();
			if(vo != null){
				mav.addObject("result", "fail");
			} else {
				mav.addObject("result", "ok");
			}
			mav.setViewName("loginJSON");
			return mav; 
		}
}
