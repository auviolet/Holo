package com.holo.webapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.holo.dao.BlogDAO;

@Controller
public class BlogController {
	@Autowired
	private BlogDAO dao;


	
	
	//키워드가 있을때도 있고 없을때도있음 
    //있을때는 가져가고 없을때는 안가져가고 
    @RequestMapping(value="blogList.do", produces = "application/text; charset=utf8")
    public ModelAndView bookList(@RequestParam(required=false)String keyword){
        ModelAndView mav = new ModelAndView();
        if(keyword !=null)
        {
            mav.addObject("blogList",dao.searchBlog(keyword,10,1));
        }
        mav.setViewName("blogList");
        return mav;
    }

}
