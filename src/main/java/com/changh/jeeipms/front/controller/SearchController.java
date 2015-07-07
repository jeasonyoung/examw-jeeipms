package com.changh.jeeipms.front.controller;

import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.service.agency.AgencyServiceI;

@Controller
@RequestMapping("/searchController")
public class SearchController {
	@Autowired
	private AgencyServiceI agencyService;
	
	@RequestMapping(params = "search")
	public ModelAndView search(String keywords,String type,Integer page){
		Integer pagesize = 10;
		if(!StringUtil.isNotEmpty(page)){
			page=1;
		}
		
		//System.out.println(list.size());
		return new ModelAndView();
	}
}
